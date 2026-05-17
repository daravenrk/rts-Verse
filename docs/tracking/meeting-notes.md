# Meeting Notes

Use this running log for planning and architecture sync notes.

## Template

## YYYY-MM-DD Meeting Title

- Participants:
- Agenda:
- Decisions made:
- Open questions:
- Action items:
  - [ ] Item, owner, due date
- References:

## 2026-05-17 Documentation Kickoff

- Participants: Project owner
- Agenda: Establish baseline tracking and architecture files
- Decisions made:
  - Create docs-based tracking system as project source of truth.
- Open questions:
  - What is the target platform sequence for release?
- Action items:
  - [ ] Define coding conventions and add to planning artifacts.
  - [ ] Define vertical slice acceptance criteria.
- References:
  - docs/architecture/decision-log.md
  - docs/planning/implementation-plan.md

## 2026-05-17 Conventions and Quality Baseline

- Participants: Project owner
- Agenda: Define practical standards and planning support docs for active implementation.
- Decisions made:
  - Adopt project conventions for naming, structure, and documentation update rules.
  - Adopt task backlog, testing strategy, and definition-of-done artifacts.
- Open questions:
  - Should automated test harness work start in M2 or M3?
- Action items:
  - [ ] Assign owners and estimates to M2 seed backlog tasks.
  - [ ] Execute first two M2 functional flows and capture results.
- References:
  - docs/planning/conventions.md
  - docs/planning/task-backlog.md
  - docs/planning/testing-strategy.md
  - docs/planning/definition-of-done.md

## 2026-05-17 Game Vision Alignment

- Participants: Project owner
- Agenda: Formalize intended RTS identity and convert into planning constraints.
- Decisions made:
  - Adopt vision direction of daravenrk's Command and Conquer plus Total Annihilation inspired gameplay identity.
  - Require original creative execution with non-derivative factions, units, and naming.
- Open questions:
  - Which faction asymmetry model should be validated first in M2?
- Action items:
  - [ ] Extend M2 test flows with asymmetry and expansion pressure checks.
  - [ ] Update seed backlog tasks with pillar alignment notes.
- References:
  - docs/planning/game-vision.md
  - docs/architecture/decision-log.md

## 2026-05-17 Faction Roster and Tech Baseline

- Participants: Project owner
- Agenda: Define full faction progression and unit roster planning artifacts.
- Decisions made:
  - Lock prototype factions as Helion Directorate and Obsidian Forge.
  - Use full-faction planning with a narrower vertical-slice implementation lock.
- Open questions:
  - Which Tier 2 unlock path should each faction prototype first for best signal-to-effort ratio?
- Action items:
  - [ ] Break T-0006 through T-0009 into scene, script, and data tasks.
  - [ ] Run F-05 once first playable locked-roster build exists.
- References:
  - docs/planning/tech-tree.md
  - docs/planning/unit-list.md

## 2026-05-17 Map and Economy Standards

- Participants: Project owner
- Agenda: Define source-of-truth standards for start positions, resource layout, pricing, and map-control economy.
- Decisions made:
  - Duel map layout will be standardized around fair starts, natural expansions, contested midfield resources, and at least one contested Data Node.
  - Pricing will use relative bands first, with numeric values deferred until prototype playtesting.
- Open questions:
  - What exact travel-time parity band should be accepted for spawn fairness on the first duel map?
- Action items:
  - [ ] Build first duel map to map-standards.md baseline.
  - [ ] Draft initial numeric price sheet from economy-standards.md.
- References:
  - docs/planning/map-standards.md
  - docs/planning/economy-standards.md
