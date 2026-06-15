# DEV_NEXT_STEPS

## Active Objective Queue

### 1. Primitive Visual Baseline for Units and Buildings

- Outcome: playable units and buildable structures use primitive-driven 3D forms plus readable shading from all gameplay camera angles.
- Scope boundary: current iteration is MVP-first, covering Helion, Veyari, and shared MVP building classes before wider faction rollout.

### Ordered Story Queue (Objective 2)

```yaml
- story_id: S-1001
  title: Define primitive silhouette and shader language
  user_value: Players can recognize units and buildings instantly at RTS zoom without relying on close-up detail.
  dependencies: [none]
  acceptance_criteria:
    - A primitive shape language is defined for infantry, light vehicles, armor, artillery, air units, and building classes.
    - A shared shader baseline is defined for readability, faction tinting, and angle-safe contrast.
    - Camera-angle readability requirements are stated for default zoom, zoom-out, and rotated views.
  validation:
    - type: manual
      method: Review the visual baseline against game-vision visual policy and F-24 readability expectations.
  status: done

- story_id: S-1002
  title: Plan Helion MVP unit primitive kits
  user_value: Helion units can be built quickly with a consistent readable visual language.
  dependencies: [S-1001]
  acceptance_criteria:
    - Every Helion MVP unit has a primitive recipe, silhouette intent, and material or shading rule set.
    - Recipes distinguish engineer, infantry, bike, tank, and artillery roles at gameplay distance.
    - Optional animation states do not require bespoke mesh logic outside the primitive baseline.
  validation:
    - type: manual
      method: Cross-check recipes against Helion MVP roster and F-24 readability criteria.
  status: done

- story_id: S-1003
  title: Plan Veyari MVP unit primitive kits
  user_value: Veyari units can be built quickly while remaining visually distinct from Helion at any camera angle.
  dependencies: [S-1001]
  acceptance_criteria:
    - Every Veyari MVP unit has a primitive recipe, silhouette intent, and material or shading rule set.
    - Recipes distinguish builder, swarm infantry, breach infantry, skirmisher, mainline armor, and siege roles.
    - Organic or alien identity is expressed through primitive composition and shader treatment rather than high-detail sculpt dependence.
  validation:
    - type: manual
      method: Cross-check recipes against Veyari MVP roster and F-24 readability criteria.
  status: done

- story_id: S-1004
  title: Plan MVP building primitive kits
  user_value: Base structures and production tech are readable from all angles and fast to iterate during gameplay implementation.
  dependencies: [S-1001]
  acceptance_criteria:
    - Shared MVP building classes have primitive recipes: Tether Point, Power Core, Alloy Extractor, Barracks-equivalent, Vehicle Structure, Sensor/Uplink, Expansion Hub, Light Defense Node, Advanced Ground Structure, Air Structure.
    - Faction-specific mappings are identified for Helion and Veyari equivalents.
    - Buildings have top silhouette, side silhouette, and faction-color readability rules.
  validation:
    - type: manual
      method: Verify building plan covers shared MVP buildable structure baseline and faction mappings.
  status: done

- story_id: S-1005
  title: Define angle-readability review and completion gate
  user_value: Art implementation can be accepted or rejected using explicit visibility rules instead of taste-only judgment.
  dependencies: [S-1002, S-1003, S-1004]
  acceptance_criteria:
    - A repeatable angle-readability checklist exists for units and buildings.
    - The checklist maps directly to F-24 and camera-zoom review.
    - Completion requires visible differentiation at default camera, rotated camera, and zoomed-out view.
  validation:
    - type: manual
      method: Review plan against F-24 and implementation-plan visual acceptance criteria.
  status: done
```

## Unresolved Assumptions

- A-004: Core identity pillars can be demonstrated in one vertical slice scenario.
  - Owner: Tech lead
  - Next action: validate primitive-and-shader visual plan against M2 and M3 identity goals.
- A-005: Locked vertical-slice roster is sufficient to communicate faction identity before full roster implementation.
  - Owner: Tech lead
  - Next action: ensure primitive recipes preserve strong Helion versus Veyari silhouette differences during F-24 review.

---

### 2. World Systems and Environment Design Baseline

- Outcome: battlefield feels like a living world whose biome, lighting, time of day, terrain, economy, and plant life reinforce strategic decisions and vary meaningfully across planets.
- Scope boundary: define system contracts and planet archetypes first; defer final art and numeric balance to later passes.

### Ordered Story Queue

