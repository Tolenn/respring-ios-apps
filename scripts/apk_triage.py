#!/usr/bin/env python3
"""
apk_triage.py - APK Inspection and iOS IPA Conversion Triage Tool
Part of Respring: Legacy iOS & Cross-Platform Restoration Skill

Analyzes an Android APK, extracts binary metadata, inspects native ELF libraries,
detects the underlying game engine, inventories assets, and scaffolds the iOS
Info.plist and directory layout for modern iOS IPA packaging.
"""

import sys
import os
import zipfile
import struct
import json
import plistlib
import argparse
from pathlib import Path


class AXMLParser:
    """Lightweight pure-python parser to extract strings and metadata from Android Binary XML."""
    def __init__(self, data: bytes):
        self.data = data
        self.strings = []
        self._parse_strings()

    def _parse_strings(self):
        if len(self.data) < 8:
            return
        magic, file_size = struct.unpack('<II', self.data[:8])
        if magic != 0x00080003: # RES_XML_TYPE
            return
        
        offset = 8
        while offset + 8 <= len(self.data):
            chunk_type, chunk_size = struct.unpack('<II', self.data[offset:offset+8])
            if chunk_type == 0x001C0001: # RES_STRING_POOL_TYPE
                self._parse_string_pool(offset, chunk_size)
                break
            if chunk_size == 0:
                break
            offset += chunk_size

    def _parse_string_pool(self, pool_offset: int, pool_size: int):
        data = self.data[pool_offset:pool_offset + pool_size]
        if len(data) < 28:
            return
        string_count, style_count, flags, strings_start, styles_start = struct.unpack('<IIIII', data[8:28])
        is_utf8 = bool(flags & (1 << 8))

        string_offsets = []
        for i in range(string_count):
            off = 28 + i * 4
            if off + 4 <= len(data):
                string_offsets.append(struct.unpack('<I', data[off:off+4])[0])

        actual_strings_start = strings_start
        for off in string_offsets:
            str_pos = actual_strings_start + off
            if str_pos >= len(data):
                continue
            if is_utf8:
                # UTF-8 string: [len bytes] ...
                try:
                    # skip length prefix (1 or 2 bytes)
                    p = str_pos
                    if data[p] & 0x80:
                        p += 2
                    else:
                        p += 1
                    # byte count
                    if p < len(data) and (data[p] & 0x80):
                        p += 2
                    else:
                        p += 1
                    end = data.find(b'\x00', p)
                    if end != -1:
                        s = data[p:end].decode('utf-8', errors='ignore')
                        self.strings.append(s)
                except Exception:
                    pass
            else:
                # UTF-16 string
                try:
                    p = str_pos + 2
                    end = p
                    while end + 2 <= len(data) and data[end:end+2] != b'\x00\x00':
                        end += 2
                    s = data[p:end].decode('utf-16-le', errors='ignore')
                    self.strings.append(s)
                except Exception:
                    pass


def analyze_elf(data: bytes):
    """Parses basic ELF header to identify architecture and bitness."""
    if len(data) < 20 or data[:4] != b'\x7fELF':
        return None
    ei_class = data[4] # 1 = 32-bit, 2 = 64-bit
    ei_data = data[5]  # 1 = little-endian, 2 = big-endian
    endian = '<' if ei_data == 1 else '>'
    e_machine = struct.unpack(f'{endian}H', data[18:20])[0]
    
    arch_map = {
        0x03: 'x86',
        0x28: 'ARM (32-bit, ARMv7)',
        0x3E: 'x86_64',
        0xB7: 'AArch64 (ARM64)',
    }
    
    return {
        'bitness': '64-bit' if ei_class == 2 else '32-bit',
        'machine': arch_map.get(e_machine, f'Unknown (0x{e_machine:02X})'),
        'is_arm': e_machine in (0x28, 0xB7)
    }


