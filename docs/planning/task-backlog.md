# Task Backlog

Use this file for implementation-ready tasks linked to milestones.

## Prioritization Rules

- P0: Blocks milestone completion.
- P1: Important but not blocking.
- P2: Nice-to-have or post-milestone improvement.

## Task Template

| ID | Milestone | Priority | Task | Owner | Estimate | Dependencies | Validation | Status |
| --- | --- | --- | --- | --- | --- | --- | --- | --- |
| T-XXXX | M# | P0/P1/P2 | Short action-oriented description | Name | S/M/L | IDs or none | Test flow or acceptance check | Todo/In Progress/Done/Blocked |

## Seed Backlog

| ID | Milestone | Priority | Task | Owner | Estimate | Dependencies | Validation | Status |
| --- | --- | --- | --- | --- | --- | --- | --- | --- |
| T-0001 | M2 | P0 | Implement RTS unit selection and multi-select behavior | Unassigned | M | None | Manual scenario: select one and many units reliably | Todo |
| T-0002 | M2 | P0 | Implement right-click movement command and pathing baseline | Unassigned | M | T-0001 | Units move to target destination without deadlock | Todo |
| T-0003 | M2 | P0 | Implement basic resource gather loop | Unassigned | M | T-0002 | Resource total increases from gather interaction | Todo |
| T-0004 | M2 | P1 | Add temporary HUD for resources and win/loss state | Unassigned | S | T-0003 | HUD reflects state changes during playthrough | Todo |
| T-0005 | M2 | P1 | Document M2 validation scenarios in testing strategy | Unassigned | S | None | Scenario checklist completed and reviewed | Todo |
| T-0006 | M2 | P0 | Implement Helion Directorate Tier 0 and Tier 1 production chain | Unassigned | L | T-0003 | Helion can build locked slice units from documented structures | Todo |
| T-0007 | M2 | P0 | Implement Obsidian Forge Tier 0 and Tier 1 production chain | Unassigned | L | T-0003 | Obsidian can build locked slice units from documented structures | Todo |
| T-0008 | M2 | P1 | Implement faction-specific roster behaviors for locked slice units | Unassigned | L | T-0006, T-0007 | Unit roles match notes in planning/unit-list.md | Todo |
| T-0009 | M3 | P1 | Prototype one Tier 2 unlock path per faction from planning/tech-tree.md | Unassigned | L | T-0008 | Each faction reaches a representative Tier 2 unit in scenario play | Todo |
| T-0010 | M2 | P0 | Build first duel map to planning/map-standards.md baseline | Unassigned | L | T-0002, T-0003 | Both spawns satisfy fairness and expansion standards | Todo |
| T-0011 | M2 | P1 | Implement Data Node, contested Alloy deposits, and reclaim field objectives | Unassigned | M | T-0010 | Map objectives support resource-control and first contested fights | Todo |
| T-0012 | M3 | P0 | Create initial numeric price sheet for locked vertical-slice units and structures | Unassigned | M | T-0006, T-0007, T-0010 | Price sheet satisfies economy-standards.md opening and expansion rules | Todo |
| T-0013 | M3 | P1 | Validate faction economy identity against resource-control standards | Unassigned | M | T-0011, T-0012 | Helion and Obsidian express intended tempo and attrition differences | Todo |
| T-0014 | M2 | P0 | Implement Veyari Ascendancy Tier 0 and Tier 1 production chain for alien MVP faction | Unassigned | L | T-0003 | Veyari can build all MVP lock units from documented structures | Todo |
| T-0015 | M2 | P0 | Validate Helion and Veyari MVP duel roster lock completeness | Unassigned | M | T-0006, T-0014 | F-16 passes with no undefined unit or structure dependencies | Todo |
| T-0016 | M2 | P1 | Implement map-aware tactical behaviors for lane choice, objective contest, and regroup logic | Unassigned | L | T-0002, T-0010, T-0011 | F-17 passes for both factions across both spawns | Todo |
| T-0017 | M2 | P0 | Implement keyboard and mouse control bindings from planning/controls-standards.md | Unassigned | M | T-0001, T-0002 | F-18 passes all command and group control checks | Done |
| T-0018 | M2 | P0 | Implement MVP HUD baseline: resource bar, minimap, command card, alerts, and queues | Unassigned | L | T-0004, T-0017 | F-19 passes camera and HUD synchronization checks | Done |
| T-0019 | M2 | P1 | Add remappable hotkeys and camera sensitivity settings with persistence | Unassigned | M | T-0017 | F-19 optional settings persistence passes after restart | Done |
| T-0020 | M2 | P0 | Implement phase-gated activation for advanced civilization systems | Unassigned | M | T-0006, T-0014 | F-21 confirms advanced systems are gated during opening window | Done |
| T-0021 | M2 | P1 | Add opening parity telemetry for expansion timing, first factory timing, and first contested objective timing | Unassigned | M | T-0010, T-0011 | F-21 parity metrics are recorded for both factions and spawns | Done |
| T-0022 | M3 | P1 | Tune faction-specific stabilization models for equivalent opening viability | Unassigned | L | T-0020, T-0021 | Opening parity maintained while late-game identities diverge | Done |
| T-0023 | M2 | P0 | Implement Tether Point primary base behavior and MVP buildable structure chain | Unassigned | L | T-0003, T-0006, T-0014 | F-22 passes for Helion, Obsidian, and Veyari from both spawns | Done |
| T-0024 | M2 | P0 | Implement startup splash to main menu gate with keypress or 5-second timeout and Campaign Coming Soon lock | Unassigned | M | T-0017, T-0018 | F-23 passes for both transition paths and disabled campaign behavior | Done |
| T-0025 | M2 | P0 | Implement small-scale 3D unit presentation and predefined animation subspace baseline for MVP roster | Unassigned | L | T-0006, T-0014, T-0018 | F-24 passes for readability and required animation state coverage | Done |
| T-0026 | M3 | P0 | Define campaign mission-order data with Veyari-first and Helion-last perspective progression | Unassigned | M | T-0015 | F-25 confirms campaign perspective order definition is consistent and complete | Done |
| T-0027 | M2 | P0 | Implement skirmish faction selection gate for all available factions with disabled Coming Soon entries for unavailable factions | Unassigned | M | T-0015, T-0024 | F-25 validates selectable available factions and disabled unavailable entries | Done |
| T-0028 | M2 | P0 | Define and apply primary environment type for first duel map; confirm Tether Points spawn at map-defined positions for all factions | Unassigned | M | T-0010, T-0023 | F-26 confirms environment readability and faction-agnostic spawn positions | Done |
| T-0029 | M3 | P1 | Expand environment catalog into skirmish and campaign map variants with one-primary-one-secondary shape rule | Unassigned | M | T-0028 | Environment types create varied but readable fights across future maps | Done |
