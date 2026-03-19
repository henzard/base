# Contributing

How to use this workspace and contribute code.

## Getting started

1. Clone this repo and open in Cursor.
2. Read `docs/constitution.md` for project principles.
3. Read `docs/workflow-sdlc.md` for the discovery and planning flow.
4. Edit `scripts/verify.sh` (or `scripts/verify.ps1`) and replace the TODO blocks with your stack's lint, test, typecheck, and build commands.

## Starting new work

- **New feature**: Run `./scripts/new-feature.sh <name>` (or `.\scripts\new-feature.ps1 <name>`) to scaffold PRD, tasks, and ADR from templates.
- **Quick fix**: Make the change, run `./scripts/verify.sh`, commit with `fix(scope): description`.
- **Full discovery**: Follow `docs/workflow-sdlc.md` Steps 1-8 to capture pain, users, scope, tech, acceptance criteria, risks, and tasks before coding.

## Before committing

1. Run `./scripts/verify.sh` (or `.\scripts\verify.ps1`). Fix any failure.
2. Check the Definition of Done in `.cursor/rules/coding-standards.mdc`.
3. Use Conventional Commits: `feat(scope):`, `fix(scope):`, `docs:`, `refactor:`, `test:`, `chore:`.
4. One logical change per commit. Do not mix unrelated edits.

## Pull requests

- Use the PR template (`.github/PULL_REQUEST_TEMPLATE.md`); it loads automatically on GitHub.
- Link to the task or acceptance criteria your PR addresses.
- Self-review using the rubric in `.cursor/rules/review-and-quality.mdc`.

## Branching (suggested)

- `main` — stable, passes verify.
- `feat/<name>` — feature work.
- `fix/<name>` — bug fixes.
- Merge via PR; squash or merge per team preference.

## Session handoff

- At the end of a working session, update `docs/context-handoff.md` with what was done, what's next, and any blockers.
- At the start, read that file to resume context.

## Code quality

- Follow `.cursor/rules/coding-standards.mdc` (naming, functions, errors, logging).
- Follow `.cursor/rules/architecture-and-design.mdc` (SOLID, clean architecture, code smells).
- If you spot a code smell during review, it can be a follow-up task but must be tracked.

## Questions

- Use "Use Thought Partner mode" in Cursor to think through a problem before coding.
- Use "Be the Challenger" to stress-test your approach.
