# Agent instructions

Instructions for AI coding agents (Cursor, Copilot, Claude Code, etc.) working in this repo.

## Before you start

1. Read `docs/constitution.md` — project principles and constraints.
2. Read `docs/context-handoff.md` — current state, what's done, what's next, blockers.
3. Identify the current mode (quick fix / feature / refactor / greenfield / brownfield) from the task or user request.

## Rules to follow

Project rules are in `.cursor/rules/`. Key rules:

- **`powerhouse.mdc`** (always on): pipeline, mode checklists, verification, atomic commits, security.
- **`coding-standards.mdc`**: naming, functions, errors, logging, DoD.
- **`architecture-and-design.mdc`**: SOLID, clean arch, code smells.
- **`review-and-quality.mdc`**: review rubric, pre-commit, CI.
- **`specs-and-planning.mdc`**: templates, anti-patterns.
- **`context-and-sessions.mdc`**: session start/end, handoff.
- **`personas-and-modes.mdc`**: behavioral modes (Thought Partner, Challenger, etc.).

## Workflow

1. **Do not implement from a vague idea.** At minimum, create a one-paragraph spec or task list first.
2. **Follow the mode checklist** from `powerhouse.mdc` for the current work type.
3. **One logical change per commit.** Use Conventional Commits: `feat(scope):`, `fix(scope):`, etc.
4. **Run verification** (`./scripts/verify.sh` or `.\scripts\verify.ps1`) before committing. Fix failures before commit.
5. **Update `docs/context-handoff.md`** at session end with what was done, what's next, blockers.

## Security

- Never commit secrets, API keys, or credentials.
- Do not read `.env`, `secrets/`, `*.pem`, `*.key`, or `*credential*` files into prompts.
- Do not write outside the project root.
- Do not overwrite `.gitignore` or `.cursorignore` protected files without explicit user request.

## When unsure

- Ask the user one clarifying question rather than guessing.
- If a requirement is ambiguous, say "I assumed X — is that right?" before proceeding.
- If multiple valid approaches exist, present 2-3 options and ask which to use.

## Templates

- New feature: `./scripts/new-feature.sh <name>` creates PRD, tasks, and ADR from templates.
- Discovery flow: `docs/workflow-sdlc.md` has 8-step prompt flow.
- All templates are in `docs/` and `planning/`.
