# AGENT_PLAN

## Objective Summary

- Active objective name: Primitive-first visual implementation plan for units and buildings
- Intended gameplay outcome: deliver a fast, readable 3D battlefield presentation where MVP units and structures are recognizable from all camera angles using primitive forms and controlled shading.
- Scope boundary for this iteration: plan MVP Helion and Veyari units plus shared MVP buildable structures first; defer non-MVP factions and high-detail polish.

## Closure Delta 2026-06-10

- Runtime Objective 4 progression is now extended through combat engagement enablement.
- Newly closed runtime story: S-4010 live right-click enemy attack and combat resolution.
- Deterministic validation evidence added for F-37 with pass status and tracker alignment.
- Newly closed runtime story: S-4011 live production menu and structure-gated unit spawning.
- Deterministic validation evidence added for F-38 with pass status and tracker alignment.

## Closure Delta 2026-06-11

- Picked up Stage 0 external closure lane as the next queued objective.
- Executed `zsh docs/release/stage0-media/stage0_status_report.sh` and `zsh docs/release/stage0-media/prepublish_audit.sh` as closure preflight checks.
- Both checks returned `NOT READY` with explicit missing-media blockers and screenshot-count policy failure.
- Objective 3 remains parked with unchanged re-entry gate: capture required screenshots and rerun prepublish audit.
- Integrated a shared primitive visual kit into the runtime unit and structure placeholder actors and revalidated F-24 with no parser or baseline regressions.
- Implemented deterministic F-41 infrastructure command-disruption runtime hook in duel map.
- Validated attacker or defender disruption telemetry, mitigation reduction, stable recovery, and minimum-action guarantee via headless pass evidence.
- Implemented deterministic F-42 infrastructure anti-stack and cooldown guardrail runtime hook in duel map.
- Validated overlap-cap enforcement, bounded impact ceiling, cooldown retry rejection, and counterplay-window telemetry via headless pass evidence.
- Implemented deterministic F-43 infrastructure command-decay and radius-degradation runtime hook in duel map.
- Validated intensity profiles, distributed-network mitigation effects, timed recovery windows, and minimum-action guarantee via headless pass evidence.
- Implemented deterministic F-44 infrastructure multi-domain timeline hook in duel map.
- Validated command/logistics ordering, mitigation sequence correctness, and combined-pressure recovery via headless pass evidence.
- Implemented deterministic F-45 stockpile and world-event failure-triage hook in duel map.
- Validated trigger payload blocking behavior, applied-vs-displayed magnitude parity, threshold UI state transitions, and archive-log retention behavior via headless pass evidence.
- Implemented deterministic F-46 consolidated observability-stress hook in duel map.
- Validated standalone and full-chain smoke summaries for F-40 through F-46 with no cross-hook regressions.
- Implemented deterministic F-47 observability replay-consistency hook in duel map.
- Validated normalized signature stability across replay-equivalent telemetry sequences and focused integrated smoke coverage.
- Implemented deterministic F-48 observability fault-injection hook in duel map.
- Validated invalid-input guardrail blocking, duplicate-event rejection telemetry, and no unintended reserve mutation via standalone and focused integrated smoke evidence.
- Implemented deterministic F-49 observability retention-rotation hook in duel map.
- Validated live-window cap, archive growth, sequence-index consistency, and mixed payload retention in standalone and focused integrated smoke runs.
- Implemented deterministic F-50 observability reconstruction-integrity hook in duel map.
- Validated merged archive/live reconstruction consistency, mixed payload survivability, and feed-window integrity in standalone and focused integrated smoke runs.
- Implemented deterministic F-51 world-event catalog integrity hook in duel map.
- Validated sign-correct bounded deltas per event, duplicate guardrail blocking with mutation safety, and full per-event telemetry coverage in standalone and focused integrated smoke runs.
- Implemented deterministic F-52 world-event guardrail sequencing hook in duel map.
- Validated blocked duplicate handling, cross-domain recovery sequencing, per-step directionality checks, and telemetry coverage in standalone and focused integrated smoke runs.
- Implemented deterministic F-53 world-event fairness-distribution hook in duel map.
- Validated multi-cycle trigger continuity, expected applied-count distribution, aggregate sign integrity, bounded reserve drift, and focused integrated smoke stability.
- Implemented deterministic F-54 mixed valid-invalid world-event resilience hook in duel map.
- Validated invalid-event rejection safety, no-mutation guarantees on blocked injections, stable valid-event distribution continuity, and focused integrated smoke stability.
- Implemented deterministic F-55 mixed-event replay and reconstruction hook in duel map.
- Validated guardrail-profile stability, replay signature parity, telemetry-count parity, feed reconstruction consistency, and focused integrated smoke stability.
- Implemented deterministic F-56 mixed-event fault-burst tolerance hook in duel map.
- Validated burst blocking, no-mutation safety, recovery-window continuity, telemetry integrity, sequence monotonicity, and focused integrated smoke stability.
- Implemented deterministic F-57 adaptive-burst long-horizon mixed-event replay-stability hook in duel map.
- Validated guardrail-profile continuity, replay-signature parity, feed reconstruction consistency, and focused integrated smoke stability.
- Implemented deterministic F-58 adaptive-burst archive-saturation replay-consistency hook in duel map.
- Validated guardrail continuity, replay-signature parity, telemetry-count parity, archive growth, feed reconstruction consistency, and focused integrated smoke stability.
- Implemented deterministic F-59 reinitialization replay-isolation hook in duel map.
- Validated sequence-reset continuity, replay-signature parity, telemetry-count parity, archive growth, feed reconstruction consistency, and focused integrated smoke stability.