def triage_apk(apk_path: str, output_scaffold: str = None):
    print(f"==================================================")
    print(f" Respring APK-to-IPA Triage: {os.path.basename(apk_path)}")
    print(f"==================================================")

    if not os.path.exists(apk_path):
        print(f"Error: File not found: {apk_path}", file=sys.stderr)
        return False

    try:
        apk = zipfile.ZipFile(apk_path, 'r')
    except Exception as e:
        print(f"Error: Not a valid ZIP/APK archive: {e}", file=sys.stderr)
        return False

    namelist = apk.namelist()
    print(f"Total entries in APK: {len(namelist)}")

    # 1. Parse AndroidManifest.xml
    manifest_info = {
        'package': 'com.unknown.game',
        'versionCode': '1',
        'versionName': '1.0',
        'screenOrientation': 'landscape',
        'label': None
    }

    if 'AndroidManifest.xml' in namelist:
        manifest_data = apk.read('AndroidManifest.xml')
        parser = AXMLParser(manifest_data)
        strings = parser.strings
        
        # Heuristic detection from string pool
        for s in strings:
            if '.' in s and not s.startswith('http') and not s.startswith('android.') and len(s.split('.')) >= 3:
                if 'com.' in s or 'org.' in s or 'net.' in s or 'io.' in s:
                    manifest_info['package'] = s
                    break

        for s in strings:
            if s in ('landscape', 'sensorLandscape', 'reverseLandscape'):
                manifest_info['screenOrientation'] = 'landscape'
                break
            elif s in ('portrait', 'sensorPortrait', 'reversePortrait'):
                manifest_info['screenOrientation'] = 'portrait'
                break

    print(f"\n[1] Application Identity:")
    print(f"  Package Name:       {manifest_info['package']}")
    print(f"  Screen Orientation: {manifest_info['screenOrientation']}")

    # 2. Native Libraries Analysis (lib/)
    libs = [n for n in namelist if n.startswith('lib/') and n.endswith('.so')]
    abis = set()
    elf_reports = {}
    engine_detected = "Pure Java / Kotlin (No Native Code)"

    for lib in libs:
        parts = lib.split('/')
        if len(parts) >= 3:
            abi = parts[1]
            abis.add(abi)
            lib_name = parts[-1]
            if abi not in elf_reports:
                elf_data = apk.read(lib)
                elf_info = analyze_elf(elf_data)
                if elf_info:
                    elf_reports[abi] = elf_info

    # Engine Heuristics
    lib_names = [os.path.basename(l) for l in libs]
    if any('unity' in l or 'il2cpp' in l or 'mono' in l for l in lib_names):
        engine_detected = "Unity"
        if any('il2cpp' in l for l in lib_names):
            engine_detected += " (IL2CPP Ahead-Of-Time Native)"
        elif any('mono' in l for l in lib_names):
            engine_detected += " (Mono C# Scripting Backend)"
    elif any('cocos' in l for l in lib_names):
        engine_detected = "Cocos2d-x (C++)"
    elif any('UE4' in l or 'Unreal' in l for l in lib_names):
        engine_detected = "Unreal Engine"
    elif any('godot' in l for l in lib_names):
        engine_detected = "Godot Engine"
    elif any('corona' in l for l in lib_names):
        engine_detected = "Solar2D / Corona SDK"
    elif any('SDL' in l for l in lib_names):
        engine_detected = "Simple DirectMedia Layer (SDL2 / C)"
    elif libs:
        engine_detected = f"Custom Native C/C++ NDK ({', '.join(sorted(set(lib_names[:4])))})"

    print(f"\n[2] Native Code & Engine Classification:")
    print(f"  Detected Engine:    {engine_detected}")
    print(f"  Available ABIs:     {', '.join(sorted(abis)) if abis else 'None (DEX only)'}")
    for abi, report in elf_reports.items():
        print(f"    - {abi}: {report['machine']} ({report['bitness']})")

    # 3. Asset Analysis
    asset_entries = [n for n in namelist if n.startswith('assets/') or n.startswith('res/')]
    audio_files = [n for n in asset_entries if n.endswith(('.ogg', '.wav', '.mp3', '.m4a'))]
    ogg_count = sum(1 for n in audio_files if n.endswith('.ogg'))
    image_files = [n for n in asset_entries if n.endswith(('.png', '.jpg', '.webp', '.pvr', '.ktx'))]
    sqlite_files = [n for n in asset_entries if n.endswith(('.sqlite', '.db'))]

    print(f"\n[3] Asset Inventory:")
    print(f"  Total Asset Files:  {len(asset_entries)}")
    print(f"  Audio Files:        {len(audio_files)} ({ogg_count} OGG audio requiring conversion to CAF/M4A/WAV)")
    print(f"  Image / Textures:   {len(image_files)}")
    print(f"  SQLite Databases:   {len(sqlite_files)}")

    # 4. Conversion & Strategy Assessment
    print(f"\n[4] Strategy & Implementation Recommendations:")
    if "Unity" in engine_detected:
        print("  * Recommended Approach: Asset migration + Target Unity iOS Player host.")
        print("  * Unity assets (.assets, bundles) can be extracted or packaged into an iOS Xcode Unity project.")
    elif "Cocos2d" in engine_detected or "SDL" in engine_detected or "Custom Native" in engine_detected:
        print("  * Recommended Approach: Native ARM ABI translation or Metal/SpriteKit reconstruction.")
        print("  * Android POSIX/C++ code maps cleanly to iOS Darwin APIs.")
        print("  * Replace Android EGL/GLES context with Metal/SpriteKit/CAMetalLayer.")
        print("  * Replace OpenSL ES / AAudio with AVAudioPlayer or AudioUnit.")
    else:
        print("  * Pure Java/DEX app: Bytecode translation via RoboVM/MobiVM or modern Swift/UIKit port.")

    # 5. Scaffolding iOS Info.plist if requested
    if output_scaffold:
        out_dir = Path(output_scaffold)
        out_dir.mkdir(parents=True, exist_ok=True)
        
        bundle_id = manifest_info['package']
        app_name = bundle_id.split('.')[-1].capitalize()
        
        orientations = ["UIInterfaceOrientationLandscapeRight", "UIInterfaceOrientationLandscapeLeft"]
        if manifest_info['screenOrientation'] == 'portrait':
            orientations = ["UIInterfaceOrientationPortrait"]

        plist_data = {
            'CFBundleDevelopmentRegion': 'en',
            'CFBundleDisplayName': app_name,
            'CFBundleExecutable': app_name,
            'CFBundleIdentifier': bundle_id,
            'CFBundleInfoDictionaryVersion': '6.0',
            'CFBundleName': app_name,
            'CFBundlePackageType': 'APPL',
            'CFBundleShortVersionString': manifest_info['versionName'],
            'CFBundleVersion': manifest_info['versionCode'],
            'LSRequiresIPhoneOS': True,
            'UIRequiresFullScreen': True,
            'UIStatusBarHidden': True,
            'UIViewControllerBasedStatusBarAppearance': False,
            'UISupportedInterfaceOrientations': orientations,
            'UIRequiredDeviceCapabilities': ['arm64'],
            'UILaunchScreen': {}
        }
        
        plist_path = out_dir / 'Info.plist'
        with open(plist_path, 'wb') as fp:
            plistlib.dump(plist_data, fp)
        print(f"\n[5] Scaffold Created:")
        print(f"  Wrote iOS Info.plist to: {plist_path}")
        print(f"  Bundle Identifier:       {bundle_id}")

    print(f"\n==================================================")
    print(f" Triage Complete.")
    print(f"==================================================")
    return True


if __name__ == '__main__':
    parser = argparse.ArgumentParser(description="Triage Android APK for iOS IPA conversion.")
    parser.add_argument("apk", help="Path to the Android APK file to analyze.")
    parser.add_argument("--scaffold", "-s", help="Output directory to scaffold the iOS Info.plist and structure.", default=None)
    args = parser.parse_args()

    triage_apk(args.apk, args.scaffold)

