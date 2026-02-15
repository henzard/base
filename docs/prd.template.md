# Product Requirements Document (template)

> Copy this file to a feature-specific PRD (e.g. `prd-feature-name.md`). Ref: [Spec Kit specify step](https://github.com/github/spec-kit), [acceptance criteria](https://www.atlassian.com/work-management/project-management/acceptance-criteria).

## Problem

<!-- What we are solving and why it matters. -->
_Describe the problem and its impact._

## Users

<!-- Who is affected (roles, personas). -->
- _e.g. End users, internal operators, integrations._

## Scope / MVP

<!-- What is in and what is out for this release. -->
- **In scope**: _List must-haves._
- **Out of scope**: _List explicit exclusions (e.g. “No mobile app in v1”)._

## Success criteria

<!-- Testable outcomes for the release. -->
- _e.g. User can complete sign-up in under 2 minutes._
- _e.g. API responds with p95 latency < 200ms._

## Acceptance criteria (per feature / story)

<!-- Testable conditions; each should be verifiable. -->
| ID | Criterion | How to verify |
|----|-----------|---------------|
| AC1 | _e.g. User can log in with email and password._ | _e.g. E2E test or manual checklist._ |
| AC2 | _e.g. Invalid credentials return 401._ | _e.g. Unit test on auth service._ |

## Risks and assumptions

<!-- Optional: key risks, dependencies, assumptions. -->
- _e.g. Assumes auth provider SLA of 99.9%._
