# Spike / research (template)

> Use for timeboxed investigation when there's an unknown that blocks planning or implementation. Copy per spike. Ref: [GSD research phase](https://github.com/gsd-build/get-shit-done).

## Spike info

- **ID**: _e.g. SPIKE-001_
- **Title**: _e.g. Evaluate auth providers for SSO_
- **Timebox**: _e.g. 2 hours / 1 day_
- **Owner**: _Who is doing this_
- **Status**: In progress | Done | Abandoned

## Question to answer

<!-- The specific question or unknown this spike resolves. -->
_e.g. Which auth provider supports SAML SSO, costs < $100/mo, and has a Node SDK?_

## Context

<!-- Why we need to know; link to PRD, task, or ADR that depends on this. -->
- Blocking: _e.g. Task T5 in planning/tasks-auth.md_
- Related: _e.g. ADR 0002 (auth strategy)_

## Research done

<!-- What you investigated: tools, docs, prototypes, conversations. -->
- _e.g. Evaluated Auth0, Clerk, and Supabase Auth._
- _e.g. Built a proof-of-concept with Clerk in `spike/auth-poc/`._

## Findings

<!-- What you learned. Be specific: versions, costs, limitations. -->
| Option | Pros | Cons | Cost |
|--------|------|------|------|
| _Auth0_ | _Mature, SAML, good docs_ | _Expensive at scale, complex dashboard_ | _$23/mo to start_ |
| _Clerk_ | _Simple DX, React components_ | _No SAML on free tier_ | _Free to $25/mo_ |

## Recommendation

<!-- What to do with the findings. -->
_e.g. Use Clerk for v1 (no SAML needed yet); revisit if enterprise SSO becomes a MUST._

## Follow-up actions

<!-- What this spike produces: ADR, task update, backlog item. -->
- [ ] Create ADR 0002: auth provider choice.
- [ ] Update Task T5 with Clerk implementation steps.
