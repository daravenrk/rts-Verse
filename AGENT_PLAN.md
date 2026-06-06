# AGENT_PLAN

## Objective Summary

- Active objective name: Primitive-first visual implementation plan for units and buildings
- Intended gameplay outcome: deliver a fast, readable 3D battlefield presentation where MVP units and structures are recognizable from all camera angles using primitive forms and controlled shading.
- Scope boundary for this iteration: plan MVP Helion and Veyari units plus shared MVP buildable structures first; defer non-MVP factions and high-detail polish.

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
  status: todo

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
  status: todo

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
  status: todo

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
  status: todo

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
  status: todo
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