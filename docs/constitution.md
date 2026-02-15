# Project Constitution

> One source of truth for principles and constraints. Reference: [Spec Kit constitution](https://github.com/github/spec-kit), [intent-driven SDD](https://intent-driven.dev/knowledge/best-practices/).

## Purpose

<!-- One sentence: what this project exists to do. -->
_Define the core purpose of this project._

## Principles

<!-- 3–7 bullets: non‑negotiable guidelines for design and implementation. -->
- _e.g. All new behavior must have tests or an explicit exception._
- _e.g. No secrets or credentials in code or logs._
- _e.g. APIs are documented or self-evident from types and names._
- _e.g. Prefer small, reviewable changes; one logical change per commit._
- _e.g. Specifications and code stay in sync; update the spec when behavior changes._

## Out of scope

<!-- What we explicitly do not do (e.g. legacy browser support, certain integrations). -->
- _e.g. We do not support Internet Explorer._
- _e.g. We do not run untrusted user code on the server._

## Quality bar

<!-- Optional: minimum bar for “done” (e.g. lint clean, tests pass, no high/critical security findings). -->
- Lint and format pass.
- Tests pass; new code has tests unless explicitly excepted.
- No hardcoded secrets; no PII in logs.

## Collaboration (optional)

<!-- Copy from docs/workflow-sdlc.md "AI/Human collaboration rules" to define who decides what and when the human is in the loop. -->
- _e.g. Human owns pain, scope, and success criteria; AI drafts PRD and tasks from prompts._
- _e.g. Human approves tech and architecture; AI implements after approval._
- _e.g. Verify before commit; no secrets in code or prompts._