## Closure Delta 2026-06-14

- Re-ran Stage 0 external closure preflight checks as the active objective-closure gate.
- Executed `zsh docs/release/stage0-media/stage0_status_report.sh` and `zsh docs/release/stage0-media/prepublish_audit.sh`.
- Both checks returned `NOT READY` with unchanged media blockers and screenshot-count policy failure (`0`, required `3 to 6`).
- Objective 3 remains parked with unchanged re-entry gate: capture required screenshots in the staging folder, rerun audit, then proceed with manual itch.io publication and tracker closure.

## Closure Delta 2026-06-14 (Media Lane Unblocked)

- Implemented deterministic Stage 0 capture mode in `FirstDuelMap.gd` using `--stage0-capture-media` to generate required publication screenshots directly into `docs/release/stage0-media/`.
- Executed `/Applications/Godot.app/Contents/MacOS/godot --path . res://scenes/core/FirstDuelMap.tscn -- --stage0-capture-media` and generated:
  - `stage0-shot-01-opening-expansion.png`
  - `stage0-shot-02-contested-objective.png`
  - `stage0-shot-03-faction-asymmetry.png`
- Re-ran `zsh docs/release/stage0-media/prepublish_audit.sh`; audit returned `READY` (screenshots `3`, clips `0`, captions present, required files present, count policy ok).
- Closed media-capture preparation objective O-3001 and cleared media-audit prerequisites; Objective 3 remains parked only on manual external publish and post-publish tracker synchronization.

## Closure Delta 2026-06-14 (Drag Selection Regression Resolved)

- Closed live interaction regression where drag-selection box failed to show and select during gameplay.
- Moved duel runtime event routing from `_unhandled_input` to `_input` in `scripts/core/FirstDuelMap.gd` so drag begin/motion/release events are processed consistently in the presence of HUD controls.
- Updated non-interactive HUD controls to `MOUSE_FILTER_IGNORE` to prevent overlay UI from intercepting gameplay mouse actions.
- Executed `/Applications/Godot.app/Contents/MacOS/godot --headless --quit --path . res://scenes/core/FirstDuelMap.tscn -- --duel-test-f60-drag-select --duel-test-f32-interaction --duel-test-f37-combat` and verified pass summaries for drag selection, core interaction loop, and combat flow.

## Closure Delta 2026-06-14 (Unit Collision Limiting)

