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
| T-0046 | M4 | P0 | Execute Stage 0 media capture and caption finalization from the approved shot list (external operator step) | Release Operations | S | T-0045 | Media bundle has 3 to 6 screenshots, optional clips, and finalized gameplay-first captions matching current scope | Todo |
| T-0047 | M4 | P0 | Stage media package and pass prepublish audit with zero unresolved findings | Release Operations | S | T-0046 | docs/release/stage0-media/prepublish_audit.sh reports pass and package naming plus caption checks are valid | Todo |
| T-0048 | M4 | P0 | Publish itch.io Stage 0 Coming Soon page per runbook with Pre-Alpha transparency and no download exposed (external operator step) | Project Owner | S | T-0047 | Runbook publish steps are completed and public page shows Pre-Alpha label with follow CTA and no downloadable build | Todo |
| T-0049 | M4 | P0 | Capture publication evidence and sync trackers after publish | Project Owner | S | T-0048 | stage0-publication-evidence-template.md is completed and URL, timestamp, media count, and update-post confirmation are recorded | Todo |
| T-0050 | M4 | P0 | Close Stage 0 blocker lane and transition to Stage 1 planning readiness | Project Owner | S | T-0049 | next-steps blocker items are checked, DEV_NEXT_STEPS parked objectives are closed, and M4 ready queue includes Stage 1 prep tasks | Todo |
| T-0051 | M2 | P0 | Build Skirmish.tscn scene tree with OptionButton nodes, label nodes, and start button matching @onready references in Skirmish.gd | Gameplay Systems | M | T-0027 | Skirmish scene loads without null @onready errors and faction selector populates correctly in-editor run | Done |
| T-0052 | M2 | P0 | Replace 2D SelectableUnit2D simulation actors with Node3D unit actor placeholders readable at default RTS camera height | Visual Systems | L | T-0001, T-0002 | F-01 and F-02 pass with visible 3D units in scene view at default zoom; no missing-node errors | Done |
| T-0053 | M2 | P0 | Add Camera3D to FirstDuelMap.tscn with baseline pitch, zoom, and rotate bindings from controls-standards.md | Core Systems | M | T-0017, T-0052 | Camera starts at documented pitch and zoom defaults and responds to pan and rotate bindings; F-19 camera checks pass in visual run | Done |
| T-0054 | M2 | P0 | Wire resource bar, alert label, and match-state label to live game-state signals so HUD updates from actual alloy totals and events | UI Systems | M | T-0018, T-0053 | Resource bar reflects real alloy increments during gather loop; alert label updates on Tether penalty; F-19 HUD sync passes in visual run | Done |
| T-0055 | M2 | P0 | Execute cold-launch smoke playthrough from splash through skirmish start to first duel map with controllable units | QA and Validation | S | T-0051, T-0052, T-0053, T-0054, T-0056, T-0057, T-0058, T-0059 | Playthrough completes without crash, player can select units and issue move command, and resource bar updates from gather action | Done |
| T-0056 | M2 | P0 | Implement left-click world selection using Camera3D ray query against selectable unit collision shapes | Gameplay Systems | M | T-0052, T-0053 | Clicking a visible unit selects it, prior selection clears unless modifier is held, and selected state is visually obvious | Done |
| T-0057 | M2 | P0 | Implement right-click move command dispatch from mouse ray hit to selected units in world space | Gameplay Systems | M | T-0056 | Right-click on ground issues move target to selected units and units visibly move to destination | Done |
| T-0058 | M2 | P1 | Add command acknowledgement feedback (selection ring or tint pulse plus move marker ping) | UI Systems | S | T-0057 | Player receives immediate visual confirmation for selection and move command acceptance | Done |
| T-0059 | M2 | P1 | Add minimal world blockers and no-go collision zones to validate path response and command rejection behavior | Level Design | S | T-0057 | Units do not pass through blocker volumes and invalid move targets show rejection feedback without crash | Done |
| T-0060 | M2 | P0 | Run interaction validation pass for click-select, multi-select modifier, right-click move, and command feedback | QA and Validation | S | T-0056, T-0057, T-0058 | New interaction flow passes in editor run and no input-action missing errors appear during duel-map session | Done |
| T-0061 | M2 | P0 | Implement live builder-driven structure placement with build menu, hotkey selection, and ground placement click | Gameplay Systems | M | T-0056, T-0058 | Builder can open build menu, choose available structure, and place it on valid ground with visible structure spawn | Done |
| T-0062 | M2 | P0 | Run runtime build placement validation for live structure creation flow | QA and Validation | S | T-0061 | F-36 passes with successful live Power Core placement and stable build-state tracking | Done |
| T-0063 | M2 | P0 | Implement live enemy-target right-click attack command with health-based damage resolution | Gameplay Systems | M | T-0057, T-0058 | Selected player units can attack an enemy target via right-click and enemy health decreases until destruction with no runtime errors | Done |
| T-0064 | M2 | P0 | Run runtime combat validation pass for live attack command and unit destruction loop | QA and Validation | S | T-0063 | F-37 passes with deterministic attack issuance, damage ticks, and target-destruction evidence | Done |
| T-0065 | M2 | P0 | Implement live production menu and unit spawn loop from built structures | Gameplay Systems | M | T-0061, T-0063 | Pressing production hotkeys queues valid units and spawns live controllable actors for the selected slot without runtime errors | Done |
| T-0066 | M2 | P0 | Run runtime production validation pass for live unit creation loop | QA and Validation | S | T-0065 | F-38 passes with deterministic infantry and vehicle production plus live spawn evidence | Done |
| T-0067 | M3 | P0 | Implement global stockpile runtime state with reserve and cap tracking for Alloy, Power, Data, and Reclaim | Core Systems | M | T-0066 | Runtime emits deterministic stockpile snapshots and applies reserve-cap constraints without negative values | Done |
| T-0068 | M3 | P0 | Implement stockpile threshold-crossing and floor-clamp logic with warning-state hooks | Core Systems | M | T-0067 | Soft and hard depletion thresholds trigger correctly and floor clamp prevents reserve below zero | Done |
| T-0069 | M3 | P0 | Implement bounded world-event trigger and apply pipeline for positive and negative resource shifts | Core Systems | M | T-0068 | Forced positive and negative events apply bounded deltas and preserve anti-collapse guardrails | Done |
| T-0070 | M3 | P1 | Wire stockpile and world-event UI telemetry payloads with deterministic sequence ids | UI and Telemetry Systems | M | T-0069 | Trigger, apply, block, and UI-ack payloads emit in deterministic order and match displayed values | Done |
| T-0071 | M3 | P0 | Run integrated stockpile-event runtime validation pass and capture evidence | QA and Validation | S | T-0068, T-0069, T-0070 | First M3 runtime validation pass records threshold warning, event ordering, and clamp behavior evidence | Done |