```yaml
- story_id: S-2001
  title: Define structure shading and material zones
  user_value: Buildings are readable from all camera angles and communicate faction identity and damage state clearly.
  dependencies: [S-1001]
  acceptance_criteria:
    - Every shared MVP building class has a material zone map covering primary body, faction accent, emissive indicator, and damage overlay.
    - Shading rules cover ambient occlusion handling, specular limits, and faction-tint constraints.
    - Damaged and destroyed state visual rules are documented.
  status: done

- story_id: S-2002
  title: Define lighting model and day-night cycle contract
  user_value: Time of day creates atmospheric variety and mild tactical tradeoffs without hurting gameplay readability.
  dependencies: [S-2001]
  acceptance_criteria:
    - Lighting model covers ambient, directional, and fill-light roles per day phase.
    - Day-night cycle speed and phase count defined as game parameters.
    - Minimum contrast and emissive brightness specified for darkest night phase.
    - Night does not hide unit or building silhouettes below readability thresholds.
  status: done

- story_id: S-2003
  title: Define world resource system and monetary layer
  user_value: Resources feel grounded in the world and colony economies have a visible conversion mechanism.
  dependencies: [none]
  acceptance_criteria:
    - Alloy, Power, Data, and Reclaim each mapped to a visible world source type.
    - Monetary or credit layer defined for trade and colony economy conversion.
    - Biome effect on base resource density is stated.
    - Consistent with global stockpile model in economy-standards.md.
  status: done

- story_id: S-2004
  title: Define planet biome archetypes and map parameterization
  user_value: Maps feel distinct across campaigns and skirmish without full art rebuilds per map.
  dependencies: [S-2003]
  acceptance_criteria:
    - At least four biome archetypes spanning desolate wasteland through lush jungle world.
    - Each biome specifies resource density, colonization potential, terrain density, and plant life presence.
    - Desolate has lower yield and sparse flora; fertile has higher yield and dense growth.
    - Map parameterization rules distinguish gameplay-driving variables from cosmetic-only variables.
  status: done

- story_id: S-2005
  title: Define plant life and terrain design vocabulary
  user_value: Terrain and flora affect pathing, cover, and scouting as purposeful game elements.
  dependencies: [S-2004]
  acceptance_criteria:
    - Terrain vocabulary covers solid blockers, soft cover, traversable ramps, and destructible terrain.
    - Plant life classified as cosmetic-only, partial cover, or LOS blocker with explicit rules per class.
    - Fertile biomes have denser cover and LOS effects; desolate biomes have minimal or none.
    - Plant life must not obscure unit silhouettes below the readability floor.
  status: done

- story_id: S-2006
  title: Integrate structure shading with day-night cycle
  user_value: Buildings remain readable and faction-distinguishable at all times of day.
  dependencies: [S-2001, S-2002]
  acceptance_criteria:
    - Emissive rules ensure faction color and damage state visible at minimum night lighting.
    - Ambient occlusion depth constrained to avoid swallowing small building footprints at night.
    - Lighting phase transitions prevent visual pop or readability loss.
  status: done
```

### Unresolved Assumptions for Objective 2

- Monetary or credit layer mechanics now defined in economy-standards.md.
  - Owner: Project owner
  - Resolution: completed on 2026-06-10 during S-2003 closure.
- Day-night cycle speed now specified in world-systems-baseline.md.
  - Owner: Tech lead
  - Resolution: completed on 2026-06-10 during S-2002 closure.
- Plant-life density rules now defined in map-standards.md.
  - Owner: Tech lead
  - Resolution: completed on 2026-06-10 during S-2005 closure.

---

### 3. Stage 0 Publication Closure Lane (External, Parked)

- Outcome: close Stage 0 visibility lane with truthful Pre-Alpha page, representative gameplay media, and evidence-backed tracker updates.
- Scope boundary: remaining actions are external operator tasks; all in-repo preparation artifacts are complete.
- Latest validation snapshot (2026-06-14): `prepublish_audit.sh` reports `READY` (required screenshots present and policy-compliant); remaining blockers are external publication and post-publish evidence synchronization.
- Latest in-repo readiness snapshot (2026-06-14): F-73 enemy adaptive-jitter-quad-loss hook passed and reconfirmed no-regression status across F-72/F-71/F-70/F-69/F-68/F-67/F-66/F-65/F-64/F-63/F-62/F-61/F-38/F-37/F-32/F-60.
- Execution policy (2026-06-14): run Stage 1 in-repo readiness work in parallel while keeping O-3003 through O-3005 parked until manual publish evidence is captured.

