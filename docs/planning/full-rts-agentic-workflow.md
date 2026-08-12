# Full RTS Agentic Workflow

This is the execution model for advancing the current playable prototype into a
complete RTS. It supplements the development-agent-team contract and makes ordinary
match behavior, presentation quality, and human playability explicit completion
requirements.

## Product Truth

- The 20-case headless suite is the fast regression gate.
- A deterministic hook proves a bounded rule; it does not prove that the feature is
  reachable during an ordinary match.
- A feature may be marked complete only when its coverage is classified as `Live`
  and it passes every applicable delivery gate below.
- Advanced design work must reinforce the current Helion-versus-Veyari battlefield
  identity before expanding to additional factions, eras, or campaign content.

## Agent Stack

| Agent | Responsibility | Completion authority |
| --- | --- | --- |
| Delivery Coordinator | Select the highest-value Ready task, prevent conflicts, enforce evidence gates, and synchronize trackers | May mark Done after all gates pass |
| Runtime Planner and Auditor | Compare plan claims with ordinary-match code and create bounded implementation tasks | None |
| Faction and Soldier Designer | Define role, silhouette, stats, ability, animation, sound, and counterplay for each unit | Design approval only |
| UX and Controls Designer | Own command card, selection information, input parity, accessibility, HUD, minimap, and feedback contracts | UX approval only |
| Gameplay Developer | Implement one accepted vertical slice with observability and focused tests | None |
| AI Developer | Implement economy, scouting, composition, objective, regroup, attack, recovery, and finish policies through public commands | None |
| Godot Test Engineer | Maintain parser, component, integration, black-box match, export, and soak runners | Test gate only |
| Visual QA Agent | Capture fixed-seed screenshots and assess silhouettes, state feedback, camera readability, and UI scaling | Visual gate only |
| Code Review Agent | Review correctness, architecture, maintainability, plan alignment, and evidence independently | Review gate only |
| Human Playtest Coordinator | Run novice and experienced player sessions and turn observations into ranked defects | Human-playability gate only |

Agents may propose ideas continuously, but only the Coordinator may add them to the
delivery queue. Every idea must identify the player problem, faction fit, smallest
playable slice, dependencies, acceptance criteria, and evidence method.

## Delivery Waves

Each task proceeds through these waves:

1. **Discovery:** Planner audits plan, code, telemetry, and existing evidence.
2. **Design lock:** Soldier and UX agents define behavior, readability, controls,
   non-goals, and balance hypotheses.
3. **Implementation:** One Developer owns the production files for the slice.
4. **Focused validation:** Test Engineer runs parser, unit, failure-path, and connected
   regression gates.
5. **Ordinary-match validation:** A black-box agent reaches the feature through real
   startup, UI, economy, and command paths without private state mutation.
6. **Presentation validation:** Visual QA checks fixed viewpoints, common resolutions,
   animation states, feedback, and faction readability.
7. **Independent review:** Reviewer inspects the full diff and all evidence; unresolved
   P0-P2 findings return the task to implementation.
8. **Human gate:** Required for controls, camera, unit readability, balance, tutorial,
   and release-facing changes.
9. **Closure:** Coordinator updates backlog, plan, validation notes, risks, assumptions,
   and change log, then marks the task Done.

## Evidence Gates

| Gate | Required proof |
| --- | --- |
| Fast regression | `scripts/tests/run_headless_suite.sh` passes with fresh logs |
| Focused behavior | New rule passes success, rejection, boundary, and state-preservation checks |
| Public-input integration | Commands enter through the same UI/input/order surface used by a player |
| Full match | Splash to Skirmish to economy to production to combat to exactly one Win/Loss |
| Matrix | Both factions, both spawn orientations, player and AI outcomes, and multiple seeds |
| Export | Packaged debug build boots and completes representative full matches |
| Soak | Repeated matches produce no hangs, crashes, unallowlisted errors, or unbounded growth |
| Visual | Fixed-seed captures pass readability and intentional-diff review |
| Human | Structured sessions meet task-completion, clarity, comfort, and severity thresholds |
| Review | Independent approval with no unresolved P0-P2 finding |

Test-only code may choose a seed, scenario, artifact path, or observation channel. It
may not grant resources, teleport units, call damage/finalization helpers, inject
ownership, spawn armies, or mutate private gameplay state in a black-box match.

## Black-Box Full-Match Lane

The full-match driver starts from `project.godot` or an exported executable and:

1. Dismisses the splash through input.
2. Opens Skirmish and operates the real faction controls.
3. Starts the match through the real button.
4. Selects and orders workers through public input.
5. Gathers finite resources and pays for construction.
6. Waits for build and production queues.
7. Produces a mixed army and uses movement, attack, stance, and objective commands.
8. Captures or contests the Data Node.
9. Reaches a legitimate Win or Loss and verifies post-match shutdown.
10. Writes versioned JSONL telemetry, screenshots, logs, and a one-command replay.

The pull-request lane should run a representative eight-match matrix. Nightly should
cover all ordered Helion/Veyari matchups, both spawns, both expected outcomes, and at
least five seeds. Weekly should run exported-build and extended soak coverage.

## Soldier and Interface Direction

- **Helion:** clean angular expeditionary hardware, disciplined timing, navy/cyan
  identification, and amber action pulses. Readability comes from forward-facing
  weapons, shields, tool masts, compact armor, and deliberate deployment states.
- **Veyari:** low asymmetric bio-gravity forms, charcoal/marrow surfaces, and
  lime/crimson vascular pulses. Readability comes from claws, sacs, spines, stilt
  legs, shells, and visible pressure buildup.
- Every MVP unit receives a distinct role silhouette, data-driven combat profile,
  one restrained identity ability, and real Idle, Move, Attack, Hit, and Death states.
- The 3x4 command card is clickable and keyboard-addressable. Mixed selections expose
  common commands; rejected actions show costs, requirements, and reasons.
- Production is contextual to selected structures. `P` remains Patrol. Attack-move,
  Stop, Hold, Repair, queued orders, control groups, rally points, and same-type
  selection are required before the controls milestone can close.

## Prioritized Runtime Sequence

1. T-0111 live per-slot economy and finite extraction.
2. T-0114 timed construction and production queues.
3. T-0115 live Data Node capture and AI contest behavior.
4. T-0116 data-driven Helion/Veyari combat profiles and readable silhouettes.
5. T-0117 navigation, formations, and full RTS order surface.
6. T-0118 responsive HUD, command card, controls, and accessibility.
7. T-0119 economy-aware macro and tactical AI.
8. T-0120 black-box economy-to-victory match runner.
9. T-0121 live world-event cadence and resource integration.
10. T-0122 live T2 choice for both MVP factions.
11. T-0123 extract tested systems from the duel-map monolith.
12. T-0124 polished soldier/vehicle presentation slice.
13. T-0125 multi-seed, soak, and exported-build matrix.
14. T-0126 evidence-driven balance and human playtest cadence.

Air wings, colony logistics, eras, Descent, evolution, One Box, additional maps,
additional factions, and campaign content follow only after T-0120 proves the MVP
economy-to-victory loop through the shipped interface.
