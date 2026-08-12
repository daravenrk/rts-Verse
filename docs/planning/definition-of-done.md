# Definition of Done

A task or milestone is done only when all criteria below are satisfied.

## Implementation Quality

- Acceptance criteria are met as written.
- Code and scene changes follow project conventions.
- No known blocker-level regressions introduced.

## Documentation Quality

- If architecture changed, ADR entry is updated.
- If scope changed, implementation plan and next steps are updated.
- Relevant backlog items are updated to current status.

## Validation Quality

- Functional checks pass for changed behavior.
- Integration checks pass for connected systems.
- Smoke check confirms core loop remains playable.
- Runtime features are reachable in an ordinary match without test-only private state mutation.
- Player-facing changes pass public-input, visual, and human-playability gates when applicable.
- Release-facing changes pass an exported-build startup and representative full-match check.
- Failures are logged with a follow-up task if deferred.

## Review Quality

- Assumptions introduced are captured in assumptions register.
- New significant risks are captured in risk register.
- Change log captures milestone-level impact.
