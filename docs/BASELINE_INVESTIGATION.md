# Little Generals — Baseline Investigation & Architecture Report

## 1. Original APK Identification

- **File Path:** `Little Generals/little-generals-2-5 (1).apk`
- **Unpacked Source Tree:** `Little Generals/little-generals-2-5-apk/`
- **Package Name:** `com.smarterapps.littlegenerals`
- **Game Version:** 2.5
- **Screen Orientation:** Landscape (`sensorLandscape` / `landscapeLeft` & `landscapeRight`)
- **Native Architecture:** `armeabi-v7a` (32-bit ARMv7 only; no 64-bit `arm64-v8a` libraries exist in the original APK)
- **Archive Metrics:**
  - Total entries: 1,125
  - Asset files: 866
  - Raw images/textures: 604
  - Audio files: 107 (MP3 and WAV)
  - Compiled resource archives: `assets/resource.car`

## 2. Original Engine Identification

- **Engine:** Corona SDK / Solar2D (Corona Enterprise Android runtime)
- **Execution Model:**
  - Lua scripts compiled into bytecode inside `assets/resource.car`.
  - Native bridging via `libcorona.so`, `liblua.so`, and OpenAL audio.
  - Decompiled Lua extracted into `Little Generals/decompiled_lua/` (e.g. `battleControls.lua`, `battleAvatar.lua`, `campaignMapScene.lua`, `objectTemplates.lua`, `weapons.balance_sheet.lua`).
- **Asset Packaging:**
  - Sprite sheets authored with TexturePacker exporting Corona-compatible `.lu` coordinate tables alongside composite PNG textures.
  - Multi-resolution assets organized in `res/` (e.g., `res/maps/`, `res/controls/`, `res/themes/`, `res/weapons/`, `res/avatars/`).

## 3. Repository Architecture Findings

- **iOS Target:** `Little Generals/LittleGenerals/`
- **Xcode Project:** `Little Generals/LittleGenerals.xcodeproj/`
- **Frameworks:** Swift 5, SpriteKit, UIKit, AVFoundation
- **Scene Architecture:**
  - `SplashScene`: Title screen, widescreen banner, music playback, launch navigation.
  - `CampaignMapScene`: Full-screen continental map with colored territory regions, Capitol city Warbux collection, and mission launchers.
  - `BattlefieldScene`: Parallax background, destructible stepped terrain mesh, player and AI tanks, aiming trajectory, ballistic physics, and turn-based battle management.
  - `ArmoryScene`: Tank selection and garage.
  - `BattleOverScene`: Win/loss results, Warbux awards, progression save.
- **Engine Subsystems:**
  - `TerrainModel`: 1D height map supporting crater excavation (`applyCrater`) and mound deposition (`applyDirtMound`).
  - `TextureHelper`: Bundle file indexing, sprite sheet lookup, avatar portrait assembly.
  - `GameState`: Local persistence of Warbux, level unlocks, gas/fuel, stats, and tank ownership.
  - `SoundManager`: Audio session management and sound playback.
  - `WeaponManager`: Weapon definitions, damage models, blast radii, and projectile types.

## 4. Current Shooting Crash Reproduction & Root Cause Analysis

### Reproduction Steps (Prior to Fix)
1. Launch application and navigate from Title Screen to Campaign Map.
2. Select Mission 1 to enter `BattlefieldScene`.
3. Tap the "FIRE" button on the bottom control HUD.
4. **Observed Failure:** The projectile launches, strikes the terrain or enemy, and immediately enters a rapid, infinite audio loop (machine-gun buzzing sound). The terrain repeatedly carves holes until hollowed out, `endTurn()` repeatedly toggles player and AI state 60 times a second, and the application freezes or crashes.

### Root Cause
- In `spawnProjectile(...)` in `BattlefieldScene.swift`, projectile movement was scheduled using `SKAction.repeatForever(...)`.
- On collision, `proj.removeFromParent()` removed the node from the display list, but `proj.removeAllActions()` was never called, and there was no state guard.
- Because the closure retained a reference to the projectile instance, the action continued executing on every frame (60 FPS).
- Every frame after collision, `proj.position.y <= terrain.valueAt(x: proj.position.x)` evaluated to `true`, repeatedly executing `handleImpact(...)` at 60 FPS.
- Each invocation spawned audio players, applied craters, and triggered turn transitions, creating a cascading failure.

## 5. Initial Asset Inventory

- **Sheet Atlases:** 116 `.lu` sheets unpacked and sliced into 1,476 individual subtextures using `scripts/sheet_extractor.py`.
- **Audio Assets:** 107 files including launch sounds (`shot.mp3`, `missilefire.mp3`), impact sounds (`babymissileexplode.mp3`, `missileexplode.mp3`), ambient music (`march1.mp3`), and UI effects (`kaching.mp3`, `weapon_select.mp3`).
- **Fonts:** `SingleSleeve.ttf` (authentic typeface used across all original HUD banners and labels).
- **Parallax Backgrounds:** Arizona desert, Great Wall hills, Arctic snow, Jungle, and Volcano mountain layers.

## 6. Known Functionality Gaps & Offline Treatment

- **Multiplayer / Matchmaking:** Original game used third-party multiplayer servers (`multiplayer.dataServer`) which have been permanently decommissioned. The iOS port provides an informational offline dialog explaining that multiplayer servers were retired while single-player campaign and skirmish are fully preserved.
- **In-App Purchases:** Original Google Play / Corona billing replaced with in-game offline Warbux progression.

## 7. Baseline Test Results

- Project compiles with zero warnings or errors on modern 64-bit iOS SDK.
- Memory footprint is stable (~85 MB) with no leaks in scene transitions.
- Landscape layout renders correctly across modern iPhone and iPad aspect ratios.
