#!/usr/bin/env python3
r"""
sheet_extractor.py - Corona / Solar2D Sprite Sheet & Atlas Slicer
Part of Respring: Legacy iOS & Cross-Platform Restoration Skill

Parses compiled Lua bytecode (.lu) containing getSpriteSheetData / textureRect definitions,
resolves frame bounds, and crops authentic 32-bit RGBA subtextures from master atlas sheets.
Solves missing/scrambled textures when porting legacy games to modern iOS.

Usage:
    python scripts/sheet_extractor.py --car-dir "Little Generals/extracted_car" --res-dir "Little Generals/LittleGenerals/Resources"
"""

import os
import sys
import struct
import argparse
from pathlib import Path
from PIL import Image


def parse_lua_sheet(lu_data: bytes):
    """
    Parses a compiled Lua 5.1 chunk and extracts frames:
    [{'name': str, 'textureRect': {'x': float, 'y': float, 'width': float, 'height': float}, 'textureRotated': bool}]
    """
    def parse_proto(offset: int):
        if offset + 4 > len(lu_data):
            return {'code': [], 'constants': [], 'protos': []}, offset
        str_len = struct.unpack('<I', lu_data[offset:offset+4])[0]
        offset += 4 + str_len if str_len > 0 else 4
        if offset + 16 > len(lu_data):
            return {'code': [], 'constants': [], 'protos': []}, offset
        linedefined, lastlinedefined = struct.unpack('<II', lu_data[offset:offset+8])
        offset += 8
        nups, nparams, is_vararg, maxstack = struct.unpack('BBBB', lu_data[offset:offset+4])
        offset += 4
        if offset + 4 > len(lu_data):
            return {'code': [], 'constants': [], 'protos': []}, offset
        code_size = struct.unpack('<I', lu_data[offset:offset+4])[0]
        offset += 4
        code = [struct.unpack('<I', lu_data[offset+i*4:offset+i*4+4])[0] for i in range(code_size) if offset+i*4+4 <= len(lu_data)]
        offset += code_size * 4
        if offset + 4 > len(lu_data):
            return {'code': code, 'constants': [], 'protos': []}, offset
        k_size = struct.unpack('<I', lu_data[offset:offset+4])[0]
        offset += 4
        constants = []
        for _ in range(k_size):
            if offset >= len(lu_data):
                break
            k_type = lu_data[offset]
            offset += 1
            if k_type == 0:
                constants.append(None)
            elif k_type == 1:
                constants.append(lu_data[offset] != 0 if offset < len(lu_data) else False)
                offset += 1
            elif k_type == 3:
                val = struct.unpack('<d', lu_data[offset:offset+8])[0] if offset + 8 <= len(lu_data) else 0.0
                constants.append(val)
                offset += 8
            elif k_type == 4:
                if offset + 4 > len(lu_data):
                    break
                s_len = struct.unpack('<I', lu_data[offset:offset+4])[0]
                offset += 4
                s = lu_data[offset:offset+s_len].rstrip(b'\x00').decode('utf-8', errors='ignore') if (s_len > 0 and offset + s_len <= len(lu_data)) else ''
                constants.append(s)
                offset += s_len
            else:
                constants.append(None)
        if offset + 4 > len(lu_data):
            return {'code': code, 'constants': constants, 'protos': []}, offset
        p_size = struct.unpack('<I', lu_data[offset:offset+4])[0]
        offset += 4
        protos = []
        for _ in range(p_size):
            if offset >= len(lu_data):
                break
            sub_p, offset = parse_proto(offset)
            protos.append(sub_p)
        # Skip Lua 5.1 debug info (sizelineinfo, sizelocvars, sizeupvalues) so sibling protos align
        if offset + 4 <= len(lu_data):
            lineinfo_size = struct.unpack('<I', lu_data[offset:offset+4])[0]
            offset += 4 + lineinfo_size * 4
        if offset + 4 <= len(lu_data):
            locvars_size = struct.unpack('<I', lu_data[offset:offset+4])[0]
            offset += 4
            for _ in range(locvars_size):
                if offset + 4 > len(lu_data):
                    break
                s_len = struct.unpack('<I', lu_data[offset:offset+4])[0]
                offset += 4 + s_len + 8
        if offset + 4 <= len(lu_data):
            upval_size = struct.unpack('<I', lu_data[offset:offset+4])[0]
            offset += 4
            for _ in range(upval_size):
                if offset + 4 > len(lu_data):
                    break
                s_len = struct.unpack('<I', lu_data[offset:offset+4])[0]
                offset += 4 + s_len
        return {'code': code, 'constants': constants, 'protos': protos}, offset

    root, _ = parse_proto(12)
    target_proto = None
    for p in root['protos']:
        if 'textureRect' in p['constants']:
            target_proto = p
            break
    if not target_proto:
        return []

    code = target_proto['code']
    k = target_proto['constants']

    R = {}
    frames = []
    current_frame = {}

    def get_rk(val):
        if val >= 256:
            return k[val - 256]
        return R.get(val)

    for instr in code:
        op = instr & 0x3F
        a = (instr >> 6) & 0xFF
        c = (instr >> 14) & 0x1FF
        b = (instr >> 23) & 0x1FF

        if op == 10: # NEWTABLE
            R[a] = {}
        elif op == 1: # LOADK
            R[a] = k[(instr >> 14) & 0x3FFFF]
        elif op == 2: # LOADBOOL
            R[a] = (b != 0)
        elif op == 9: # SETTABLE
            key = get_rk(b)
            val = get_rk(c)
            if isinstance(R.get(a), dict):
                R[a][key] = val
                if key == 'name' and isinstance(val, str) and val.endswith('.png'):
                    if 'name' in current_frame and 'textureRect' in current_frame:
                        frames.append(current_frame)
                    current_frame = {'name': val}
                elif key == 'textureRect' and isinstance(val, dict):
                    current_frame['textureRect'] = val
                elif key == 'textureRotated':
                    current_frame['textureRotated'] = val

    if 'name' in current_frame and 'textureRect' in current_frame:
        frames.append(current_frame)

    return frames


