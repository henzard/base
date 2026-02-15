# AI-first engineering workspace

This repo uses a **Cursor ruleset** and **workspace scaffolding** for spec-driven, AI-assisted development. One coherent workflow—from constitution and PRD to tasks and verification—with quality gates and security guidance.

## Where things live

| Artifact | Location |
|----------|----------|
| **Cursor rules** | `.cursor/rules/*.mdc` — workflow, coding standards, review, specs, personas, session management |
| **Constitution** | `docs/constitution.md` — principles, constraints, collaboration |
| **PRD / product** | `docs/prd.template.md` (template); copy per feature |
| **Architecture** | `docs/architecture.template.md` (template); `docs/adr/` for ADRs |
| **Workflow & prompt flow** | `docs/workflow-sdlc.md` — 8-step SDLC prompt flow, AI–human collaboration rules |
| **Context handoff** | `docs/context-handoff.md` — session state so AI picks up where you left off |
| **Testing strategy** | `docs/testing-strategy.template.md` — what to test, layers, coverage targets |
| **API contract** | `docs/api-contract.template.md` — endpoints, payloads, errors before you code |
| **Spike / research** | `docs/spike.template.md` — timeboxed investigation with findings and recommendation |
| **Backlog** | `planning/backlog.md` — prioritized work |
| **Task breakdown** | `planning/tasks.template.md` (template); copy per feature |
| **Retrospective** | `planning/retro.template.md` — what went well, what didn't, action items |
| **Changelog** | `CHANGELOG.md` — release tracking (Keep a Changelog format) |
| **PR template** | `.github/PULL_REQUEST_TEMPLATE.md` — PR checklist tied to review rubric |
| **Verify script** | `scripts/verify.sh` / `scripts/verify.ps1` — lint, test, typecheck, build |
| **New-feature script** | `scripts/new-feature.sh` / `scripts/new-feature.ps1` — scaffold PRD + tasks + ADR from templates |
| **Env example** | `.env.example` — env var template (never commit `.env`) |
| **Cursor ignore** | `.cursorignore` — prevent AI from reading secrets and build artifacts |

## 3-mode usage guide

| Mode | When to use | Steps |
|------|-------------|--------|
| **Quick fix** | Bug, config tweak, tiny change | Change → run `./scripts/verify.sh` (or project verify) → commit with `fix(scope):` or `chore:`. No PRD/tasks. |
| **Feature build** | New capability, bounded scope | Acceptance criteria (PRD or task doc) → copy `planning/tasks.template.md` → tasks with verification → implement in order → verify → UAT. Optional: reference existing ADRs. |
| **Major initiative** | New project, big subsystem, or large multi-phase work | Constitution → PRD → architecture + ADRs → task breakdown in `planning/` → implement phase by phase → verify each step → UAT. For brownfield: map codebase first, then PRD slice + ADRs. |

## Recommended flows (detail)

1. **Quick fix** — Make the change → run verify → commit with `fix(scope):` or `chore:`.
2. **New feature** — Constitution/PRD (if not done) → acceptance criteria → copy `planning/tasks.template.md` → fill tasks with verification steps → implement in order → run verify → UAT.
3. **New project (greenfield)** — Fill `docs/constitution.md` → PRD from `docs/prd.template.md` → architecture from `docs/architecture.template.md` → ADR(s) in `docs/adr/` → task breakdown → implement → verify.
4. **Existing codebase (brownfield)** — Map structure → align or add PRD slice → ADR for new decisions → task breakdown → implement → verify and regression check.

## Commands

- **Verification**: Run `./scripts/verify.sh`. Replace the TODO blocks with your stack’s lint, test, typecheck, and build commands.
- **Cursor rules**: `@powerhouse.mdc` (always on), `@specs-and-planning.mdc`, `@coding-standards.mdc`, `@review-and-quality.mdc`, `@personas-and-modes.mdc`, `@context-and-sessions.mdc`. **Personas**: "Use Thought Partner mode", "Conduct strategic review", "Be the Challenger", "Act as Communicator", "Act as Interviewer", or upload a doc and ask for persona simulation.
- **New feature**: Run `./scripts/new-feature.sh <name>` (or `.\scripts\new-feature.ps1 <name>`) to scaffold PRD, tasks, and ADR from templates.
- **Resume a session**: Tell Cursor "Read `docs/context-handoff.md` and resume from where we left off."