### Parked Objective Queue

```yaml
- objective_id: O-3001
  title: Capture Stage 0 media set and finalize captions
  status: closed
  blocker: none
  reentry_condition: none

- objective_id: O-3002
  title: Stage media package and pass prepublish audit
  status: closed
  blocker: none
  reentry_condition: none

- objective_id: O-3003
  title: Publish itch.io Stage 0 Coming Soon page
  status: parked
  blocker: manual web publication required
  reentry_condition: execute docs/planning/itch-stage0-publish-runbook.md with visible Pre-Alpha label and no download exposed

- objective_id: O-3004
  title: Capture Stage 0 publication evidence and validation notes
  status: parked
  blocker: requires successful public page publish and update-post confirmation
  reentry_condition: complete docs/tracking/stage0-publication-evidence-template.md and post-publish checklist

- objective_id: O-3005
  title: Close Stage 0 blockers and transition to Stage 1 readiness lane
  status: parked
  blocker: requires evidence propagation across planning and tracking artifacts
  reentry_condition: mark Stage 0 items complete in next-steps and log closure in change-log plus scenario-validation-notes
```

### Closure Utilities

- `zsh docs/release/stage0-media/prepublish_audit.sh`
- `zsh docs/release/stage0-media/stage0_status_report.sh`
- `zsh docs/release/stage0-media/postpublish_gate.sh`
- `docs/planning/stage0-postpublish-closure-checklist.md`
- `docs/planning/stage0-operator-closure-worksheet.md`

---

### 4. Visual Scene Assembly and Playable First Build

- Outcome: the project transitions from a simulation-and-headless-validation baseline to a runnable visual game where a player can launch, select factions, enter the duel map, select units, issue move commands, and see the resource bar update.
- Scope boundary: minimum playable visual slice for M2 completion; does not require full art assets or combat AI - placeholder 3D shapes and live HUD wiring are the gate.

### Ordered Story Queue (Objective 4)

