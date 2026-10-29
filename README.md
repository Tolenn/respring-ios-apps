<p align="center">
  <img src="docs/images/RespringSkillHeader.webp" width="800" alt="Respring Skill">
</p>

# Respring — Legacy iOS & Cross-Platform Restoration Skill

A reusable AI skill for restoring classic 32-bit iOS games and porting legacy Android APKs into modern, sideload-ready 64-bit iOS IPAs while preserving their original behavior. Built from the Chuzzle, Koi Pond, Skee-Ball, Skee Free, Skee-Ball HD, Peggle, Peggle HD, Finger Olympic, and Little Generals engineering restorations.

It guides an agent through binary intake (Mach-O & APK), execution-strategy selection, compatibility diagnosis, rendering and timing fixes, bounded native acceleration, save migration, and reproducible delivery.

## Features & Supported Workflows

- **Legacy 32-bit iOS App Restoration**: ARMv7 / ARMv7s Mach-O triage, CgBI uncrushing (`xcrun pngcrush -revert-iphone-optimizations`), Zwoptex sprite extraction, and modern 64-bit Swift/SpriteKit reproduction.
- **Cross-Platform APK to iOS IPA Conversion**: Binary Android XML parsing, native ELF inspection, engine detection (Solar2D/Corona, Unity, Cocos2d-x, Unreal), asset hierarchy normalization, and `resource.car` Lua bytecode extraction.
- **Modern Sideload Packaging**: Ad-hoc code signing with bound bundle identifiers (`-i <id>`), embedded DER entitlements (`--generate-entitlement-der`), and flat `.app` directory structures designed for SideStore, AltStore, LiveContainer, and TrollStore without sandbox execution failures.

## Contribute to Respring

After successfully converting an app, please consider contributing it to the Respring project! This can include sharing your GitHub repo on this website, adding your findings and work to the skill, or both. Send me an [email](mailto:respring@941archive.com) or [DM](https://twitter.com/DylanMcD8) to get started.

## Install

Copy `skills/restore-legacy-ios-apps` into your Codex/Antigravity skills directory, normally `~/.gemini/config/skills/` or `~/.codex/skills/`. Keep its references, assets and agents folders together.

For reverse-engineering and APK extraction tooling, also copy `skills/apk-reverse`, `skills/mobile-reverse`, and `skills/reverse-engineering`.

## Use

Examples:

- “Use $restore-legacy-ios-apps to inspect this IPA and choose a faithful restoration strategy before implementing it.”
- “Use $restore-legacy-ios-apps to diagnose why this port is zoomed on hardware but looks correct in the simulator.”
- “Use $restore-legacy-ios-apps to unpack `resource.car` and convert this Android APK game into a working iOS IPA.”
- “Use $restore-legacy-ios-apps to unlock rendering frequency without changing game speed or drag forces.”

## Contents

- [Main skill](skills/restore-legacy-ios-apps/SKILL.md): discovery and core workflow.
- [APK to IPA Reference](skills/restore-legacy-ios-apps/references/apk-to-ipa-migration.md): cross-platform APK triage, Solar2D extraction, and packaging.
- [Case studies](skills/restore-legacy-ios-apps/references/case-studies.md): what worked, failed, and can transfer.
- [Source provenance](skills/restore-legacy-ios-apps/references/sources.md): pinned source evidence and confidence limits.
- [Investigation record](skills/restore-legacy-ios-apps/assets/investigation-record.md): reusable working template.
- [Evaluation scenarios](tests/scenarios.md): realistic prompts and expected behavioral boundaries.
- `scripts/apk_triage.py`: pure-Python AXML parser, ELF arch inspector, engine detector, and `Info.plist` generator.
- `scripts/car_unpack.py`: Solar2D / Corona SDK `resource.car` archive unpacker for compiled Lua code.
- `scripts/apk_extract.py`: APK asset extractor and hierarchy normalizer.
- `scripts/validate_package.py`: offline structure/link/evidence validator.

## Validate and maintain

Run `python3 scripts/validate_package.py` from this repository.

The evaluation scenarios are a review rubric, not a claim of automated agent or device testing. See [VALIDATION.md](VALIDATION.md) for checks performed on this package.

## Attribution and rights

The implementation examples come from the Respring repositories linked in the source index, which include their own upstream attribution and notices. This package does not relicense those runtimes, original games or assets. No blanket software license is assigned by this preparation; choose a license for this guidance before offering explicit reuse terms. Publishing a GitHub repository by itself does not supply an open-source license.
