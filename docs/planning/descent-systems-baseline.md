# Descent Systems Baseline

This document defines first-pass rules for Descent access-node control, orbital corridor contest, and Descent-linked event cadence.

## Scope

- Access-node ownership and contest logic.
- Orbital corridor pressure and routing effects.
- Event catalog with bounded cadence and impact constraints.

## Descent Access-Node Control Rules

### Node Types

- Entry Node: initial control foothold into Descent systems.
- Relay Node: mid-network routing and signal amplification points.
- Anchor Node: high-value control point that unlocks advanced corridor influence.

### Control Mechanics

- Capture requires uninterrupted channel time within contested radius.
- Contesting pauses capture progress but does not immediately reset unless no owner-presence remains for decay window.
- Neutralized nodes enter brief stabilization lock before recapture.
- Node ownership contributes to corridor routing authority score.

### Ownership Effects

- Entry Node: unlocks baseline Descent interaction rights.
- Relay Node: increases event prediction accuracy and routing flexibility.
- Anchor Node: grants limited control over corridor pressure windows and disruption resistance.

## Orbital Corridor Contest Mechanics

- Corridors are directional lanes that modify logistics speed and event exposure.
- Corridor state classes:
  - Stable: normal throughput and event risk.
  - Pressured: reduced throughput and increased disruption chance.
  - Dominant: improved throughput and reduced disruption chance for controlling side.
- Corridor state is determined by combined node authority and recent contest outcomes.
- Corridor dominance decays if node control is not maintained.

## Descent Event Catalog (Bounded Cadence)

### Cadence Guardrails

- Base event cadence window: 150 to 210 seconds.
- Minimum separation between major negative events: 120 seconds.
- Maximum single event impact: 6 percent equivalent swing against affected domain.
- Back-to-back same-category events are disallowed unless at least one neutral event occurs between them.

### Event Categories

| Event ID | Event Name | Category | Primary Effect | Bound Rule |
| --- | --- | --- | --- | --- |
| D-001 | Orbital Debris Sweep | Debris | corridor path obstruction and route delay | delay cap 20 percent |
| D-002 | Charged Storm Front | Storm | temporary sensor and command interference | interference cap 18 percent |
| D-003 | Gravity Shear Pulse | Gravity Anomaly | movement and projectile behavior variance | variance cap 15 percent |
| D-004 | Relay Surge Arc | Surge | brief throughput boost at controlled relay nodes | boost cap 12 percent |
| D-005 | Bio-Contamination Drift | Contamination | localized extraction and recovery penalties | penalty cap 16 percent |
| D-006 | Resource Bloom Window | Resource Bloom | temporary yield increase on selected nodes | yield cap 14 percent |

### Event Distribution Rules

- At least one positive-opportunity event must occur within every 8-minute rolling window.
- No more than two negative-impact events may occur in a 6-minute rolling window.
- Event targeting must alternate between central and flank pressure opportunities when possible.

## Validation Hooks

- Flow F-14 validates access-node contest behavior and corridor pressure effects.
- Flow F-11 validates bounded volatility interaction with global stockpile systems.
- Future requirement: add corridor-state telemetry schema and node-authority visualization rules.
