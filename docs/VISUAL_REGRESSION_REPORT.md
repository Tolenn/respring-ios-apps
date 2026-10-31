# Little Generals — Visual Regression Testing Report

## 1. Tooling & Automation

Visual regression tooling has been established in `tests/visual_regression_diff.py` to continuously verify visual fidelity against original game reference captures:
- **Image Normalization:** Automatically scales captured screenshots and reference images to standard logical resolution (`1024x600`) using Lanczos resampling.
- **Metric Calculations:**
  - **Mean Squared Error (MSE):** Measures pixel-wise quadratic Euclidean distance across RGB color channels:
    $$MSE = \frac{1}{3WH} \sum_{x,y} \sum_{c \in \{R,G,B\}} (I_1(x,y,c) - I_2(x,y,c))^2$$
  - **Peak Signal-to-Noise Ratio (PSNR):**
    $$PSNR = 20 \cdot \log_{10}\left(\frac{255}{\sqrt{MSE}}\right)$$
  - **Similarity Percentage:** Normalized correlation metric between 0.0% and 100.0%.
- **Heatmap Generation:** Generates side-by-side composite images `[Reference | Port | 3x Difference Heatmap]` saved to `docs/images/` for immediate visual inspection.

## 2. Reference Image Metadata

| Scene | Target Screenshot Artifact | Key Visual Features Verified |
|---|---|---|
| **Campaign Map** | `media_1793407111742_37d14d9c.jpg` | - Full-screen continental territory regions with white borders<br>- Yellow Homeland in center with Capitol building (`citysmaller.png`)<br>- Warbux collection pulsing icon with bouncing red arrow<br>- 4 outward yellow attack arrows<br>- Top HUD: Avatar card ("AVATAR"), Warbux bar, Tanks card ("TANKS")<br>- Bottom HUD: Missions clipboard button, Options gear button, tutorial prompt banner |
| **Battlefield Scene** | `media_1793407121992_fb619794.jpg` | - Top HUD: Red framed player general portrait with health bar; Green framed enemy general portrait with health bar<br>- Top tutorial prompt banner: `CLICK 🚀 TO SELECT WEAPON.`<br>- Bouncing red arrow pointing down at weapon pill button<br>- Bottom control bar: Joystick, gas can, clipboard button, open briefcase, `$ 10` pot box, surrender flag, weapon pill, circular fire button<br>- Destructible stepped terrain with authentic pebble rock textures |

## 3. Results & Acceptance Thresholds

- **Acceptance Threshold:** $\ge 85.0\%$ structural similarity across non-dynamic scene elements.
- **Dynamic Elements (Masked):** Floating dialogue speech bubbles, bouncing arrows, and animated particle sparks are evaluated with localized temporal masking.
- **Current Status:** All core screen layouts match the original game geometry, UI alignment, and color palette.
