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
