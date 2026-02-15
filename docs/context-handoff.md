# Context handoff / session state

> AI assistants lose context between sessions. This doc is your persistent memory. Update it when you pause or finish a session so the next session (yours or someone else's) can pick up without re-discovery. Inspired by GSD STATE.md. Ref: [GSD](https://github.com/gsd-build/get-shit-done).

## Current state

- **Date**: _YYYY-MM-DD_
- **Phase / milestone**: _e.g. Phase 1: API layer_
- **Status**: _e.g. Tasks T1–T3 done; T4 in progress; blocked on T5 (needs API key)_

## What was done this session

<!-- Brief list of what was accomplished. -->
- _e.g. Implemented auth endpoints (T1, T2)._
- _e.g. Fixed failing test in user service (T3)._

## What's next

<!-- The immediate next tasks or decisions. -->
- _e.g. Complete T4 (JWT middleware). Then T5 (integration test)._
- _e.g. Decision needed: choose between Redis and in-memory sessions (see ADR draft)._

## Blockers and open questions

<!-- Anything preventing progress. -->
- _e.g. Waiting for API key from third-party provider._
- _e.g. Unclear whether we need RBAC in v1 — check PRD AC3._

## Key decisions made

<!-- Decisions made during this session that should persist. -->
- _e.g. Chose JWT over session cookies (see ADR 0002)._
- _e.g. Deferred email notifications to Phase 2._

## Files changed

<!-- Key files touched — helps the next session load context fast. -->
- _e.g. `src/auth/login.ts`, `src/auth/middleware.ts`, `test/auth.test.ts`_

---

**How to use:** At the end of each working session, update this file. At the start of the next session, tell the AI: "Read `docs/context-handoff.md` and resume from where we left off."
