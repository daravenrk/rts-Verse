# M3 Slice A Runtime Implementation Spec

This spec converts T-0067 through T-0071 into file-scoped coding steps for runtime implementation.

## Objective Alignment

- Business goal:
  - Start M3 runtime system delivery while Stage 0 external publication tasks remain blocked.
- Success criteria:
  - Global stockpile state exists for Alloy, Power, Data, and Reclaim.
  - Reserve and cap values are reflected in runtime HUD.
  - Threshold crossing and clamp behavior are deterministic and observable.
  - One positive and one negative bounded world event can be forced in headless validation.
- Constraints:
  - Preserve current M2 gameplay loop behavior.
  - Keep deterministic validation style already used in FirstDuelMap hooks.
  - Align all values and guardrails with economy-standards and telemetry checklist artifacts.

## Environment Snapshot

- OS and kernel: Darwin 25.5.0 arm64.
- Python runtime: 3.13.0.
- Docker daemon: unavailable in current shell session.
- Local model endpoints 11434 and 11435: unavailable.

## Confirmed Runtime Gap

Diagnostics showed no existing stockpile and world-event gameplay implementation in scripts or scenes. Current duel-map runtime still uses a single alloy integer and hardcoded display text for other resources.

## Canonical Rules Source

Use these planning artifacts as source-of-truth while coding:

- Global cap and threshold rules: docs/planning/economy-standards.md
- Event cadence and bounded magnitudes: docs/planning/economy-standards.md
- UI and telemetry payload requirements: docs/planning/stockpile-event-ui-telemetry-checklist.md

## File-Scoped Implementation Plan

Primary runtime target:

- scripts/core/FirstDuelMap.gd

Current anchor points in this file:

- Existing single-resource state variable around line 222.
- HUD refresh function around line 1238.
- Gather deposit updates around line 1565.
- Main process loop around line 1231.
- Existing deterministic test hook pattern around line 1988.

### Step 1: Add stockpile state container (T-0067)

Add constants and state dictionaries:

- STOCKPILE_CONFIG
  - resource id
  - cap
  - soft threshold ratio
  - hard threshold ratio
- _stockpile_state
  - reserve
  - cap
  - soft_threshold_value
  - hard_threshold_value
  - last_threshold_state
- _stockpile_event_sequence_id

Initialization:

- Add _initialize_stockpile_state called from _ready before test hooks.
- Seed reserve values to cap for first pass unless test override args are provided.

### Step 2: Add threshold and clamp behavior (T-0068)

Add helpers:

- _apply_stockpile_delta(resource_id, delta, reason)
- _clamp_stockpile_reserve(resource_id)
- _evaluate_stockpile_threshold(resource_id)
- _emit_stockpile_threshold_crossed(resource_id, threshold_type)

Behavior requirements:

- Reserve may never go below zero.
- Reserve may never exceed cap.
- Soft and hard threshold transitions emit one-way crossing payloads with deterministic sequence ids.
- Repeat messages should be suppressed unless threshold state changes.

### Step 3: Add bounded world-event pipeline (T-0069)

Add event definitions:

- Minimal first pass:
  - one positive event id from economy standards
  - one negative event id from economy standards

Add functions:

- _trigger_world_event(event_id)
- _apply_world_event(event_def)
- _can_apply_world_event(event_def)
- _emit_world_event_triggered(event_def)
- _emit_world_event_applied(event_def, applied_delta)
- _emit_world_event_blocked(event_def, reason)

Bounds enforcement:

- Positive magnitude per event <= 10 percent cap.
- Negative magnitude per event <= 7 percent cap.
- Use floor and cap clamping after application.

### Step 4: Wire HUD and telemetry baseline (T-0070)

HUD updates:

- Replace hardcoded resource text with dynamic stockpile formatting:
  - Alloy reserve/cap
  - Power reserve/cap
  - Data reserve/cap
  - Reclaim reserve/cap
- Add threshold warning annotation in alert label for soft and hard crossings.
- Add simple event feed retention buffer (minimum 5 entries) and render summary in queue or alerts area for first pass.

Telemetry log format (consistent with existing test hooks):

- [Stockpile] snapshot seq=... alloy=... power=... data=... reclaim=...
- [Stockpile] threshold resource=... level=soft|hard seq=...
- [WorldEvent] triggered id=... polarity=... resource=... magnitude=... seq=...
- [WorldEvent] applied id=... resource=... delta=... reserve_after=... seq=...
- [WorldEvent] blocked id=... reason=... seq=...
- [WorldEvent] ui_ack id=... seq=...

### Step 5: Add deterministic validation hooks (T-0071)

Add first-pass flags:

- --duel-test-f39-stockpile
- --duel-test-f40-world-events

Add hook functions:

- _run_f39_stockpile_test_hook
- _run_f40_world_event_test_hook

F39 expectations:

- Force reserve below soft threshold and confirm threshold payload.
- Force reserve below hard threshold and confirm threshold payload.
- Apply large negative delta and confirm floor clamp at zero.

F40 expectations:

- Trigger one positive event and one negative event.
- Confirm bounded delta values and deterministic event sequence ordering.
- Confirm UI acknowledgement payload is emitted for each rendered event.

## Validation Command Drafts

- /Applications/Godot.app/Contents/MacOS/godot --headless --quit --path . res://scenes/core/FirstDuelMap.tscn -- --duel-test-f39-stockpile
- /Applications/Godot.app/Contents/MacOS/godot --headless --quit --path . res://scenes/core/FirstDuelMap.tscn -- --duel-test-f40-world-events

## Risk Notes

- HUD text expansion may exceed current label width.
  - Mitigation: keep compact reserve/cap formatting and abbreviations.
- Existing F-03 gather loop currently writes alloy directly.
  - Mitigation: route gather deposit through stockpile helper and preserve F-03 expected pass behavior.
- Event-feed rendering can conflict with existing queue display text.
  - Mitigation: reserve queue display for production and use alert area for short event summaries in first pass.

## Rollback Note

If M3 runtime work destabilizes M2 flows, gate all new behavior behind test flags and default it off until F-39 and F-40 pass.

## Ready-To-Code Checklist

- [x] Add stockpile constants and state dictionaries in FirstDuelMap.
- [x] Initialize stockpile state in _ready.
- [x] Replace direct alloy mutations with stockpile helper calls.
- [x] Update HUD formatting to use stockpile state.
- [x] Implement world event trigger and apply functions.
- [x] Add F-39 and F-40 hooks and summary log lines.
- [x] Capture validation evidence in scenario-validation-notes after first pass.