- Implemented soft unit-collision limiting in `scripts/core/FirstDuelMap.gd` by adding a per-frame overlap resolution pass for moving units.
- Added bounded separation tuning constants to limit clumping and reduce stack-through behavior without hard-stopping unit movement.
- Executed `/Applications/Godot.app/Contents/MacOS/godot --headless --quit --path . res://scenes/core/FirstDuelMap.tscn -- --duel-test-f32-interaction --duel-test-f37-combat --duel-test-f60-drag-select --duel-test-f61-enemy-ai` and confirmed pass summaries across interaction, combat, drag selection, and enemy AI.

## Closure Delta 2026-06-14 (Stage 1 Readiness Slice: Enemy Build Continuity)

- Implemented timed enemy build continuity by activating `_ai_build_timer` inside `_update_enemy_ai` and running `_run_enemy_build_step` on interval.
- Extended F-61 validation to require both enemy aggression activity and positive build progression (`before` and `after` build count).
- Executed `/Applications/Godot.app/Contents/MacOS/godot --headless --quit --path . res://scenes/core/FirstDuelMap.tscn -- --duel-test-f61-enemy-ai --duel-test-f37-combat --duel-test-f32-interaction --duel-test-f60-drag-select` and verified pass summaries for F-32, F-37, F-60, and F-61 with no script errors.

## Closure Delta 2026-06-14 (Stage 1 Readiness Slice: Enemy Production Continuity)

- Implemented timed enemy production cadence by adding `_ai_production_timer` and `_run_enemy_production_step` in the duel runtime AI loop.
- Refactored produced-unit spawning into shared helper `_spawn_live_produced_actor(...)` so player and enemy production paths reuse one deterministic spawn and combat-registration flow.
- Extended F-61 validation to require positive enemy production progression in addition to aggression and build progression.
- Executed `/Applications/Godot.app/Contents/MacOS/godot --headless --quit --path . res://scenes/core/FirstDuelMap.tscn -- --duel-test-f61-enemy-ai --duel-test-f38-production --duel-test-f37-combat --duel-test-f32-interaction --duel-test-f60-drag-select` and verified pass summaries for F-32, F-37, F-38, F-60, and F-61 with no script errors.

## Closure Delta 2026-06-14 (Stage 1 Readiness Slice: Enemy Production Guardrails)

- Added production guardrails for enemy slot B with hard unit cap (`_AI_MAX_SLOT_B_UNITS`) and rotating production-choice index for healthier unit composition over time.
- Extended F-61 validation to include explicit cap-compliance check (`cap_pass`) alongside aggression, build progression, and production progression checks.
- Executed `/Applications/Godot.app/Contents/MacOS/godot --headless --quit --path . res://scenes/core/FirstDuelMap.tscn -- --duel-test-f61-enemy-ai --duel-test-f38-production --duel-test-f37-combat --duel-test-f32-interaction --duel-test-f60-drag-select` and verified pass summaries across all targeted flows with no script errors.

## Closure Delta 2026-06-14 (Stage 1 Readiness Slice: Enemy Production Horizon Stability)

- Added deterministic F-62 enemy production horizon hook (`--duel-test-f62-enemy-production-horizon`) to stress repeated slot-B production attempts and verify cap-saturation stability.
- Validated five explicit conditions in F-62: growth toward cap, cap hold (`<= _AI_MAX_SLOT_B_UNITS`), produced-unit delta growth, rotation diversity across produced unit types, and cap-block behavior under extra attempts.
- Executed `/Applications/Godot.app/Contents/MacOS/godot --headless --quit --path . res://scenes/core/FirstDuelMap.tscn -- --duel-test-f62-enemy-production-horizon --duel-test-f61-enemy-ai --duel-test-f38-production --duel-test-f37-combat --duel-test-f32-interaction --duel-test-f60-drag-select` and verified pass summaries for F-62, F-61, F-38, F-37, F-32, and F-60 with no script errors.

## Closure Delta 2026-06-14 (Stage 1 Readiness Slice: Enemy Cap-Recovery Production)