## Tooling (suggested, not installed by default)

- **Lint/format**: ESLint + Prettier (JS/TS), Ruff (Python), etc.
- **Commits**: Conventional Commits ([conventionalcommits.org](https://www.conventionalcommits.org/en/v1.0.0/)).
- **Pre-commit**: husky + lint-staged, or a single `scripts/verify.sh` before each commit.
- **CI**: Run the same steps as `verify.sh` (lint → test → typecheck → build) in your pipeline.

---

## Index of what was created

| Path | Purpose |
|------|--------|
| **Rules** | |
| `.cursor/rules/powerhouse.mdc` | Core workflow, modes, verification, regeneration>patching, atomic commits, security (always apply) |
| `.cursor/rules/coding-standards.mdc` | Formatting, naming, modules, errors, logging, Definition of Done |
| `.cursor/rules/review-and-quality.mdc` | Code review rubric, pre-commit/CI suggestions |
| `.cursor/rules/specs-and-planning.mdc` | Constitution, PRD, ADR, task templates, AC template; anti-patterns |
| `.cursor/rules/personas-and-modes.mdc` | Thought Partner, Strategic Review, Challenger, Communicator, Interviewer, Persona Simulation |
| `.cursor/rules/context-and-sessions.mdc` | Session management: resume, handoff, context preservation |
| **Docs** | |
| `docs/constitution.md` | Constitution template (purpose, principles, collaboration) |
| `docs/prd.template.md` | PRD template (problem, users, scope, AC, risks) |
| `docs/architecture.template.md` | Architecture template (overview, boundaries, tech stack) |
| `docs/adr/0001-template.md` | ADR template (context, decision, options, consequences) |
| `docs/workflow-sdlc.md` | 8-step SDLC prompt flow + AI/Human collaboration rules |
| `docs/context-handoff.md` | Session state: what's done, what's next, blockers, decisions |
| `docs/testing-strategy.template.md` | Testing layers, coverage targets, what not to test |
| `docs/api-contract.template.md` | API endpoints, payloads, errors, conventions |
| `docs/spike.template.md` | Spike/research: question, findings, recommendation |
| **Planning** | |
| `planning/backlog.md` | Prioritized work items |
| `planning/tasks.template.md` | Task breakdown with verification steps |
| `planning/retro.template.md` | Retrospective: went well, didn't, action items |
| **Scripts** | |
| `scripts/verify.sh` / `.ps1` | Quality gate: lint → test → typecheck → build |
| `scripts/new-feature.sh` / `.ps1` | Scaffold PRD + tasks + ADR from templates |
| **Config** | |
| `.gitignore` | Deps, build, env, secrets, IDE, logs |
| `.editorconfig` | Indent, charset, newline defaults |
| `.cursorignore` | Prevent AI from reading secrets and build artifacts |
| `.env.example` | Env var template (shows expected vars without real values) |
| `CHANGELOG.md` | Release tracking (Keep a Changelog format) |
| `.github/PULL_REQUEST_TEMPLATE.md` | PR checklist tied to review rubric |

## First-run guide (5 steps)

1. **Open in Cursor** — Rules in `.cursor/rules/` load automatically; `powerhouse.mdc` is always applied.
2. **Fill the constitution** — Edit `docs/constitution.md` with your project’s purpose, principles, and out-of-scope.
3. **Wire up verification** — Edit `scripts/verify.sh` (or `scripts/verify.ps1` on Windows); replace each TODO with your stack’s lint, test, typecheck, and build commands.
4. **Start a feature** — Copy `docs/prd.template.md` and `planning/tasks.template.md`; add acceptance criteria and tasks with verification steps; implement following the mode checklist in `powerhouse.mdc`.
5. **Run verify before commit** — Run `./scripts/verify.sh` or `.\scripts\verify.ps1`; fix any failure before committing. Use Conventional Commits: `feat(scope):` or `fix(scope):`.
