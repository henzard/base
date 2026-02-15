# Task breakdown (template)

> Copy this for a feature or phase. Each task must have a verification step. Ref: [GSD plans](https://github.com/gsd-build/get-shit-done), [Spec Kit tasks](https://github.com/github/spec-kit).

## Feature / phase

<!-- e.g. "User authentication" or "Phase 1: API layer" -->
_Name of the feature or phase._

## Source

<!-- Link to PRD section or spec. -->
- PRD: _e.g. docs/prd-feature-name.md_
- Acceptance criteria: _e.g. AC1, AC2_

## Tasks

| ID | Description | Verification | Deps |
|----|-------------|--------------|------|
| T1 | _e.g. Add POST /auth/login endpoint_ | _e.g. `curl -X POST ...` returns 200 with valid body_ | — |
| T2 | _e.g. Add JWT validation middleware_ | _e.g. Request without token returns 401_ | T1 |
| T3 | _e.g. Add unit tests for auth service_ | _e.g. `npm test -- auth` passes_ | T1 |

- **Verification**: Mandatory. How to confirm the task is done (command or manual step).
- **Deps**: Task IDs that must be done first; leave blank if none.

## Done criteria

- [ ] All tasks completed in order (or parallel where deps allow).
- [ ] Verification for each task passed.
- [ ] Full verify script run: `./scripts/verify.sh` (or project equivalent).
- [ ] Acceptance criteria from PRD met (test or UAT).
