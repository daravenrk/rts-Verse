# Stockpile and World Event UI Telemetry Checklist

This checklist defines first-pass UI and telemetry requirements for global stockpile visibility and world event announcements.

## Scope

- Shared global stockpiles: Alloy, Power, Data, Reclaim.
- World event announcements for positive and negative economy effects.
- Readability and observability requirements for competitive play and validation workflows.

## UI Surface Checklist

- [ ] Resource bar displays current world reserve and cap for Alloy, Power, Data, and Reclaim.
- [ ] Soft depletion threshold crossing displays warning state for the affected resource.
- [ ] Hard depletion threshold crossing displays escalated warning state without blocking controls.
- [ ] Resource tooltips show current depletion multiplier impact.
- [ ] Event banner displays event name, polarity, targeted resource, and magnitude.
- [ ] Event feed retains at least the last five world events.
- [ ] Minimap or HUD alert indicator highlights active world-event window.
- [ ] Color usage for positive and negative events meets readability-first contrast rules.

## Telemetry Payload Checklist

- [ ] Emit `stockpile_snapshot` payload at fixed cadence with reserve and cap for all resources.
- [ ] Emit `stockpile_threshold_crossed` payload with resource, threshold type, and timestamp.
- [ ] Emit `world_event_triggered` payload with event id, polarity, target resources, and magnitude values.
- [ ] Emit `world_event_applied` payload after clamping and floor checks are resolved.
- [ ] Emit `world_event_blocked` payload when guardrails reject an event.
- [ ] Emit `world_event_ui_ack` payload when announcement is rendered in HUD.
- [ ] Include deterministic sequence id for event ordering.
- [ ] Include simulation phase tag (opening, midgame, late-game equivalent) in every event payload.

## Validation Hooks

- [ ] Provide one headless validation mode that forces one positive and one negative event.
- [ ] Validate soft-threshold warning appears at or below configured threshold.
- [ ] Validate hard-threshold warning appears at or below configured threshold.
- [ ] Validate floor clamp prevents reserve below zero in telemetry and UI.
- [ ] Validate event feed ordering matches telemetry sequence ids.

## Failure Triage Rules

- [ ] Missing `world_event_triggered` payload is treated as blocking for event observability flows.
- [ ] Any mismatch between applied magnitude and displayed magnitude is a fail.
- [ ] Silent threshold crossing (no UI state change) is a fail.
- [ ] Event banners older than retention window should archive, not disappear without log entry.

## Related References

- planning/economy-standards.md
- planning/testing-strategy.md
- tracking/scenario-validation-notes.md