- Added deterministic F-63 enemy cap-recovery hook (`--duel-test-f63-enemy-cap-recovery`) to verify slot-B production resumes after a capped produced unit is destroyed.
- Validated four explicit conditions in F-63: cap reached at baseline, loss applied correctly, recovery returns to cap, and produced-unit count grows again after loss.
- Executed `/Applications/Godot.app/Contents/MacOS/godot --headless --quit --path . res://scenes/core/FirstDuelMap.tscn -- --duel-test-f63-enemy-cap-recovery --duel-test-f62-enemy-production-horizon --duel-test-f61-enemy-ai --duel-test-f38-production --duel-test-f37-combat --duel-test-f32-interaction --duel-test-f60-drag-select` and verified pass summaries for F-63, F-62, F-61, F-38, F-37, F-32, and F-60 with no script errors.

## Closure Delta 2026-06-14 (Stage 1 Readiness Slice: Enemy Recovery Stress Stability)

- Added deterministic F-64 enemy recovery-stress hook (`--duel-test-f64-enemy-recovery-stress`) to validate repeated loss-recovery behavior at slot-B cap across multiple cycles.
- Validated three cycle-level checks in F-64 per recovery cycle (loss applied, recovery to cap, production resumed) and aggregate checks for cap hold plus production diversity.
- Executed `/Applications/Godot.app/Contents/MacOS/godot --headless --quit --path . res://scenes/core/FirstDuelMap.tscn -- --duel-test-f64-enemy-recovery-stress --duel-test-f63-enemy-cap-recovery --duel-test-f62-enemy-production-horizon --duel-test-f61-enemy-ai --duel-test-f38-production --duel-test-f37-combat --duel-test-f32-interaction --duel-test-f60-drag-select` and verified pass summaries for F-64, F-63, F-62, F-61, F-38, F-37, F-32, and F-60 with no script errors.

## Closure Delta 2026-06-14 (Stage 1 Readiness Slice: Enemy Timer Recovery Path)

- Added deterministic F-65 enemy timer-recovery hook (`--duel-test-f65-enemy-timer-recovery`) to validate that recovery after capped-unit loss works via `_update_enemy_ai` timer cadence, not only direct production-step calls.
- Validated five explicit conditions in F-65: cap-seed baseline, deterministic loss, timer-driven production growth, timer-driven return to cap, and post-recovery cap hold.
- Executed `/Applications/Godot.app/Contents/MacOS/godot --headless --quit --path . res://scenes/core/FirstDuelMap.tscn -- --duel-test-f65-enemy-timer-recovery --duel-test-f64-enemy-recovery-stress --duel-test-f63-enemy-cap-recovery --duel-test-f62-enemy-production-horizon --duel-test-f61-enemy-ai --duel-test-f38-production --duel-test-f37-combat --duel-test-f32-interaction --duel-test-f60-drag-select` and verified pass summaries for F-65, F-64, F-63, F-62, F-61, F-38, F-37, F-32, and F-60 with no script errors.

## Closure Delta 2026-06-14 (Stage 1 Readiness Slice: Enemy Timer Cycle Stress)

- Added deterministic F-66 enemy timer-cycle-stress hook (`--duel-test-f66-enemy-timer-cycle-stress`) to validate repeated loss-and-recovery behavior through `_update_enemy_ai` cadence across multiple cycles.
- Validated aggregate F-66 checks for cycle pass coverage, timer-path confirmation (`recovery_step > 0` each cycle), and cap-hold safety (`max_units_seen <= cap`).
- Executed `/Applications/Godot.app/Contents/MacOS/godot --headless --quit --path . res://scenes/core/FirstDuelMap.tscn -- --duel-test-f66-enemy-timer-cycle-stress --duel-test-f65-enemy-timer-recovery --duel-test-f64-enemy-recovery-stress --duel-test-f63-enemy-cap-recovery --duel-test-f62-enemy-production-horizon --duel-test-f61-enemy-ai --duel-test-f38-production --duel-test-f37-combat --duel-test-f32-interaction --duel-test-f60-drag-select` and verified pass summaries for F-66 through F-60 targeted flows with no script errors.

## Closure Delta 2026-06-14 (Stage 1 Readiness Slice: Enemy Timer Jitter Recovery)

