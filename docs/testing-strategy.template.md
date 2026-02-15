# Testing strategy (template)

> Define what to test, how, and what coverage to target. Copy and fill per project. Ref: [BMAD QA](https://github.com/bmad-code-org/BMAD-METHOD), [non-functional requirements](https://www.door3.com/blog/non-functional-requirements-checklist).

## Testing philosophy

<!-- e.g. "Test behavior, not implementation. Prefer integration tests for APIs; unit tests for business logic." -->
_State the team's testing approach in 1–2 sentences._

## Test layers

| Layer | What it covers | Tools (suggested) | When to run |
|-------|---------------|-------------------|-------------|
| **Unit** | Pure functions, business logic, utilities | _e.g. Jest, pytest, go test_ | On save / pre-commit |
| **Integration** | Service-to-service, DB queries, API routes | _e.g. Supertest, pytest + fixtures_ | Pre-commit / CI |
| **E2E** | Full user flows through the UI or API | _e.g. Playwright, Cypress, httpie_ | CI / before release |
| **Smoke** | Critical paths work after deploy | _e.g. curl health checks, Playwright subset_ | Post-deploy |
| **Load / perf** | Response time, throughput under load | _e.g. k6, Artillery, locust_ | Before release / on demand |

## Coverage targets

<!-- Set realistic minimums; 100% is rarely the goal. -->
- **Unit**: _e.g. >= 80% line coverage on `src/` business logic._
- **Integration**: _e.g. All API endpoints have at least one happy-path + one error test._
- **E2E**: _e.g. Top 3 user journeys covered._

## What NOT to test (explicitly)

<!-- Saves time debating. -->
- _e.g. Third-party library internals._
- _e.g. Styling/layout (unless visual regression testing is set up)._
- _e.g. Generated code (test the generator config instead)._

## Test data and fixtures

<!-- How to set up test data; where fixtures live. -->
- _e.g. Seed scripts in `test/fixtures/`; use factories not raw SQL._
- _e.g. Mock external APIs with MSW or VCR cassettes._

## How to run

```bash
# Unit + integration
# TODO: npm test / pytest / cargo test

# E2E
# TODO: npx playwright test / pytest test/e2e/

# Full verify (lint + test + typecheck + build)
./scripts/verify.sh
```

## When NOT to apply this strategy

- Throwaway spikes: minimal or no tests; document in spike template.
- Config-only changes: no new tests unless behavior changes.
