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
| T-0001 | M2 | P0 | Implement RTS unit selection and multi-select behavior | Gameplay Systems | M | None | Manual scenario: select one and many units reliably | Done |
| T-0002 | M2 | P0 | Implement right-click movement command and pathing baseline | Gameplay Systems | M | T-0001 | Units move to target destination without deadlock | Done |
| T-0003 | M2 | P0 | Implement basic resource gather loop | Economy Systems | M | T-0002 | Resource total increases from gather interaction | Done |
| T-0004 | M2 | P1 | Add temporary HUD for resources and win/loss state | UI Systems | S | T-0003 | HUD reflects state changes during playthrough | Done |
| T-0005 | M2 | P1 | Document M2 validation scenarios in testing strategy | QA and Validation | S | None | Scenario checklist completed and reviewed | Done |
| T-0006 | M2 | P0 | Implement Helion Directorate Tier 0 and Tier 1 production chain | Faction Systems | L | T-0003 | Helion can build locked slice units from documented structures | Done |
| T-0007 | M2 | P0 | Implement Obsidian Forge Tier 0 and Tier 1 production chain | Faction Systems | L | T-0003 | Obsidian can build locked slice units from documented structures | Done |
| T-0008 | M2 | P1 | Implement faction-specific roster behaviors for locked slice units | Faction Systems | L | T-0006, T-0007 | Unit roles match notes in planning/unit-list.md | Done |
| T-0009 | M3 | P1 | Prototype one Tier 2 unlock path per faction from planning/tech-tree.md | Unassigned | L | T-0008 | Each faction reaches a representative Tier 2 unit in scenario play | Done |
| T-0010 | M2 | P0 | Build first duel map to planning/map-standards.md baseline | Level Design | L | T-0002, T-0003 | Both spawns satisfy fairness and expansion standards | Done |
| T-0011 | M2 | P1 | Implement Data Node, contested Alloy deposits, and reclaim field objectives | Level Design | M | T-0010 | Map objectives support resource-control and first contested fights | Done |
| T-0012 | M3 | P0 | Create initial numeric price sheet for locked vertical-slice units and structures | Unassigned | M | T-0006, T-0007, T-0010 | Price sheet satisfies economy-standards.md opening and expansion rules | Done |
| T-0013 | M3 | P1 | Validate faction economy identity against resource-control standards | Unassigned | M | T-0011, T-0012 | Helion and Obsidian express intended tempo and attrition differences | Done |
| T-0014 | M2 | P0 | Implement Veyari Ascendancy Tier 0 and Tier 1 production chain for alien MVP faction | Faction Systems | L | T-0003 | Veyari can build all MVP lock units from documented structures | Done |
| T-0015 | M2 | P0 | Validate Helion and Veyari MVP duel roster lock completeness | QA and Validation | M | T-0006, T-0014 | F-16 passes with no undefined unit or structure dependencies | Done |
| T-0016 | M2 | P1 | Implement map-aware tactical behaviors for lane choice, objective contest, and regroup logic | AI Systems | L | T-0002, T-0010, T-0011 | F-17 passes for both factions across both spawns | Done |
| T-0017 | M2 | P0 | Implement keyboard and mouse control bindings from planning/controls-standards.md | Input Systems | M | T-0001, T-0002 | F-18 passes all command and group control checks | Done |
| T-0018 | M2 | P0 | Implement MVP HUD baseline: resource bar, minimap, command card, alerts, and queues | UI Systems | L | T-0004, T-0017 | F-19 passes camera and HUD synchronization checks | Done |
| T-0019 | M2 | P1 | Add remappable hotkeys and camera sensitivity settings with persistence | Input Systems | M | T-0017 | F-19 optional settings persistence passes after restart | Done |
| T-0020 | M2 | P0 | Implement phase-gated activation for advanced civilization systems | Core Systems | M | T-0006, T-0014 | F-21 confirms advanced systems are gated during opening window | Done |
| T-0021 | M2 | P1 | Add opening parity telemetry for expansion timing, first factory timing, and first contested objective timing | Telemetry Systems | M | T-0010, T-0011 | F-21 parity metrics are recorded for both factions and spawns | Done |
| T-0022 | M3 | P1 | Tune faction-specific stabilization models for equivalent opening viability | Unassigned | L | T-0020, T-0021 | Opening parity maintained while late-game identities diverge | Done |
| T-0023 | M2 | P0 | Implement Tether Point primary base behavior and MVP buildable structure chain | Core Systems | L | T-0003, T-0006, T-0014 | F-22 passes for Helion, Obsidian, and Veyari from both spawns | Done |
| T-0024 | M2 | P0 | Implement startup splash to main menu gate with keypress or 5-second timeout and Campaign Coming Soon lock | UX Systems | M | T-0017, T-0018 | F-23 passes for both transition paths and disabled campaign behavior | Done |
| T-0025 | M2 | P0 | Implement small-scale 3D unit presentation and predefined animation subspace baseline for MVP roster | Visual Systems | L | T-0006, T-0014, T-0018 | F-24 passes for readability and required animation state coverage | Done |
| T-0026 | M3 | P0 | Define campaign mission-order data with Veyari-first and Helion-last perspective progression | Unassigned | M | T-0015 | F-25 confirms campaign perspective order definition is consistent and complete | Done |
| T-0027 | M2 | P0 | Implement skirmish faction selection gate for all available factions with disabled Coming Soon entries for unavailable factions | UX Systems | M | T-0015, T-0024 | F-25 validates selectable available factions and disabled unavailable entries | Done |
| T-0028 | M2 | P0 | Define and apply primary environment type for first duel map; confirm Tether Points spawn at map-defined positions for all factions | Level Design | M | T-0010, T-0023 | F-26 confirms environment readability and faction-agnostic spawn positions | Done |
| T-0029 | M3 | P1 | Expand environment catalog into skirmish and campaign map variants with one-primary-one-secondary shape rule | Unassigned | M | T-0028 | Environment types create varied but readable fights across future maps | Done |
| T-0030 | M3 | P0 | Map all existing and planned units and structures to a unified five-tier model artifact | Design Systems | M | T-0014, T-0015 | Five-tier mapping artifact is complete and references all five target factions | Done |
| T-0031 | M3 | P0 | Update testing flows and backlog references for five-tier progression coverage | QA and Validation | M | T-0030 | F-29 is defined in testing strategy and reflected in planning trackers | Done |
| T-0032 | M3 | P0 | Update testing flows and backlog references for named five-faction coverage | QA and Validation | M | T-0030 | F-30 is defined in testing strategy and reflected in planning trackers | Done |
| T-0033 | M3 | P0 | Define bounded random world event table for global stockpile volatility | Economy Systems | M | T-0032 | Economy standards includes positive and negative bounded event catalog and cadence guardrails | Done |
| T-0034 | M3 | P0 | Add UI and telemetry checklist for global stockpile visibility and world event announcements | UI and Telemetry Systems | M | T-0033 | Checklist artifact exists and is referenced by testing and validation trackers | Done |
| T-0035 | M3 | P0 | Define era transition triggers and pacing targets for Survival, Augmented, Autonomous, and Network warfare phases | Core Systems Design | M | T-0034 | World systems baseline includes explicit trigger thresholds and pacing guardrails; F-12 aligned | Done |
| T-0036 | M3 | P0 | Draft ideology paths for Purists, Symbiotes, and Cybernetic Ascendants with strengths and failure modes | Narrative and Systems Design | M | T-0035 | Ideology baseline artifact defines strengths, liabilities, and failure modes for all three paths | Done |
| T-0037 | M3 | P0 | Define One Box original-core penalty rules and distributed network recovery mechanics | Core Systems Design | M | T-0036 | Baseline artifact defines penalty profile, staged recovery, and guardrails | Done |
| T-0038 | M3 | P0 | Define maintenance-instability model for high-tier automation (upkeep, bandwidth, cooling, logistics) | Core Systems Design | M | T-0037 | Baseline artifact defines threshold bands, instability levels, and anti-snowball safeguards | Done |
| T-0039 | M3 | P0 | Add infrastructure warfare design checklist for system-targeting superweapons and command disruption effects | Systems Design | M | T-0038 | Checklist artifact defines disruption, counterplay, telemetry, and validation requirements | Done |
| T-0040 | M3 | P0 | Define Descent access-node control rules and orbital corridor contest mechanics | Systems Design | M | T-0039 | Descent baseline defines node classes, ownership effects, and corridor state rules | Done |
| T-0041 | M3 | P0 | Define Descent event catalog with bounded cadence | Systems Design | M | T-0040 | Descent baseline includes bounded event categories and cadence guardrails | Done |
| T-0042 | M3 | P0 | Define dynamic evolution branch thresholds for machine, alien, and hybrid progression | Systems Design | M | T-0041 | Dynamic evolution baseline includes entry, commitment, and deepening thresholds | Done |
| T-0043 | M3 | P0 | Add player-facing readability rules for branch state, Descent status, and event warning windows | UX and Telemetry Systems | M | T-0042 | Dynamic evolution baseline includes explicit readability fail conditions and warning-window rules | Done |
| T-0044 | M3 | P1 | Prepare Stage 0 media bundle specification with gameplay-first shot list and caption drafts | Release Planning | S | T-0043 | Media specification artifact defines required shots, captions, and acceptance checklist | Done |
| T-0045 | M3 | P1 | Prepare deterministic itch.io Stage 0 publication runbook and post-publish validation checklist | Release Planning | S | T-0044 | Runbook artifact defines manual publication procedure and evidence capture fields | Done |