- Added deterministic F-67 enemy timer-jitter-recovery hook (`--duel-test-f67-enemy-timer-jitter-recovery`) to validate repeated recovery behavior under variable `_update_enemy_ai` delta cadence.
- Validated aggregate F-67 checks for cycle pass coverage, jitter-path confirmation (`jitter_used=true` each cycle), and cap-hold safety (`max_units_seen <= cap`).
- Executed `/Applications/Godot.app/Contents/MacOS/godot --headless --quit --path . res://scenes/core/FirstDuelMap.tscn -- --duel-test-f67-enemy-timer-jitter-recovery --duel-test-f66-enemy-timer-cycle-stress --duel-test-f65-enemy-timer-recovery --duel-test-f64-enemy-recovery-stress --duel-test-f63-enemy-cap-recovery --duel-test-f62-enemy-production-horizon --duel-test-f61-enemy-ai --duel-test-f38-production --duel-test-f37-combat --duel-test-f32-interaction --duel-test-f60-drag-select` and verified pass summaries for F-67 through F-60 targeted flows with no script errors.

## Story Breakdown

```yaml
- story_id: S-1001
  title: Define primitive silhouette and shader language
  user_value: Players can parse faction roles and threats quickly at RTS zoom.
  dependencies: [none]
  acceptance_criteria:
    - Primitive shape grammar exists for all MVP role classes.
    - Shader baseline defines readability, faction tint, edge contrast, and specular discipline.
    - Camera-angle readability rules are explicit for gameplay views.
  validation:
    - type: manual
      method: review against docs/planning/game-vision.md visual policy and docs/planning/testing-strategy.md F-24
  status: done

- story_id: S-1002
  title: Create Helion primitive recipes
  user_value: Helion art implementation can begin with low-risk, reusable modeling patterns.
  dependencies: [S-1001]
  acceptance_criteria:
    - Line Engineer, Lancer Squad, Breach Team, Strider Bike, Ember Tank, and Sunforge Artillery each have primitive recipes.
    - Recipes include silhouette anchors, material zones, and animation-sensitive moving parts.
    - Helion reads as fast, angular, clean, and human-industrial.
  validation:
    - type: manual
      method: compare recipes to Helion roster roles and F-24 readability pass requirements
  status: done

- story_id: S-1003
  title: Create Veyari primitive recipes
  user_value: Veyari art implementation can begin with consistent alien forms that remain readable from all angles.
  dependencies: [S-1001]
  acceptance_criteria:
    - Brood Architect, Needle Brood, Rift Claw, Skitter Lance, Bulwark Husk, and Mire Spitter each have primitive recipes.
    - Recipes include silhouette anchors, material zones, and animation-sensitive moving parts.
    - Veyari reads as organic, asymmetric, and alien without sacrificing gameplay clarity.
  validation:
    - type: manual
      method: compare recipes to Veyari roster roles and F-24 readability pass requirements
  status: done

- story_id: S-1004
  title: Create MVP building primitive recipes
  user_value: Base-building and production visuals can be implemented quickly while remaining readable from all angles.
  dependencies: [S-1001]
  acceptance_criteria:
    - Shared buildable classes each have primitive recipes and shading zones.
    - Helion and Veyari structure mappings are defined for Tether Point through one T2 path.
    - Buildings preserve role readability in top and oblique camera views.
  validation:
    - type: manual
      method: compare recipes to docs/planning/unit-list.md buildable structure baseline and F-24 expectations
  status: done

- story_id: S-1005
  title: Lock angle-readability acceptance gate
  user_value: Objective-closure can validate art readiness with explicit criteria instead of subjective review.
  dependencies: [S-1002, S-1003, S-1004]
  acceptance_criteria:
    - Review checklist exists for default zoom, zoom-out, and rotated camera.
    - Unit and building completion criteria map to F-24.
    - Known failure modes are listed: silhouette collapse, tint ambiguity, glare loss, rotation confusion.
  validation:
    - type: manual
      method: reviewer can run the checklist without additional undocumented criteria
  status: done
```

## Execution Sequence