```yaml
- story_id: S-4001
  title: Wire Skirmish.tscn scene tree
  user_value: Players can open the faction selector screen without null node errors.
  dependencies: [none]
  acceptance_criteria:
    - Skirmish.tscn contains a CanvasLayer or Control root with OptionButton nodes named PlayerFactionSelector and EnemyFactionSelector.
    - A Label node named CampaignOrderLabel and a Label node named StatusLabel are present.
    - A Button for starting a match is connected to _on_start_match_button_pressed.
    - Scene loads and populates selectors correctly in in-editor run; no missing-node errors in output.
  validation:
    - type: functional
      method: Run Skirmish.tscn in editor and verify selectors populate with Helion and Veyari enabled and other factions disabled.
  status: done

- story_id: S-4002
  title: Replace 2D unit simulation actors with visible Node3D placeholders
  user_value: Players see unit shapes on the battlefield at default RTS camera height instead of invisible 2D nodes.
  dependencies: [S-4001]
  acceptance_criteria:
    - FirstDuelMap spawns Node3D units with MeshInstance3D using CSGBox3D or MeshInstance3D BoxMesh placeholders.
    - Helion units use a distinct color material; Veyari units use a distinct contrasting color.
    - Units are visible and distinguishable at the default Camera3D zoom documented in camera baseline.
    - SelectableUnit2D selection and movement logic remains intact; visual representation is additive.
  validation:
    - type: functional
      method: Launch duel map in editor, verify unit shapes are visible and faction-distinguishable at default zoom.
  status: done

- story_id: S-4003
  title: Add Camera3D with RTS baseline orbit and zoom
  user_value: Players can pan, rotate, and zoom the camera using documented key bindings.
  dependencies: [S-4002]
  acceptance_criteria:
    - FirstDuelMap.tscn includes a Camera3D node positioned at documented pitch and zoom defaults.
    - Pan, rotate, and zoom input actions respond to bindings from controls-standards.md.
    - All unit and map-item Node3D objects remain visible within the default zoom envelope.
  validation:
    - type: functional
      method: Run duel map in editor, verify pan, rotate, and zoom actions work and units remain in frame.
  status: done

- story_id: S-4004
  title: Wire HUD labels to live game state
  user_value: Players see alloy counts update during gather cycles and alerts fire on Tether penalty.
  dependencies: [S-4003]
  acceptance_criteria:
    - Resource bar label reflects alloy value from active simulation state, not a static placeholder string.
    - Alert label updates when Tether Point command penalty is triggered.
    - Match-state label transitions from active to win or loss when condition is met.
  validation:
    - type: integration
      method: Run gather cycle in editor, confirm resource bar increments; trigger Tether destruction and confirm alert fires.
  status: done

- story_id: S-4005
  title: Execute manual cold-launch visual smoke playthrough
  user_value: The full loop from cold launch to controllable units in duel map is confirmed playable with no blocking failures.
  dependencies: [S-4001, S-4002, S-4003, S-4004]
  acceptance_criteria:
    - Cold launch reaches splash, transitions to main menu, loads Skirmish, starts duel map without crash or blocking error.
    - Player can click to select at least one unit and right-click to issue a move command.
    - Resource bar updates at least once during session.
    - No null node errors or assert failures appear in the Godot output panel during the session.
  validation:
    - type: smoke
      method: Manual playthrough from cold launch to move command, recording any output-panel errors.
  status: done

- story_id: S-4006
  title: Implement click-based unit selection in visual runtime
  user_value: Player can actively select visible units rather than relying on test hooks.
  dependencies: [S-4002, S-4003]
  acceptance_criteria:
    - Left-click raycast from Camera3D selects one unit on click.
    - Additive selection works via queue-modifier key.
    - Selected units render clear highlight state.
  validation:
    - type: functional
      method: In editor run, click single and multiple units and verify selected-state transitions with no script errors.
  status: done

- story_id: S-4007
  title: Implement right-click move command in visual runtime
  user_value: Player can issue standard RTS move orders to selected units.
  dependencies: [S-4006]
  acceptance_criteria:
    - Right-click ray on ground issues world-space move target to selected units.
    - Units visibly move and stop at target destination.
    - Invalid target handling avoids crashes and emits rejection feedback.
  validation:
    - type: integration
      method: In editor run, right-click several map positions and verify selected units respond with expected movement behavior.
  status: done

- story_id: S-4008
  title: Add command acknowledgement feedback for input loop closure
  user_value: Player gets immediate confidence that selection and move commands were accepted.
  dependencies: [S-4007]
  acceptance_criteria:
    - Selection highlight updates instantly on click events.
    - Move-marker ping or equivalent feedback appears when move command is accepted.
    - UI feedback remains readable at default RTS zoom.
  validation:
    - type: functional
      method: In editor run, confirm every successful move command has visible acknowledgement feedback.
  status: done

- story_id: S-4009
  title: Implement live builder-driven structure placement
  user_value: Player can begin base development during live play instead of relying on hidden test hooks.
  dependencies: [S-4006, S-4007, S-4008]
  acceptance_criteria:
    - Selecting a builder and pressing B opens a minimal build menu.
    - Q, W, E, A, S, and D choose currently available buildable structures.
    - Left-click on valid ground places the selected structure and spawns a visible buildable node.
    - Invalid blocked placements are rejected with clear feedback.
  validation:
    - type: integration
      method: Run deterministic F-36 live build placement validation and verify successful Power Core placement plus stable build-state tracking.
  status: done

- story_id: S-4010
  title: Implement live right-click enemy attack and combat resolution
  user_value: Player can start active engagements in runtime by issuing direct attack commands instead of only moving or gathering.
  dependencies: [S-4006, S-4007, S-4008]
  acceptance_criteria:
    - Right-click on an enemy unit issues an attack command for selected player units.
    - Attack orders persist with chase behavior until target enters range or is destroyed.
    - Combat applies deterministic damage ticks and removes destroyed units cleanly from active runtime state.
    - Existing movement, gather, and build loops remain functional after combat integration.
  validation:
    - type: integration
      method: Run deterministic F-37 combat validation and verify attack issuance, damage progression, and target destruction evidence.
  status: done

- story_id: S-4011
  title: Implement live production menu and structure-gated unit spawning
  user_value: Player can grow battlefield forces during runtime using production commands rather than static opening squads.
  dependencies: [S-4009, S-4010]
  acceptance_criteria:
    - Pressing P opens a production menu for the selected player slot.
    - Number hotkeys queue valid production options and reject locked options cleanly.
    - Produced units spawn as live controllable actors and integrate with existing movement and combat systems.
    - Production respects structure-gated requirements from the documented production chain.
  validation:
    - type: integration
      method: Run deterministic F-38 production validation and verify infantry plus vehicle creation with live spawn evidence.
  status: done
```
