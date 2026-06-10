# Stage 0 Media Bundle Specification

This artifact prepackages the Stage 0 Coming Soon media requirements so external capture and upload can be executed without additional planning.

## Scope

- Stage 0 Coming Soon page media only.
- Gameplay-first screenshots and optional short clips.
- Caption text aligned with game-vision pillars.

## Capture Standards

- Resolution target: 1920x1080 minimum.
- Aspect ratio: 16:9 for all core assets.
- UI policy: include gameplay HUD where readability is relevant.
- Visual integrity: no mock content, no placeholder-only frames.
- Naming convention: `stage0-shot-0X-<topic>.png`.

## Required Shot List (3 to 6)

| Shot ID | Topic | Scene Requirement | Caption Draft |
| --- | --- | --- | --- |
| S0-01 | Opening expansion decision | Safe alloy node, builder path, first production choice visible | Opening pressure starts with expansion timing, not passive waiting. |
| S0-02 | First contested objective | Data node or contested resource point with both sides contesting | Map control creates leverage through contested objectives and denial windows. |
| S0-03 | Faction asymmetry moment | Distinct Helion versus Veyari unit behavior in one engagement | Factions diverge through tempo and resilience, not cosmetic swaps. |
| S0-04 | Resource security and denial | One side disrupting extraction while other side responds | Resource disruption creates comeback windows and strategic adaptation. |
| S0-05 | HUD and command readability | Resource bar, minimap, command card, and alerts visible during action | Tactical decisions remain readable through clear HUD and command feedback. |
| S0-06 | End-state clarity | Win or loss state transition with clear readability cues | Match outcomes communicate clearly with explicit state transitions. |

## Optional Clip List (0 to 2)

| Clip ID | Topic | Length Target | Caption Draft |
| --- | --- | --- | --- |
| C0-01 | Opening to first contest | 12 to 20 seconds | Early scouting and expansion choices shape the first real fight. |
| C0-02 | Contested objective swing | 10 to 18 seconds | Objective control shifts momentum without ending strategic counterplay. |

## Acceptance Checklist

- [ ] At least 3 and no more than 6 screenshots selected.
- [ ] Every selected screenshot has a gameplay-first caption.
- [ ] At least one screenshot includes contested objective pressure.
- [ ] At least one screenshot includes readable HUD state.
- [ ] All assets follow naming convention.
- [ ] No caption overpromises unavailable systems.

## Packaging Steps

- Place selected assets under `docs/release/stage0-media/` before upload.
- Include `captions-stage0.md` in same folder with final caption text.
- Record final asset list in publication runbook before itch.io upload.

## Manual External Step

- Capture source imagery or clips from local gameplay session and export to required format.
