# DEV_NEXT_STEPS

## Active Objective Queue

### 1. Primitive Visual Baseline for Units and Buildings

- Outcome: playable units and buildable structures use primitive-driven 3D forms plus readable shading from all gameplay camera angles.
- Scope boundary: current iteration is MVP-first, covering Helion, Veyari, and shared MVP building classes before wider faction rollout.

### Ordered Story Queue

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
  status: todo

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
  status: todo

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
  status: todo

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
  status: todo

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
  status: todo
```

## Unresolved Assumptions

- A-004: Core identity pillars can be demonstrated in one vertical slice scenario.
  - Owner: Tech lead
  - Next action: validate primitive-and-shader visual plan against M2 and M3 identity goals.
- A-005: Locked vertical-slice roster is sufficient to communicate faction identity before full roster implementation.
  - Owner: Tech lead
  - Next action: ensure primitive recipes preserve strong Helion versus Veyari silhouette differences during F-24 review.