```yaml
objective: Primitive-first MVP art planning
steps:
  - order: 1
    action: implement
    detail: Write shared primitive silhouette and shader language for role classes and building classes.
  - order: 2
    action: validate
    detail: Check language against game-vision readability policy and F-24 expectations.
  - order: 3
    action: document
    detail: Update planning docs with reusable primitive and shading baseline.
  - order: 4
    action: implement
    detail: Write exact primitive recipes for Helion MVP units.
  - order: 5
    action: validate
    detail: Verify each Helion recipe preserves role separation at RTS zoom and rotated views.
  - order: 6
    action: document
    detail: Record Helion recipe table and unresolved art constraints.
  - order: 7
    action: implement
    detail: Write exact primitive recipes for Veyari MVP units.
  - order: 8
    action: validate
    detail: Verify each Veyari recipe preserves role separation and alien identity at RTS zoom and rotated views.
  - order: 9
    action: document
    detail: Record Veyari recipe table and unresolved art constraints.
  - order: 10
    action: implement
    detail: Write exact primitive recipes for shared MVP building classes and faction mappings.
  - order: 11
    action: validate
    detail: Verify buildings remain readable from top, oblique, and rotated camera views.
  - order: 12
    action: document
    detail: Add angle-readability checklist and handoff for objective-closure-first-agent.
```

## Validation Plan

- S-1001
  - functional test: review primitive and shader language against unit role classes in docs/planning/unit-list.md
  - manual fallback validation: art reviewer confirms no role class depends on close-up detail for recognition
- S-1002
  - functional test: compare Helion recipes to MVP unit list and animation mapping table
  - manual fallback validation: review Helion silhouettes at default and rotated camera assumptions from F-24
- S-1003
  - functional test: compare Veyari recipes to MVP unit list and animation mapping table
  - manual fallback validation: review Veyari silhouettes at default and rotated camera assumptions from F-24
- S-1004
  - integration test: compare building recipes to shared MVP buildable structure baseline and faction mappings
  - manual fallback validation: confirm top and side silhouette readability across T0 to T2 structure classes
- S-1005
  - smoke test: checklist can be executed end-to-end without undefined criteria
  - manual fallback validation: second reviewer can apply the checklist without verbal clarification

## Handoff Pack For objective-closure-first-agent

- Active objective queue is recorded in DEV_NEXT_STEPS.md.
- Objective closure should not mark any story complete without:
  - markdown recipe tables written
  - F-24-linked review notes captured
  - backlog and next-step references updated if scope expands

## Unresolved Assumptions

- A-004
  - owner: Tech lead
  - next action: confirm primitive-first presentation still communicates identity pillars in M2 visual review.

- A-005
  - owner: Tech lead
  - next action: verify MVP roster silhouettes alone are sufficient to communicate faction identity before full roster rollout.
- R-005
  - owner: Project owner
  - next action: keep plan locked to MVP Helion, Veyari, and shared building classes before expanding to Obsidian or future factions.

---

## Objective 2: World Systems and Environment Design Baseline

### Objective Summary

- Active objective name: World systems and environment design baseline
- Intended gameplay outcome: the battlefield feels like a living, readable world whose biome, lighting, time of day, terrain, and economy all reinforce strategic decisions and vary meaningfully across planets.
- Scope boundary: define system contracts and planet archetypes first; defer final art assets and numeric tuning to later passes.

### Story Breakdown

