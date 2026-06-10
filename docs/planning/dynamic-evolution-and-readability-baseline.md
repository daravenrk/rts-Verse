# Dynamic Evolution and Readability Baseline

This document defines first-pass dynamic branch thresholds and player-facing readability rules.

## Scope

- Branch emergence from shared human opening into machine, alien, or hybrid trajectories.
- Threshold contracts for branch commitment.
- UI and communication rules for branch, Descent, and event-state readability.

## Dynamic Evolution Branch Thresholds

### Shared Opening Rule

- All players begin in common human-survival baseline with no pre-match branch lock.
- Branch threshold progress begins once Augmented Warfare transition conditions are satisfied.

### Branch Threshold Contract (First Pass)

| Branch | Entry Threshold | Commitment Threshold | Deepening Threshold | Failure Risk If Missed |
| --- | --- | --- | --- | --- |
| Machine | sustain bandwidth above 70 percent capacity for 90 seconds while keeping instability <= level 1 | activate 2 automation chains and 1 network relay cluster | maintain automation uptime >= 80 percent for 180 seconds | desync penalties and production instability |
| Alien | control 2 adaptation-linked objectives and complete 1 bio-integration chain | maintain ecosystem-synergy uptime >= 75 percent for 150 seconds | complete 2 adaptive doctrine evolutions | adaptation collapse and weakened transition bonuses |
| Hybrid | complete one machine and one alien prerequisite branch step without entering instability level 3 | hold mixed-resource parity bands for 120 seconds | unlock cross-branch synthesis node and sustain for 90 seconds | split-focus under-scaling and branch lockout risk |

### Divergence Safeguards

- Branch benefits cannot fully activate without visible commitment cues.
- Branch lock-in cannot occur during unresolved critical alert conditions.
- Emergency rollback window exists for 60 seconds after first commitment to avoid accidental hard-lock transitions.

## Player-Facing Readability Rules

### Branch State Readability

- Display branch progress meter with three states: pending, committing, locked.
- Show trigger reason when state changes.
- Show next threshold requirement in concise HUD text.

### Descent Status Readability

- Display current node authority score and corridor state in persistent strategic panel.
- Highlight contested nodes with time-to-neutralize indicator.
- Show active Descent event category and remaining window duration.

### Event Warning Windows

- Provide pre-event warning window of 8 to 12 seconds for major disruptions.
- Provide post-event summary window showing actual applied impact values.
- Keep warning and summary messages non-blocking and stack-safe.

### Readability Fail Conditions

- Hidden threshold crossing without UI state update is a fail.
- Branch lock without explicit player-facing confirmation is a fail.
- Descent event activation without warning or summary is a fail.

## Validation Hooks

- Flow F-15 validates branch emergence thresholds and counterplay viability.
- Flow F-14 validates Descent status readability under corridor contest pressure.
- Flow F-31 validates warning and summary observability behavior for event messaging patterns.
