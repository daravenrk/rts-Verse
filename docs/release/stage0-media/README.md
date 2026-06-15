# Stage 0 Media Staging Folder

Place Stage 0 Coming Soon assets here before manual itch.io publication.

## Required Files

- 3 to 6 screenshots following naming convention:
  - `stage0-shot-01-opening-expansion.png`
  - `stage0-shot-02-contested-objective.png`
  - `stage0-shot-03-faction-asymmetry.png`
  - `stage0-shot-04-resource-denial.png`
  - `stage0-shot-05-hud-readability.png`
  - `stage0-shot-06-end-state.png`
- Optional clips:
  - `stage0-clip-01-opening-to-contest.mp4`
  - `stage0-clip-02-objective-swing.mp4`
- Caption source:
  - `captions-stage0.md`

## Validation Checklist

- [ ] Every asset is gameplay-first and representative of implemented scope.
- [ ] At least one asset shows contested objective pressure.
- [ ] At least one asset shows readable HUD state.
- [ ] Asset filenames and order align with Stage 0 media spec.

## Closure Utilities

- `zsh docs/release/stage0-media/prepublish_audit.sh`
- `zsh docs/release/stage0-media/stage0_status_report.sh`
- `zsh docs/release/stage0-media/postpublish_gate.sh`
- `zsh docs/release/stage0-media/postpublish_sync.sh --help`
