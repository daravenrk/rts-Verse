# Network Resilience and Maintenance Baseline

This document defines first-pass rules for One Box core penalties, distributed recovery mechanics, and maintenance-instability constraints.

## Scope

- Applies to Autonomous and Network warfare phases.
- Covers original-core loss penalties, distributed network recovery, and high-tier automation upkeep constraints.
- Establishes baseline guardrails for simulation readability and counterplay.

## One Box Original-Core Penalty Rules

### Definitions

- Original Core: first command authority node for a faction.
- Distributed Nodes: relay, shard, or backup command infrastructure.
- Recovery State: temporary stabilization mode after original-core disruption.

### Penalty Profile on Original-Core Loss

| Penalty Domain | Immediate Penalty | Stabilized Penalty (with distributed recovery active) | Full Recovery Requirement |
| --- | --- | --- | --- |
| Command latency | +35 percent command delay | +15 percent command delay | original core restored or 3 distributed nodes synchronized |
| Production throughput | -30 percent global production speed | -12 percent | sustain stabilized state for 120 seconds without node loss |
| Vision and intel refresh | +40 percent refresh interval | +18 percent | restore one sensor-lattice chain or equivalent |
| Ability cooldown cadence | +25 percent cooldown extension | +10 percent | recover command authority threshold |

### Trigger and Duration Rules

- Original-core destruction immediately enters critical penalty state.
- If at least two distributed nodes are active, system can enter stabilized penalty state after 30 seconds.
- Stabilized state persists while minimum node count remains valid.
- Falling below distributed node minimum reverts to critical penalty state.

## Distributed Network Recovery Mechanics

### Recovery Stages

| Stage | Condition | Effects | Exit Condition |
| --- | --- | --- | --- |
| Stage 0 Critical | Original core down and insufficient distributed nodes | full critical penalties active | activate minimum distributed node threshold |
| Stage 1 Stabilized | Original core down with 2 active distributed nodes | penalties reduced to stabilized profile | maintain node integrity for 120 seconds |
| Stage 2 Resilient | Original core down with 3 or more synchronized nodes | further reduces command and intel penalties by 5 percent | restore original core or maintain resilient state until match end |
| Stage 3 Restored | Original core rebuilt and synchronized | penalties removed after reintegration window | 45-second reintegration complete |

### Guardrails

- Recovery cannot remove penalties instantly; all stage upgrades require explicit time windows.
- Node synchronization events must be visible in HUD and telemetry.
- Single-node snipes should disrupt but not instantly erase all recovery progress if minimum thresholds remain met.

## Maintenance-Instability Resource Model

### Resource Dimensions

- Upkeep: ongoing cost for automated systems.
- Bandwidth: command-network capacity consumed by autonomous assets.
- Cooling: thermal stability budget for high-output machine operations.
- Logistics: supply continuity for distributed machine activity.

### Baseline Thresholds (First Pass)

| Resource | Stable Band | Warning Band | Critical Band | Immediate Effect at Critical |
| --- | --- | --- | --- | --- |
| Upkeep | 70 to 100 percent budget satisfaction | 50 to 69 percent | below 50 percent | production efficiency penalty starts at -20 percent |
| Bandwidth | 0 to 75 percent utilization | 76 to 90 percent | above 90 percent | command latency and desync risk increase |
| Cooling | 0 to 70 percent thermal load | 71 to 85 percent | above 85 percent | weapon and ability cadence throttled |
| Logistics | 80 to 100 percent route integrity | 60 to 79 percent | below 60 percent | reinforcement arrival delays and upkeep spikes |

### Instability Escalation Rules

- Entering one critical band activates level-1 instability.
- Two simultaneous critical bands activate level-2 instability with compounding penalties.
- Three or more critical bands activate level-3 instability and temporary system lockouts on selected advanced tools.
- Returning all resources to warning or stable bands for 90 seconds removes one instability level.

### Anti-Snowball Safeguards

- Instability lockouts cannot disable all basic defensive actions.
- Recovery windows grant temporary mitigation to avoid irreversible collapse from a single swing.
- Event-driven penalties are clamped when faction is already at level-3 instability.

## Validation Hooks

- Flow F-13 validates One Box penalty and distributed recovery stage behavior.
- Flow F-12 validates pacing integration between era transitions and automation burden exposure.
- Future requirement: add explicit telemetry schema for recovery stage transitions and instability level changes.