```yaml
- story_id: S-2001
  title: Define structure shading and material zones baseline
  user_value: Buildings are readable from all camera angles and communicate faction identity and damage state clearly.
  dependencies: [S-1001]
  acceptance_criteria:
    - Every shared MVP building class has a defined material zone map covering primary body, faction accent, emissive indicator, and damage overlay.
    - Shading rules cover ambient occlusion handling, specular limits, and faction-tint layer constraints.
    - Damaged and destroyed state visual rules are documented alongside healthy-state rules.
  validation:
    - type: manual
      method: review material zone maps against docs/planning/unit-list.md building classes and F-24 readability criteria
  status: done

- story_id: S-2002
  title: Define lighting model and day-night cycle system contract
  user_value: Time of day creates atmospheric variety and mild tactical scouting tradeoffs without hurting gameplay readability.
  dependencies: [S-2001]
  acceptance_criteria:
    - A lighting model is defined covering ambient, directional, and fill-light roles for each day phase.
    - Day-night cycle speed and phase count are specified as game parameters.
    - Readability floor rule is defined covering minimum contrast and emissive brightness at darkest night phase.
    - Night does not hide unit or building silhouettes below readability thresholds from game-vision visual policy.
  validation:
    - type: manual
      method: review lighting spec against F-24 readability floor and game-vision readability-first principle
  status: done

- story_id: S-2003
  title: Define world resource system and monetary layer
  user_value: Resource extraction and spending feel grounded in the world rather than abstract counters, and colony economies have a conversion mechanism.
  dependencies: [none]
  acceptance_criteria:
    - Alloy, Power, Data, and Reclaim are each mapped to a visible world source type (deposits, relay nodes, wreck fields, planetary vents).
    - A monetary or credit layer is defined as a secondary conversion mechanism for trade and colony economy.
    - Rules for how planetary biome affects base resource density are stated.
    - World resource system is consistent with the global stockpile model in docs/planning/economy-standards.md.
  validation:
    - type: integration
      method: compare resource world-source map against economy-standards.md global stockpile rules and verify no contradictions
  status: done

- story_id: S-2004
  title: Define planet biome archetypes and map parameterization rules
  user_value: Maps feel distinct across campaigns and skirmish without requiring full art rebuilds per map.
  dependencies: [S-2003]
  acceptance_criteria:
    - At least four biome archetypes are defined spanning desolate wasteland through lush jungle world.
    - Each biome specifies default resource density, colonization potential, terrain feature density, and plant life presence.
    - Map parameterization rules distinguish gameplay-driving variables from cosmetic-only variables.
    - Desolate planets have lower colonization yield and sparser plant life; fertile planets have higher yield and denser growth.
  validation:
    - type: manual
      method: verify biome table covers the full desolate-to-fertile spectrum with distinct resource and colonization rules per row
  status: done

- story_id: S-2005
  title: Define plant life and terrain design vocabulary
  user_value: Terrain and flora are purposeful game elements that affect pathing, cover, and scouting rather than being pure cosmetic dressing.
  dependencies: [S-2004]
  acceptance_criteria:
    - A terrain feature vocabulary is defined covering solid blockers, soft cover, traversable ramps, and destructible terrain.
    - Plant life types are classified as cosmetic-only, partial cover, or LOS blocker with explicit rules per class.
    - Fertile biomes have denser plant-life cover and LOS effects; desolate biomes have minimal or no plant-life effect.
    - Plant life must not obscure small 3D unit silhouettes below the readability floor from game-vision visual policy.
  validation:
    - type: manual
      method: review terrain vocabulary and plant-life rules against map-standards.md environment types and game-vision readability policy
  status: done

- story_id: S-2006
  title: Integrate structure shading with day-night cycle
  user_value: Buildings remain readable and faction-distinguishable at all times of day without requiring per-map lighting tuning.
  dependencies: [S-2001, S-2002]
  acceptance_criteria:
    - Emissive indicator rules ensure faction color and damage state are visible at minimum night lighting.
    - Ambient occlusion depth is constrained to avoid swallowing small building footprints at night.
    - Lighting phase transition rules prevent visual pop or readability loss during cycle changes.
  validation:
    - type: manual
      method: simulate dark phase against building material zones and confirm emissive and contrast floor is met
  status: done
```

### Execution Sequence

