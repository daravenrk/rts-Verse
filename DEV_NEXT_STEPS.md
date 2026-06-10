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

### Parked Objective Queue

```yaml
- objective_id: O-3001
  title: Capture Stage 0 media set and finalize captions
  status: parked
  blocker: manual media capture and export required
  reentry_condition: select 3 to 6 screenshots plus optional clips and finalize captions from stage0-media-bundle-spec

- objective_id: O-3002
  title: Stage media package and pass prepublish audit
  status: parked
  blocker: external media assets must be available before audit can run to completion
  reentry_condition: populate docs/release/stage0-media/ and pass zsh docs/release/stage0-media/prepublish_audit.sh

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
- `docs/planning/stage0-postpublish-closure-checklist.md`
- `docs/planning/stage0-operator-closure-worksheet.md`
