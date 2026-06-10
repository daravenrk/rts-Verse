# Change Log

Track high-level project changes with links to decisions and plans.

## 2026-06-09

- Implemented startup bootstrap checklist in startup script for input profile load, core manager init, and gameplay scene transition state tracking.
- Ran cold-launch startup smoke pass in headless mode and captured bootstrap checklist logs for failure triage baseline.
- Updated sprint tracker to mark startup bootstrap checklist task complete.
- Implemented skirmish faction selector UI gate with explicit availability states and disabled Coming Soon entries for unavailable factions.
- Ran headless skirmish scene smoke check and captured faction availability logs for selector initialization.
- Added campaign perspective-order runtime data source with Veyari-first and Helion-last sequence.
- Wired campaign-order summary into skirmish UI and status telemetry so menu state and campaign-order data remain synchronized.
- Executed F-25 validation in headless skirmish scene run and captured logs proving available and unavailable faction states plus Veyari-first and Helion-last campaign ordering.
- Added deterministic startup menu-state payload logging for transition reason, timestamps, and mode availability flags.
- Added test-only startup keypress simulation flag for reproducible headless validation of input-triggered menu transition.
- Executed F-23 validation with timeout and keypress transition paths and captured startup observability evidence.
- Added deterministic simulation constraints baseline to planning conventions, including fixed-tick and seeded-random requirements.
- Added F-27 deterministic simulation compliance flow to testing strategy for reproducible startup gate validation.
- Added first MVP economy balance-sheet draft with numeric T0 to T1 structure costs, Helion and Veyari unit costs, and first-pass upkeep rules.
- Declared first duel map primary environment as Radial Impact Zone in map standards with rationale tied to objective pressure and readability validation.
- Added concrete advanced-system unlock thresholds in tech-tree planning for maintenance load, instability pressure, and civilization stress events.
- Added Stage 0 itch.io page copy draft in launch plan, including hero tagline, about copy, feature bullets, trust section, and feedback instructions.
- Added player-facing feedback template fields and publish-ready submission instructions for itch page feedback collection.
- Added first duel map scene with explicit SpawnA and SpawnB markers and map-defined Tether spawn logic.
- Validated faction-agnostic Tether spawn positions in headless runs by swapping Helion and Veyari assignments while keeping slot coordinates and stable item IDs unchanged.
- Added shared TetherPoint runtime behavior with faction-specific command-structure mapping for Helion, Obsidian, and Veyari.
- Added controlled Tether destruction and recovery telemetry hooks logging command-penalty activation and recovery-state transitions.
- Added T0 and T1 Tether-linked MVP buildable chain placeholders with dependency validation and stable build-item telemetry IDs.
- Executed F-22 headless matrix across Helion, Obsidian, and Veyari on both spawn slots with command-penalty and recovery evidence captured.
- Added weekly feedback triage cadence kickoff parameters and a first feedback-response devlog summary draft template.
- Added first-pass camera defaults and zoom-band standards for small 3D unit readability in controls standards.
- Confirmed MVP per-unit animation subspace mapping baseline in unit-list as F-24 source-of-truth input.
- Added first duel map strategic and tactical item catalog implementation with explicit zone annotations and stable map item IDs.
- Added scenario validation notes artifact documenting map item IDs, optional extension prototype, and headless validation command evidence.
- Implemented default RTS keyboard and mouse input bindings during startup profile initialization aligned to controls standards.
- Implemented MVP HUD baseline placeholders in duel map runtime for resource bar, minimap, command card, alerts, and production queue.
- Added persisted input profile support (`user://input_profile.cfg`) for remappable hotkeys and camera settings, validated by create-on-first-run and load-on-restart behavior.
- Executed F-26 environment readability validation with first-engagement notes and faction-agnostic Tether spawn evidence across swapped faction assignments.
- Expanded environment catalog into skirmish and campaign variant packs with explicit one-primary-one-secondary map composition rules.
- Added MVP unit-actor runtime baseline and F-24 validation hook in duel map for animation-state compliance checks.
- Executed F-24 baseline validation with camera-band telemetry and full 12/12 MVP unit baseline-state pass evidence.
- Added duel-map command simulation baseline for selection, action dispatch, control groups, and HUD synchronization telemetry.
- Executed F-18 and F-19 baseline validation flow in headless mode with command-coverage acknowledgements, rejection-path check, and HUD state summaries.
- Added duel-map opening-loop simulation baseline for resource accrual, objective contest cadence, and opening-phase advanced-system gate checks.
- Executed F-20 and F-21 baseline validation flow in headless mode with parity-delta telemetry and passing summary gate.
- Added Helion and Veyari opening stabilization model guardrails to economy standards with explicit F-21 parity telemetry mapping.

## 2026-05-17

- Added project documentation baseline under docs.
- Added architecture decision log, research log, implementation plan, and next-steps tracker.
- Added risk and assumptions registers for governance.
- Added project conventions for naming, folders, scene/script structure, and documentation expectations.
- Added planning artifacts: task backlog, testing strategy, and definition of done.
- Logged ADR-0002 and research entry for conventions and delivery-quality baseline.
- Added project game vision with explicit RTS identity pillars and vertical slice success signals.
- Logged ADR-0003 and research entry for vision alignment.
- Added full faction tech tree and unit list baselines for Helion Directorate and Obsidian Forge.
- Logged ADR-0004 and research entry for progression and roster definition.
- Added map standards for starting locations, expansion layout, contested objectives, and resource placement.
- Added economy and pricing standards for Alloy, Power, Data, pricing bands, and resource-control expectations.
- Logged ADR-0005 and research entry for map and economy standards.
- Logged ADR-0010 and research entry for unified finite global stockpiles with random world event volatility.
- Expanded game vision with four-era civilizational transition identity, One Box premise, maintenance-instability differentiator, and infrastructure warfare framing.
- Logged ADR-0011 and research entry for civilizational transition multiplayer identity and distributed network warfare direction.
- Expanded vision with three-way civilizational collision framing and The Descent as persistent world catalyst.
- Logged ADR-0012 and research entry for Descent-centered architecture and dynamic evolution baseline.
- Added implementation, testing, tech-tree, and sprint tracking updates for Descent objectives and branch emergence validation.
- Added Human-vs-Alien MVP solution with complete Helion and Veyari faction definitions for implementation-first combat scope.
- Logged ADR-0013 and research entry for complete-faction MVP duel baseline and smart map-fighting requirements.
- Added F-16 and F-17 validation flows plus backlog tasks for map-aware tactical behavior.
- Added UI and controls standards for keyboard and mouse bindings, camera controls, command grid, HUD layout, and alerts.
- Logged ADR-0014 and research entry for RTS input and UI baseline.
- Added F-18 and F-19 validation flows plus backlog and sprint tasks for controls and HUD implementation.
- Logged ADR-0015 and research entry establishing resource discovery and security as the primary match objective.
- Added F-20 validation flow and next-step tasks for resource-zone discovery, control, denial, and recapture pacing.
- Logged ADR-0016 and research entry for competitive-clarity-first and phase-gated complexity direction.
- Added F-21 validation flow and implementation tasks for opening-parity and complexity-unlock pacing.