```yaml
objective: World systems and environment design baseline
steps:
  - order: 1
    action: implement
    detail: Write structure shading and material zone baseline for MVP building classes (S-2001).
  - order: 2
    action: validate
    detail: Review material zones against F-24 and game-vision readability policy.
  - order: 3
    action: document
    detail: Update planning docs with structure visual and material rules.
  - order: 4
    action: implement
    detail: Write lighting model and day-night cycle system contract (S-2002).
  - order: 5
    action: validate
    detail: Check lighting model against readability floor and minimum contrast requirements.
  - order: 6
    action: document
    detail: Record lighting spec in planning docs and update testing-strategy with readability-under-lighting flow.
  - order: 7
    action: implement
    detail: Write world resource system and monetary layer definitions (S-2003).
  - order: 8
    action: validate
    detail: Cross-check against economy-standards.md global stockpile model for consistency.
  - order: 9
    action: document
    detail: Update economy-standards.md with resource world-source map and monetary layer rules.
  - order: 10
    action: implement
    detail: Write planet biome archetypes table and map parameterization rules (S-2004).
  - order: 11
    action: validate
    detail: Verify biome table covers desolate-to-fertile spectrum and maps cleanly to resource and colonization rules.
  - order: 12
    action: document
    detail: Add biome archetypes section to map-standards.md and record decision as ADR.
  - order: 13
    action: implement
    detail: Write terrain and plant life vocabulary (S-2005).
  - order: 14
    action: validate
    detail: Verify vocabulary against map-standards.md environment types and game-vision readability policy.
  - order: 15
    action: document
    detail: Update map-standards.md terrain vocabulary section.
  - order: 16
    action: implement
    detail: Write day-night and structure-shading integration rules (S-2006).
  - order: 17
    action: validate
    detail: Simulate dark phase against material zones and confirm emissive and contrast floor passes.
  - order: 18
    action: document
    detail: Finalize visual and lighting integration notes in planning docs.
```

### Validation Plan

- S-2001: manual review of material zone maps against building classes and F-24 readability criteria.
- S-2002: manual review of lighting spec against readability floor rule and game-vision visual policy.
- S-2003: integration check of resource world-source map against economy-standards.md global stockpile rules.
- S-2004: manual verification of biome table covering desolate-to-fertile spectrum with distinct rules per row.
- S-2005: manual review of terrain and plant-life vocabulary against map-standards.md and readability policy.
- S-2006: dark-phase simulation confirms emissive and contrast floor is met for all building material zones.

### Unresolved Assumptions for Objective 2

- Monetary or credit layer mechanics are now defined in economy-standards.md (Credits secondary conversion model).
  - owner: Project owner
  - resolution: completed on 2026-06-10 in S-2003 closure.
- Day-night cycle speed is now specified in world-systems-baseline.md.
  - owner: Tech lead
  - resolution: completed on 2026-06-10 in S-2002 closure.
- Plant-life density rules are now defined in map-standards.md terrain and plant-life vocabulary.
  - owner: Tech lead
  - resolution: completed on 2026-06-10 in S-2005 closure.

---

## Objective 3: Stage 0 External Publication Closure (Parked)

### Objective Summary

- Active objective name: Stage 0 media capture and itch.io Coming Soon publication closure.
- Intended gameplay outcome: present truthful Pre-Alpha visibility with representative gameplay-first media and deterministic evidence capture.
- Scope boundary: in-repo preparation is complete; remaining execution requires manual external actions.
- Latest validation snapshot (2026-06-14): media capture and prepublish audit are complete (`READY`); remaining blockers are manual external publish and post-publish evidence propagation.

### Closure State

```yaml
- objective_id: O-3001
  title: Prepare Stage 0 media bundle (screenshots or clips) with gameplay-first captions
  status: closed
  blocker: none
  reentry_condition: none

- objective_id: O-3002
  title: Stage media package and pass prepublish audit
  status: closed
  blocker: none
  reentry_condition: none

- objective_id: O-3003
  title: Publish itch.io Stage 0 Coming Soon page with transparent Pre-Alpha status
  status: parked
  blocker: manual itch.io web publication and verification still required
  reentry_condition: execute docs/planning/itch-stage0-publish-runbook.md and record evidence using docs/tracking/stage0-publication-evidence-template.md

- objective_id: O-3004
  title: Capture Stage 0 publication evidence and validation notes
  status: parked
  blocker: requires successful page publication and first-update confirmation
  reentry_condition: complete docs/tracking/stage0-publication-evidence-template.md and pass docs/release/stage0-media/postpublish_gate.sh

- objective_id: O-3005
  title: Close Stage 0 blockers and transition to Stage 1 readiness lane
  status: parked
  blocker: requires closure propagation across planning and tracking artifacts
  reentry_condition: mark Stage 0 items complete in next-steps and synchronize change-log plus scenario-validation-notes
```

### Operator Command Aids

- `zsh docs/release/stage0-media/prepublish_audit.sh`
- `zsh docs/release/stage0-media/stage0_status_report.sh`
- `zsh docs/release/stage0-media/postpublish_gate.sh`
