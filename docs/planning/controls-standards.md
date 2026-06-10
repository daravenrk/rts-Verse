# UI and Control Standards

This document defines baseline player controls, input bindings, and RTS HUD behavior for the MVP.

## Goals

- Make core RTS actions fast, readable, and consistent.
- Support keyboard and mouse-first play with minimal friction.
- Keep input deterministic and testable across scenarios.
- Allow remapping without changing gameplay semantics.

## Interaction Model

- Primary control style: keyboard and mouse RTS controls.
- Input semantics:
  - Left click and drag for selection.
  - Right click for context command (move, attack target, gather, interact).
  - Hotkeys for camera, groups, production, and tactical commands.
- Command priority:
  - Explicit hotkey command overrides contextual right-click intent.
  - Shift queues commands in issued order.

## Mouse Controls

### Selection

- Left click: select single unit.
- Left drag: box select units.
- Shift plus left click: add to selection.
- Control plus left click: remove from selection.
- Double left click unit: select same unit type in visible screen area.

### Commanding

- Right click on terrain: move.
- Right click on enemy: attack.
- Right click on resource: gather.
- Right click on capturable objective: interact or capture.
- Shift plus right click: queue command sequence.

### Camera

- Mouse wheel: zoom in or out.
- Middle mouse drag: pan camera.
- Optional edge scroll: pan when cursor reaches screen edge.

## Keyboard Controls

### Camera and View

- W A S D or arrow keys: pan camera.
- Q and E: rotate camera step left or right (if rotation enabled).
- Space: center camera on current selection.
- F1: center camera on command structure.
- M: toggle strategic map overlay.

### Combat and Orders

- A then left click: attack-move.
- S: stop.
- H: hold position.
- P: patrol.
- G: gather.
- R: repair.
- B: build menu.
- T: tactical ability panel focus.

### Control Groups

- Control plus 1 through 0: assign control group.
- 1 through 0: recall control group.
- Double tap 1 through 0: recall and center camera.

### Production and Abilities

- Command card uses a fixed 3 by 4 key grid:
  - Row 1: Q W E R
  - Row 2: A S D F
  - Row 3: Z X C V
- Tab cycles production structures of the same type.
- Shift with production hotkey queues multiple units.

## MVP HUD Layout

- Top bar:
  - Alloy, Power, Data, Reclaim values.
  - Global stockpile trend indicators.
  - Descent event banner and countdown timer.
- Left panel:
  - Minimap with lane and objective markers.
  - Alert pings for attacks, captures, and shortages.
- Bottom center:
  - Selection panel, health bars, armor state, and status effects.
- Bottom right:
  - Command card and production queue.
  - Context tooltips for current command and hotkey.

## Feedback Standards

- Every issued command must provide immediate visual confirmation.
- Invalid commands must display a clear reason.
- Input latency target for command acknowledgment: less than 100 milliseconds under MVP load.
- Critical warnings use persistent UI states:
  - No valid home base for air wing.
  - Global stockpile depletion.
  - Descent event hazard active.

## Accessibility and Quality

- All hotkeys must be remappable.
- Edge scroll, camera sensitivity, and zoom speed must be configurable.
- Optional high-contrast selection circles and colorblind-safe team colors.
- Input settings must include reset-to-default and profile export support.

## MVP Minimum Control Checklist

- Selection: single, box, additive, subtractive.
- Commanding: move, attack, attack-move, gather, repair, patrol, hold.
- Camera: pan, zoom, center-on-selection.
- Groups: assign, recall, camera-center recall.
- UI: resource HUD, minimap, command card, queue visibility.
- Alerts: objective contest, resource shortage, Descent event warning.

## First-Pass Camera Baseline for Small 3D Readability

Use this baseline until F-24 tuning data requires changes.

| Parameter | Default | Min | Max | Notes |
| --- | --- | --- | --- | --- |
| Camera pitch | 52 deg | 48 deg | 58 deg | Keeps infantry silhouettes readable while preserving lane visibility. |
| Camera yaw step (Q or E) | 15 deg | 10 deg | 20 deg | Rotation increments should preserve orientation confidence in combat. |
| Zoom distance | 34 units | 26 units | 48 units | Default favors unit readability; max supports macro scan. |
| Pan speed | 30 units per second | 22 | 40 | Must allow fast lane transitions without overshoot. |
| Zoom speed | 18 percent per wheel step | 12 | 24 | Stable zoom cadence for repeated readability checks. |

### Zoom Bands

- Close-read band: 26 to 31 units, used for tactical micro and animation-intent confirmation.
- Default-read band: 32 to 38 units, used as primary F-24 validation distance.
- Macro-read band: 39 to 48 units, used for lane and objective overview checks.
