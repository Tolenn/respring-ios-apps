#!/usr/bin/env python3
r"""
car_unpack.py - Solar2D / Corona SDK Resource.car Unpacker
Part of Respring: Legacy iOS & Cross-Platform Restoration Skill

Extracts compiled Lua bytecode and assets from Corona SDK / Solar2D `resource.car` archives.
Can extract directly from a standalone .car file or from an Android APK containing assets/resource.car.

Usage:
    python scripts/car_unpack.py Little Generals/little-generals-2-5\ (1).apk -o "Little Generals/extracted_car"
    python scripts/car_unpack.py path/to/resource.car --list
"""

import sys
import os
import struct
import zipfile
import argparse
from pathlib import Path


CAR_MAGIC = b'rac\x01'
ENTRY_HEADER_SIZE = 12
BLOCK_HEADER_SIZE = 12


def read_car_bytes(input_path: Path) -> bytes:
    """Reads resource.car bytes from a .car file or extracts it from an APK zip."""
    if zipfile.is_zipfile(input_path):
        with zipfile.ZipFile(input_path, 'r') as z:
            # Common locations inside APK
            candidates = ['assets/resource.car', 'resource.car']
            for c in candidates:
                if c in z.namelist():
                    print(f"Found archive entry '{c}' inside {input_path.name}")
                    return z.read(c)
            # Search all names
            for name in z.namelist():
                if name.endswith('resource.car') or name.endswith('.car'):
                    print(f"Found archive entry '{name}' inside {input_path.name}")
                    return z.read(name)
            raise ValueError(f"No resource.car found inside {input_path.name}")
    else:
        with open(input_path, 'rb') as f:
            return f.read()


def parse_car(data: bytes):
    """
    Parses resource.car binary buffer.
    Returns list of dicts: [{'name': str, 'offset': int, 'payload_size': int, 'data': bytes}]
    """
    if len(data) < 16:
        raise ValueError("File too small to be a valid resource.car archive.")

    magic = data[:4]
    if magic != CAR_MAGIC:
        raise ValueError(f"Invalid magic: expected {CAR_MAGIC!r}, got {magic!r}")

    unk, header_size, file_count = struct.unpack('<III', data[4:16])
    entries = []
    pos = 16

    for i in range(file_count):
        if pos + ENTRY_HEADER_SIZE > len(data):
            break
        entry_type, file_offset, name_len = struct.unpack('<III', data[pos:pos + ENTRY_HEADER_SIZE])
        name_bytes = data[pos + ENTRY_HEADER_SIZE : pos + ENTRY_HEADER_SIZE + name_len]
        name = name_bytes.rstrip(b'\x00').decode('utf-8', errors='ignore')
        
        # 4-byte padding formula verified across Corona/Solar2D car format
        pad = 4 - (name_len % 4)
        pos += ENTRY_HEADER_SIZE + name_len + pad

        if file_offset + BLOCK_HEADER_SIZE <= len(data):
            dtype, bsize, psize = struct.unpack('<III', data[file_offset:file_offset + BLOCK_HEADER_SIZE])
            payload = data[file_offset + BLOCK_HEADER_SIZE : file_offset + BLOCK_HEADER_SIZE + psize]
            entries.append({
                'name': name,
                'offset': file_offset,
                'payload_size': psize,
                'data': payload
            })
        else:
            entries.append({
                'name': name,
                'offset': file_offset,
                'payload_size': 0,
                'data': b''
            })

    return entries


def unpack_car(input_path: Path, output_dir: Path = None, list_only: bool = False):
    """Unpacks or lists the contents of a resource.car archive."""
    print(f"Reading {input_path}...")
    car_bytes = read_car_bytes(input_path)
    entries = parse_car(car_bytes)
    print(f"Archive parsed successfully: {len(entries)} items found.")

    if list_only:
        print(f"\n{'Name':<45} {'Size (bytes)':>12} {'Offset':>10}")
        print("-" * 70)
        for e in entries:
            print(f"{e['name']:<45} {e['payload_size']:>12} {e['offset']:>10}")
        return

    if output_dir is None:
        output_dir = input_path.parent / (input_path.stem + "_extracted")

    output_dir.mkdir(parents=True, exist_ok=True)
    print(f"Extracting {len(entries)} items to {output_dir}...")

    extracted_count = 0
    for e in entries:
        out_file = output_dir / e['name']
        out_file.parent.mkdir(parents=True, exist_ok=True)
        with open(out_file, 'wb') as f:
            f.write(e['data'])
        extracted_count += 1

    print(f"Extracted {extracted_count} files to {output_dir.resolve()}.")


def main():
    parser = argparse.ArgumentParser(description="Solar2D / Corona SDK resource.car Unpacker")
    parser.add_argument("input", type=Path, help="Path to resource.car or APK file")
    parser.add_argument("-o", "--output", type=Path, default=None, help="Output directory")
    parser.add_argument("--list", action="store_true", help="List contents without extracting")

    args = parser.parse_args()
    if not args.input.exists():
        print(f"Error: file not found: {args.input}", file=sys.stderr)
        sys.exit(1)

    unpack_car(args.input, args.output, args.list)


if __name__ == "__main__":
    main()
