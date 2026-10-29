#!/usr/bin/env python3
r"""
apk_extract.py - APK Game Asset & Resource Extractor
Part of Respring: Legacy iOS & Cross-Platform Restoration Skill

Extracts and organizes game assets, audio, textures, and engine bundles from an
Android APK for iOS restoration and packaging. Strips Android-specific binaries
and metadata while preserving the full asset hierarchy.

Usage:
    python scripts/apk_extract.py "Little Generals/little-generals-2-5 (1).apk" -o "Little Generals/LittleGenerals/Resources"
"""

import sys
import os
import zipfile
import argparse
from pathlib import Path


# File extensions and paths to ignore (Android-only runtime or signing files)
IGNORE_EXTENSIONS = {'.dex', '.sf', '.rsa', '.mf'}
IGNORE_PREFIXES = {'META-INF/', 'com/google/i18n/'}


def extract_game_assets(apk_path: Path, output_dir: Path, include_car: bool = True):
    """
    Extracts all game-relevant assets from an APK into output_dir.
    Normalizes 'assets/' prefix so that resources map directly into the iOS bundle root.
    """
    if not zipfile.is_zipfile(apk_path):
        raise ValueError(f"File is not a valid zip archive: {apk_path}")

    output_dir.mkdir(parents=True, exist_ok=True)
    extracted_count = 0
    total_bytes = 0

    with zipfile.ZipFile(apk_path, 'r') as z:
        for info in z.infolist():
            filename = info.filename
            
            # Skip directories
            if filename.endswith('/'):
                continue

            # Skip Android platform metadata & signatures
            if any(filename.startswith(prefix) for prefix in IGNORE_PREFIXES):
                continue
            if any(filename.lower().endswith(ext) for ext in IGNORE_EXTENSIONS):
                continue
            if filename == 'AndroidManifest.xml' or filename == 'resources.arsc':
                continue

            # Determine destination path
            # If inside assets/, map directly to bundle root (matching Solar2D / Corona iOS structure)
            if filename.startswith('assets/'):
                rel_path = filename[len('assets/'):]
            else:
                rel_path = filename

            dest_path = output_dir / rel_path
            dest_path.parent.mkdir(parents=True, exist_ok=True)

            with z.open(info) as src, open(dest_path, 'wb') as dst:
                data = src.read()
                dst.write(data)
                extracted_count += 1
                total_bytes += len(data)

    print(f"Extracted {extracted_count} game asset files ({total_bytes / (1024*1024):.2f} MB) to {output_dir.resolve()}.")
    return extracted_count


def main():
    parser = argparse.ArgumentParser(description="Extract game assets from an APK for iOS restoration.")
    parser.add_argument("apk", type=Path, help="Path to input APK file")
    parser.add_argument("-o", "--output", type=Path, required=True, help="Destination directory for assets")

    args = parser.parse_args()
    if not args.apk.exists():
        print(f"Error: APK not found: {args.apk}", file=sys.stderr)
        sys.exit(1)

    extract_game_assets(args.apk, args.output)


if __name__ == "__main__":
    main()