def process_all_sheets(car_dir: Path, res_dir: Path):
    """Finds all Lua sheets, matches master PNGs, and crops individual subtextures."""
    extracted_total = 0

    # Build image map from res_dir (both relative path and filename)
    image_map = {}
    rel_image_map = {}
    original_files = set()
    for p in res_dir.rglob('*.png'):
        if '_frames' in p.parts:
            continue
        original_files.add(p.resolve())
        image_map[p.name.lower()] = p
        try:
            rel_key = p.relative_to(res_dir).as_posix().lower()
            rel_image_map[rel_key] = p
        except ValueError:
            pass

    for lu_file in sorted(car_dir.glob('*.lu')):
        if not lu_file.name.startswith('res.') and 'sheet' not in lu_file.name.lower():
            continue
        with open(lu_file, 'rb') as f:
            data = f.read()

        if b'textureRect' not in data or b'getSpriteSheetData' not in data:
            continue

        frames = parse_lua_sheet(data)
        if not frames:
            continue

        # 1. Try exact relative path match: e.g. 'res.weapons.parachute.lu' -> 'res/weapons/parachute.png'
        rel_candidate = lu_file.stem.replace('.', '/').lower() + '.png'
        master_img_path = rel_image_map.get(rel_candidate)

        # 2. Fallback to stem filename match: e.g. 'res.weapons.weapon_icons.lu' -> 'weapon_icons.png'
        if not master_img_path:
            stem = lu_file.stem.split('.')[-1].lower() + '.png'
            master_img_path = image_map.get(stem)

        if not master_img_path:
            for candidate in image_map.keys():
                if candidate.replace('.png', '') in lu_file.stem.lower():
                    master_img_path = image_map[candidate]
                    break

        if not master_img_path or not master_img_path.exists():
            continue

        try:
            with Image.open(master_img_path) as master_img:
                out_folder = master_img_path.parent / (master_img_path.stem + "_frames")
                out_folder.mkdir(parents=True, exist_ok=True)

                for frame in frames:
                    name = frame['name']
                    rect = frame.get('textureRect', {})
                    if 'x' not in rect or 'width' not in rect:
                        continue
                    x = int(rect['x'])
                    y = int(rect['y'])
                    w = int(rect['width'])
                    h = int(rect['height'])

                    if w <= 0 or h <= 0 or x + w > master_img.width or y + h > master_img.height:
                        continue

                    cropped = master_img.crop((x, y, x + w, y + h))
                    if frame.get('textureRotated'):
                        cropped = cropped.transpose(Image.ROTATE_270)

                    # Always save into *_frames subfolder
                    cropped.save(out_folder / name)
                    # Only save into master parent if it does NOT overwrite an original standalone/master PNG
                    parent_dest = master_img_path.parent / name
                    if parent_dest.resolve() not in original_files:
                        cropped.save(parent_dest)
                    extracted_total += 1
                print(f"Processed {lu_file.name} -> {len(frames)} sprites cropped from {master_img_path.name}")
        except Exception as e:
            print(f"Warning processing {lu_file.name}: {e}")

    print(f"\nSuccessfully sliced {extracted_total} authentic native sprites!")
    return extracted_total


def main():
    parser = argparse.ArgumentParser(description="Corona / Solar2D Sprite Sheet & Atlas Slicer")
    parser.add_argument("--car-dir", type=Path, required=True, help="Directory containing unpacked .lu files")
    parser.add_argument("--res-dir", type=Path, required=True, help="Directory containing game image assets")

    args = parser.parse_args()
    process_all_sheets(args.car_dir, args.res_dir)


if __name__ == "__main__":
    main()
