# Project Conventions

This document defines shared conventions for consistency, maintainability, and faster onboarding.

## Naming Conventions

- Scenes: PascalCase and descriptive, for example MainMenu.tscn, UnitFactory.tscn.
- Script files: Match scene or system names, PascalCase when class-based.
- Node names in scenes: PascalCase for semantic nodes and ALL_CAPS only for constants.
- Signals: snake_case verbs, for example unit_selected, resource_depleted.
- Variables and functions in scripts: snake_case.
- Constants and enums: UPPER_SNAKE_CASE.

## Folder Conventions

- scenes: playable scenes and UI scenes.
- scripts: gameplay and framework logic.
- assets: sprites, audio, and imported art.
- data: balance tables, static config resources.
- tests: automated or scripted validation artifacts when introduced.

Recommended top-level layout for growth:

- scenes/core
- scenes/ui
- scripts/core
- scripts/gameplay
- scripts/ui
- assets/art
- assets/audio
- data/gameplay

## Scene and Script Structure

- Keep one primary responsibility per scene.
- Avoid very large scene trees; split reusable units into child scenes.
- Keep Godot singleton usage explicit and documented in ADRs when introduced.
- Prefer composition of nodes and resources over deep inheritance chains.

## Input and Simulation

- Centralize input action names and avoid duplicate bindings.
- Keep deterministic gameplay logic separated from UI presentation where practical.
- Time-sensitive gameplay logic should use fixed process when deterministic behavior is needed.

## Logging and Diagnostics

- Prefix major system logs with subsystem tags, for example [AI], [Economy], [Combat].
- Avoid noisy per-frame logging in normal execution.
- When introducing debug commands, document them in meeting notes or a debug appendix.

## Documentation Rules

- Any architecture-impacting change requires:
  - ADR entry in architecture/decision-log.md.
  - Research evidence entry in research/research-log.md.
- Any scope-impacting change requires:
  - update to planning/implementation-plan.md.
  - update to planning/next-steps.md.

## Pull Request Readiness Checklist

- Conventions are followed or deviations are documented.
- Plan and next-step references are updated.
- Validation notes are attached with expected and observed outcomes.
