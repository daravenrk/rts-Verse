# Stockpile and World Event UI Telemetry Checklist

This checklist defines first-pass UI and telemetry requirements for global stockpile visibility and world event announcements.

## Scope

- Shared global stockpiles: Alloy, Power, Data, Reclaim.
- World event announcements for positive and negative economy effects.
- Readability and observability requirements for competitive play and validation workflows.

## UI Surface Checklist

- [x] Resource bar displays current world reserve and cap for Alloy, Power, Data, and Reclaim.
- [x] Soft depletion threshold crossing displays warning state for the affected resource.
- [x] Hard depletion threshold crossing displays escalated warning state without blocking controls.
- [x] Resource tooltips show current depletion multiplier impact.
- [x] Event banner displays event name, polarity, targeted resource, and magnitude.
- [x] Event feed retains at least the last five world events.
- [x] Minimap or HUD alert indicator highlights active world-event window.
- [x] Color usage for positive and negative events meets readability-first contrast rules.

## Telemetry Payload Checklist

- [x] Emit `stockpile_snapshot` payload at fixed cadence with reserve and cap for all resources.
- [x] Emit `stockpile_threshold_crossed` payload with resource, threshold type, and timestamp.
- [x] Emit `world_event_triggered` payload with event id, polarity, target resources, and magnitude values.
- [x] Emit `world_event_applied` payload after clamping and floor checks are resolved.
- [x] Emit `world_event_blocked` payload when guardrails reject an event.
- [x] Emit `world_event_ui_ack` payload when announcement is rendered in HUD.
- [x] Include deterministic sequence id for event ordering.
- [x] Include simulation phase tag (opening, midgame, late-game equivalent) in every event payload.

## Validation Hooks

- [x] Provide one headless validation mode that forces one positive and one negative event.
- [x] Validate soft-threshold warning appears at or below configured threshold.
- [x] Validate hard-threshold warning appears at or below configured threshold.
- [x] Validate floor clamp prevents reserve below zero in telemetry and UI.
- [x] Validate event feed ordering matches telemetry sequence ids.

## Failure Triage Rules

- [x] Missing `world_event_triggered` payload is treated as blocking for event observability flows.
- [x] Any mismatch between applied magnitude and displayed magnitude is a fail.
- [x] Silent threshold crossing (no UI state change) is a fail.
- [x] Event banners older than retention window should archive, not disappear without log entry.

## Related References

- planning/economy-standards.md
- planning/testing-strategy.md
- tracking/scenario-validation-notes.md
