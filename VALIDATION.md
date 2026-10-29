# Package validation

Prepared 25 October 2026. Updated 30 October 2026.

- Read the Codex skill-creator guidance and an existing workflow skill to inform discovery, progressive references and verification structure.
- Synthesized both engineering reports, including explicit failed experiments and evidence limits; kept private raw reports outside the package.
- Checked all 126 public-source file hashes in the manifest against retained local repository files.
- Ran the package validator and Codex skill-creator's structure validator. Exercised the package validator with clean, broken-link and missing-entry-point fixtures.
- Integrated `reverse-skill` suites (`apk-reverse`, `mobile-reverse`, `reverse-engineering`) and established cross-platform Android APK to iOS IPA conversion pipelines.
- Validated `scripts/apk_triage.py`, `scripts/car_unpack.py` (269 Lua files extracted), and `scripts/apk_extract.py` (749 assets extracted) against *Little Generals* (`com.smarterapps.littlegenerals`).
- Validated iOS Xcode project layout, flat bundle layout, and DER codesigning for modern iOS installation via SideStore, AltStore, LiveContainer, and TrollStore.
- Reviewed the behavioral scenarios against the main workflow and references.

The checks validate documentation packaging and provenance, not game compatibility. Remote source links are commit-pinned pointers constructed from recorded metadata; they were not all fetched again.
