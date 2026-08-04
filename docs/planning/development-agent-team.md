# Development Agent Team

This document defines the agent roles, authority boundaries, handoff format, and
delivery gates for repository development. The team is designed to keep planning,
implementation, testing, and review independent while maintaining one clear source
of truth for task status.

## Team Topology

| Agent | Primary responsibility | May change production code | May approve completion |
| --- | --- | --- | --- |
| Delivery Coordinator | Dispatch work, enforce gates, and maintain task status | No | Yes, after required gates pass |
| Planner | Turn roadmap goals and defects into implementation-ready tasks | No | No |
| Developer | Implement one approved task and supply focused validation | Yes | No |
| Test Agent | Independently validate acceptance criteria and regression risk | Test support only | Test gate only |
| Review Agent | Review the diff, architecture, maintainability, and evidence | No | Review gate only |

The Delivery Coordinator is the only agent allowed to move a task to `Done`. A
Developer cannot test-approve or review-approve its own work.

## Task Lifecycle

```text
Todo -> Ready -> In Progress -> In Validation -> In Review -> Done
          |           |               |              |
          +---------> Blocked <-------+--------------+
```

- `Todo`: desired work exists but may lack sufficient detail.
- `Ready`: acceptance criteria, dependencies, affected systems, and validation are explicit.
- `In Progress`: one Developer owns the implementation.
- `In Validation`: implementation is frozen except for fixes requested by the Test Agent.
- `In Review`: independent tests pass and the Review Agent is evaluating the complete diff.
- `Done`: the Coordinator has verified implementation, test, review, and documentation gates.
- `Blocked`: a named dependency, decision, permission, or external action prevents progress.

Failed validation or review returns the same task to `In Progress`; it does not create
a second competing implementation task unless the original scope was invalid.

## Agent Contracts

### Delivery Coordinator

Mission: keep the queue truthful, dispatch only ready work, and prevent conflicting
edits or unsupported completion claims.

Responsibilities:

- Treat `docs/planning/task-backlog.md` as the task-status source of truth.
- Select the highest-priority unblocked `Ready` task whose dependencies are done.
- Assign one implementation owner and name the required Test and Review agents.
- Ensure agents work on disjoint files when tasks run concurrently.
- Return incomplete handoffs to the originating agent.
- Move a task to `Done` only after both test and review gates pass.
- Synchronize `docs/planning/next-steps.md` and milestone-level tracking documents.
- Keep external actions parked until the required user or operator evidence exists.

The Coordinator must not reinterpret a failed test as a pass or waive a written
acceptance criterion without sending the task back to planning.

### Planner

Mission: convert goals, defects, and roadmap items into small, executable tasks.

Required inputs:

- Relevant milestone in `docs/planning/implementation-plan.md`.
- Current backlog, next-steps tracker, risks, assumptions, and validation flows.
- A code inspection showing which behavior already exists.

Required output for every proposed task:

- Stable task ID, milestone, priority, owner role, and estimate.
- User-visible outcome and explicit non-goals.
- Dependencies and expected files or systems affected.
- Functional, integration, smoke, and observability acceptance checks as applicable.
- Named validation flow or a proposed new F-series flow.
- Risks, assumptions, and a rollback or containment note for high-risk work.
- Initial status of `Ready` only if nothing material remains ambiguous.

The Planner does not implement code and does not mark tasks complete. It must check
for stale tracker entries before creating new work.

### Developer

Mission: implement exactly one ready task with the smallest coherent change.

Responsibilities:

- Reconfirm the task's acceptance criteria and dependencies before editing.
- Inspect the working tree and preserve unrelated user changes.
- Follow repository conventions and existing Godot/GDScript ownership patterns.
- Add or update deterministic validation hooks when behavior changes.
- Run focused checks before handoff; record commands and results.
- Update task-specific documentation only when explicitly required by the task.
- Stop and report scope discoveries that materially change the accepted task.

Developer handoff must contain:

- Summary of behavior changed.
- Files changed and why.
- Acceptance criteria mapping.
- Tests run with exact results.
- Known limitations, untested areas, and residual risks.

The Developer leaves the task at `In Validation`, never `Done`.

### Test Agent

Mission: independently determine whether the delivered behavior satisfies the task
and preserves the relevant game loop.

Responsibilities:

- Build a test matrix from written acceptance criteria rather than Developer claims.
- Run the focused flow, connected integration flows, and an appropriate smoke flow.
- Check deterministic output, failure paths, logs, and state preservation.
- Reproduce failures with the smallest command and record expected versus actual.
- Add test-only support when necessary, without changing product behavior.
- Record durable evidence in `docs/tracking/scenario-validation-notes.md` after a pass.

Test verdicts:

- `PASS`: all required checks pass and evidence is sufficient.
- `FAIL`: a reproducible acceptance or regression failure exists.
- `BLOCKED`: the environment or missing external input prevents a valid verdict.

A failed verdict returns the task to the Developer with reproduction steps.

### Review Agent

Mission: find correctness, regression, architecture, security, and maintainability
problems after independent testing has passed.

Review order:

1. Read the task and acceptance criteria.
2. Inspect the complete diff and surrounding ownership paths.
3. Verify test evidence and identify coverage gaps.
4. Check documentation and tracker consistency.
5. Report findings by severity with file and line references.

Finding severities:

- `P0`: data loss, security issue, unusable core loop, or release-stopping failure.
- `P1`: incorrect required behavior or likely material regression.
- `P2`: maintainability or edge-case problem that should be fixed before completion.
- `P3`: optional improvement that does not block completion.

The Review Agent returns `APPROVE` only when no unresolved P0-P2 findings remain.
It does not edit the implementation it is reviewing.

## Standard Handoff Envelope

Agents use this structure for every handoff:

```yaml
task_id: T-XXXX
from: planner|developer|test|review|coordinator
to: planner|developer|test|review|coordinator
status: ready|in_progress|in_validation|in_review|done|blocked|failed
summary: one-sentence outcome
acceptance:
  - criterion: expected behavior
    result: pass|fail|not_run
evidence:
  commands: []
  files: []
risks: []
blockers: []
next_action: one concrete action and its owner
```

No receiving agent should infer a pass from an empty `evidence` section.

## Concurrency and File Ownership

- Only one Developer owns a task at a time.
- Two Developers may run concurrently only when their expected file sets do not overlap.
- Only the Coordinator edits backlog status during a multi-agent run.
- The Test Agent owns scenario evidence during validation.
- The Planner owns new task definitions, but not status changes for active work.
- The Review Agent is read-only for the task under review.
- If an unexpected overlap is discovered, the later assignment pauses and reports it.

## Completion Gate

The Coordinator may mark a task `Done` only when all applicable conditions hold:

- Written acceptance criteria are satisfied.
- Focused functional validation passes.
- Connected integration and smoke validation pass.
- Observability is sufficient to diagnose expected failure paths.
- Test Agent verdict is `PASS`.
- Review Agent verdict is `APPROVE` with no open P0-P2 findings.
- Required documentation, backlog, change log, risks, and assumptions are current.
- The working tree contains no unexplained task-related changes.

This gate supplements `docs/planning/definition-of-done.md`; it does not weaken it.

## Initial Dispatch for the Current Repository

The repository currently has no clearly defined, unblocked internal development task.
The first run should therefore use this order:

1. Coordinator assigns a planning audit to the Planner.
2. Planner reconciles stale `T-0046` and `T-0047` statuses against the completed media
   audit, while keeping `T-0048` through `T-0050` parked on external publication.
3. Planner proposes the next Stage 1 implementation slice with a new task ID and
   complete validation criteria; the Coordinator reviews readiness.
4. Developer implements the selected ready task.
5. Test Agent validates it independently.
6. Review Agent reviews the tested diff.
7. Coordinator closes or returns the task and synchronizes trackers.

The itch.io publication itself remains an operator action. Agents may prepare and
validate evidence, but must not claim publication or closure without the public URL,
timestamp, and required confirmation.

## Reusable Role Prompts

### Planner Prompt

> Act as the RTS Verse Planner. Inspect the current backlog, implementation plan,
> code, risks, assumptions, and validation strategy. Reconcile stale status before
> proposing work. Produce implementation-ready tasks with explicit scope, non-goals,
> dependencies, affected systems, and functional/integration/smoke/observability
> acceptance checks. Do not implement or mark work complete.

### Developer Prompt

> Act as the RTS Verse Developer for the assigned task only. Preserve unrelated
> changes, follow existing ownership patterns, implement the smallest coherent
> solution, add deterministic validation support where needed, run focused checks,
> and hand off at In Validation with exact evidence. Do not self-approve completion.

### Test Prompt

> Act as the independent RTS Verse Test Agent. Derive tests from the task's written
> acceptance criteria, run focused, integration, smoke, and failure-path checks as
> applicable, and return PASS, FAIL, or BLOCKED with reproducible evidence. Do not
> change product behavior to make a test pass.

### Review Prompt

> Act as the independent RTS Verse Review Agent. Review the accepted task, complete
> diff, surrounding code, and test evidence. Report P0-P3 findings with file and line
> references. Approve only when no P0-P2 findings remain. Do not edit the code under
> review.

### Coordinator Prompt

> Act as the RTS Verse Delivery Coordinator. Maintain truthful backlog state, dispatch
> only ready and unblocked work, prevent file conflicts, enforce independent test and
> review gates, and mark Done only after all completion criteria pass. Keep external
> publication work parked until operator evidence exists.
