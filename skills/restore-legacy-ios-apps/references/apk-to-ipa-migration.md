# Android APK to Modern iOS IPA Migration Reference

This document provides technical guidelines and operational workflows for decompiling, reverse engineering, and restoring Android APK games into modern, compliant iOS IPA packages for deployment on modern iOS (iOS 15–18) via SideStore, AltStore, LiveContainer, TrollStore, and Xcode.

---

## 1. APK Architecture & Engine Triage

Android APKs are standard ZIP archives containing compiled bytecode (`classes.dex`), binary XML resources (`AndroidManifest.xml`), native shared objects (`lib/<abi>/lib*.so`), and game assets (`assets/` and `res/`).

Use the included pure-Python triage tool:
```bash
python scripts/apk_triage.py path/to/game.apk --output LittleGenerals/Info.plist
```

### Key Detection Signals

| Engine | Native ELF Markers | Asset Markers | Bytecode Markers |
| :--- | :--- | :--- | :--- |
| **Solar2D / Corona** | `libcorona.so`, `liblua.so`, `libjnlua5.1.so` | `assets/resource.car`, `res/`, `Default-Landscape.png` | Lua 5.1 bytecode (`\x1bLuaQ`) |
| **Unity** | `libunity.so`, `libmain.so`, `libil2cpp.so` | `assets/bin/Data/`, `.assets`, `globalgamemanagers` | C# IL2CPP metadata / DLLs |
| **Cocos2d-x** | `libcocos2dcpp.so`, `libcocosdenshion.so` | `assets/`, `.plist`, `.pvr.ccz`, `.exportjson` | C++ native binary / Lua scripts |
| **Unreal Engine** | `libUE4.so`, `libUnrealEngine.so` | `assets/Content/`, `.pak` files | Native UE4 / UE5 runtime |
| **Godot** | `libgodot_android.so` | `assets/*.pck` | GDScript / GDNative |

---

## 2. Solar2D / Corona SDK `resource.car` Architecture

Corona SDK / Solar2D stores all core Lua modules inside an encrypted or containerized archive named `resource.car` inside `assets/`.

### Binary Layout of `resource.car`

1. **Header (16 bytes)**:
   - `0x00..0x03`: Magic bytes `rac\x01` (`0x72 0x61 0x63 0x01`).
   - `0x04..0x07`: Unknown / format flags (uint32).
   - `0x08..0x0B`: Header size in bytes (uint32, typically 10192).
   - `0x0C..0x0F`: Total file count (uint32).

2. **Table of Contents (TOC)**:
   Iterated `file_count` times:
   - `0x00..0x03`: Entry type flag (uint32, always 1).
   - `0x04..0x07`: Absolute offset to data block (uint32).
   - `0x08..0x0B`: Filename string length in bytes (`name_len`, uint32).
   - `0x0C..0x0C+name_len`: Filename bytes (null-terminated string).
   - **Padding**: 4-byte alignment following `name_len`:
     $$\text{pad} = 4 - (\text{name\_len} \pmod 4)$$

3. **Data Blocks**:
   At each `file_offset`:
   - `0x00..0x03`: Data block type (uint32, always 2).
   - `0x04..0x07`: Total block size (uint32).
   - `0x08..0x0B`: Exact payload size (`payload_size`, uint32).
   - `0x0C..0x0C+payload_size`: Compiled Lua 5.1 bytecode (`\x1bLuaQ...`).

### Extraction Tool: `car_unpack.py`
```bash
python scripts/car_unpack.py "path/to/game.apk" -o "extracted_car/"
python scripts/car_unpack.py "path/to/resource.car" --list
```

---

## 3. Asset Hierarchy Normalization

In Solar2D and standard iOS applications, files referenced in Lua or code assume root-relative bundle paths. When extracting from an Android APK:
1. Strip Android-only metadata: `META-INF/`, `classes.dex`, `resources.arsc`, `com/google/i18n/`.
2. Normalize `assets/` so its children map directly into the iOS bundle root.
3. Preserve all audio (`.mp3`, `.wav`, `.caf`, `.ogg`), sprite sheets, textures (`.png`), fonts (`.ttf`), and data tables (`.csv`).

Extract using `apk_extract.py`:
```bash
python scripts/apk_extract.py "path/to/game.apk" -o "App/Resources/"
```

---

## 4. Modern iOS Packaging Requirements

To prevent installation errors across SideStore, AltStore, LiveContainer, and TrollStore:

1. **Flat Bundle Layout**:
   All root resources, icons, databases, and fonts must be copied directly into `Payload/App.app/` without an enclosing `Resources/` folder in the final IPA.

2. **Explicit Code Signature Identifier**:
   Ad-hoc signing must bind the bundle identifier into the CodeDirectory:
   ```bash
   codesign --force --sign - \
            --identifier "com.smarterapps.littlegenerals" \
            --generate-entitlement-der \
            --timestamp=none \
            "Payload/LittleGenerals.app"
   ```

3. **DER Entitlements**:
   iOS 15+ kernel enforces DER-formatted entitlements (`--generate-entitlement-der`).

4. **Executable Binary Validation**:
   The executable referenced by `CFBundleExecutable` in `Info.plist` must exist at `Payload/App.app/<CFBundleExecutable>` with executable permissions (`chmod +x`).

---

## 5. Case Study: *Little Generals*

- **Bundle ID**: `com.smarterapps.littlegenerals`
- **Original Engine**: Solar2D / Corona SDK
- **Artifacts Restored**:
  - 269 compiled Lua scripts extracted from `resource.car`.
  - 749 genuine game textures, maps, sounds, and fonts extracted from APK.
  - Full SpriteKit & AVFoundation native reconstruction in Swift with authentic ballistic physics, elevation deformation, wind resistance, and dialog engine from `trashtalk.csv`.

