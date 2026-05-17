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
