# Architecture (template)

> Copy and fill for the project or a major subsystem. Ref: [BMAD architecture](https://github.com/bmad-code-org/BMAD-METHOD), [Spec Kit plan](https://github.com/github/spec-kit).

## Overview

<!-- One paragraph: main components and how data/control flows. -->
_Describe the high-level design and data flow._

## Boundaries

<!-- Services, modules, or layers; what talks to what. -->
| Component | Responsibility | Depends on |
|-----------|----------------|------------|
| _e.g. API layer_ | _HTTP, validation_ | _App, DB_ |
| _e.g. Domain_ | _Business rules_ | _None_ |

## Key decisions

<!-- Link to ADRs; do not duplicate long text. -->
- _e.g. Auth: see ADR 0002 (create with `./scripts/new-feature.sh` or copy `docs/adr/0001-template.md`)._
- _e.g. Data store: see ADR 0001._

## Tech stack

<!-- Runtime, framework, DB, infra (brief). -->
- **Runtime**: _e.g. Node 20 LTS_
- **Framework**: _e.g. Express / Next.js_
- **Database**: _e.g. PostgreSQL_
- **Infra**: _e.g. Docker, AWS_

## Security and compliance

<!-- Optional: auth, secrets, data handling, compliance notes. -->
- _e.g. Secrets via env vars only; no PII in logs._
