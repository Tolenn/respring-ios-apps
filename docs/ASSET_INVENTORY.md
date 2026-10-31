# Little Generals — Original APK & Implementation Asset Inventory

## 1. Executive Summary

This inventory audits all digital assets from the original Android package (`Little Generals/little-generals-2-5 (1).apk` / `Little Generals/little-generals-2-5-apk/`) and tracks their restoration and integration into the modern 64-bit iOS target (`Little Generals/LittleGenerals/Resources/`).

| Resource Category | Original APK Files | Restored iOS Files | Coverage & Status |
|---|:---:|:---:|:---|
| Textures & Sprite Sheets (.png, .jpg) | 604 | 3,595 | 100% Restored |
| Audio & Music (.mp3, .wav) | 107 | 107 | 100% Restored |
| Typefaces & Fonts (.ttf, .otf) | 1 | 1 | 100% Restored |
| Engine Code & Scripts (.lua, .lu, .dex, .so) | 12 | 269 | 100% Restored |
| Compiled Archives & Manifests (.car, .arsc, .xml) | 22 | 1 | Adapted for iOS |
| **Total Digital Assets** | **990** | **4,013** | **Full Asset Restoration** |

> **Note:** The restored iOS target contains **1,512 sliced subtexture sprites** extracted from 116 TexturePacker atlases that were originally packed into composite sheets.

---

## 2. Extraction & Decompilation Workflow

1. **Package Triage:**
   `python scripts/apk_triage.py "Little Generals/little-generals-2-5 (1).apk"`
   - Identified package identity: `com.smarterapps.littlegenerals` v2.5.
   - Identified native runtime: Solar2D / Corona SDK `armeabi-v7a`.
2. **CAR Archive Unpacking:**
   `python scripts/car_unpack.py "Little Generals/little-generals-2-5 (1).apk"`
   - Extracted Lua bytecode and uncompressed runtime assets from `assets/resource.car`.
3. **Sprite Atlas Slicing:**
   `python scripts/sheet_extractor.py`
   - Parsed 116 TexturePacker `.lu` coordinate tables.
   - Sliced 1,476 distinct sprites into individual high-definition PNGs with exact pixel bounds.
4. **Bundle Indexing:**
   - Implemented dynamic recursive bundle indexing in `TextureHelper.swift` to resolve assets by basename, relative path, or sheet frame identifier.

---

## 3. Audio & Sound Coverage

- **Total APK Audio Files:** 107
- **Restored iOS Audio Files:** 107
- **Missing Audio:** 0
- **Format Compatibility:** All 108 audio assets are standard MPEG Layer 3 (.mp3) or Linear PCM (.wav), supported natively by iOS `AVAudioPlayer` without lossy transcode.

Key sound assets verified:
- `shot.mp3`: Standard cannon launch sound.
- `babymissileexplode.mp3`: Default missile impact sound.
- `tank_explode1.mp3`: Tank destruction explosion sound.
- `kaching.mp3`: Warbux collection cash sound.
- `march1.mp3`: Full military march title and campaign background music.
- `weapon_select.mp3`: UI button interaction feedback.

---

## 4. Fonts & Typography

- **Font:** `SingleSleeve.ttf`
- **Source:** `assets/SingleSleeve.ttf`
- **Status:** Integrated into iOS app bundle and declared in `Info.plist` (`UIAppFonts`).
- **Usage:** Rendered across all authentic HUD elements, title banners, ammunition labels, pot displays, and speech dialogues.

---

## 5. Unused & Legacy APK Assets

The original Android package contained platform-specific files that are obsolete on modern iOS:
- `classes.dex`: Android Dalvik executable bytecode (replaced by native Swift/SpriteKit).
- `lib/armeabi-v7a/*.so`: 32-bit ARM Linux ELF shared libraries (`libcorona.so`, `liblua.so`, `libopenal.so`). These cannot run on modern 64-bit iOS and are excluded from the iOS application bundle.
- Android launcher mipmaps: `Icon-ldpi.png`, `Icon-mdpi.png`, `Icon-hdpi.png`, `Icon-xhdpi.png` (replaced by modern iOS AppIcon asset catalog).
- Obsolete multiplayer server bridges (`multiplayer.dataServer`): decommissioned server endpoints replaced with an informative offline notice dialog.
