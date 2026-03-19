# Workflow: SDLC & prompt flow

Getting ideas out of your head into a clear plan is the hardest part of building software. This doc gives you a **guided prompt flow**—question by question—so neither you nor the AI skip the things that cause rework later.

Work through the steps in order. Answer in Cursor chat or write directly in the templates. The AI uses your answers to draft `docs/constitution.md`, `docs/prd-*.md`, `docs/architecture.template.md`, and `planning/tasks-*.md`.

> **Rule of thumb:** If you find yourself saying "the AI probably understands what I mean," stop and answer one more question. Ambiguity is where projects fail. Ref: [Toptal — requirements gathering mistakes](https://www.toptal.com/product-managers/digital/requirements-gathering-mistakes), [intent-driven SDD](https://intent-driven.dev/knowledge/best-practices/).

---

## Part 1: Discovery & requirements (prompt flow)

### Step 1 — Problem deep-dive

The goal is to move past the surface symptom to the real root cause. Most projects fail because the team builds for a symptom, not the actual problem. Ref: [5 Whys](https://atlassian.com/team-playbook/plays/5-whys).

**Prompt to use:**

```
I want to define what we're building and why. Interview me one question at a time.

Cover these areas (do not skip any):

1. THE PAIN
   - What is the specific problem or frustration I'm trying to solve?
   - Who feels this pain? (me, my team, my customers, all of the above?)
   - How are they solving it today? (manual process, spreadsheet, competitor tool, not at all?)
   - What breaks or goes wrong with the current approach?
   - How often does this pain occur? (daily, weekly, per transaction?)

2. ROOT CAUSE (5 Whys)
   - Why does this problem exist? (ask "why" up to 5 times until we hit something structural)

3. IMPACT
   - What does this cost? (time, money, errors, lost customers, frustration — even rough numbers)
   - What happens if we do nothing for 6 months?

4. DESIRED OUTCOME
   - If this were solved perfectly, what would the day-to-day look like?
   - What is the single sentence that describes success?

5. WHY NOW
   - What triggered this? (growth, broken process, new regulation, opportunity?)
   - Is there a deadline or event driving urgency?

After you've asked all of these, summarize:
- Problem statement (2–3 sentences)
- Root cause
- Impact (quantified if possible)
- Success statement (one sentence)
- Urgency / timeline
```

**What this produces:** Fills the **Problem** and **Success criteria** sections of the PRD.

---

### Step 2 — Users and context

Most missed requirements come from not understanding who uses the thing and in what context. Ref: [Jobs to Be Done](https://strategyn.com/jobs-to-be-done/), [story mapping](https://www.producttalk.org/glossary-discovery-story-mapping/).

**Prompt to use:**

```
Now let's understand the users and their context. Interview me one question at a time.

1. WHO ARE THE USERS?
   - List every person or role that will interact with this (end user, admin, operator, API consumer, etc.)
   - For each: what is their goal? What "job" are they hiring this product to do?
   - How technical are they? (developer, power user, non-technical, mixed)
   - How often will they use this? (daily, weekly, once then done)

2. USER JOURNEY (happy path)
   - Walk me through: the user has the pain → they open our solution → what do they do step by step → they get the outcome.
   - What is the very first thing they see or do?
   - What is the moment they get value ("aha moment")?

3. CONTEXT AND ENVIRONMENT
   - Where are users when they use this? (desk, mobile, on-site, in a meeting)
   - What devices/browsers/OS matter?
   - Are they online-only, or do they need offline support?
   - Do they work alone or collaboratively?

4. EXISTING WORKFLOWS
   - What tools or systems do they already use alongside this?
   - Does this need to integrate with anything? (email, Slack, an ERP, a database, an API)
   - Are there data imports/exports to consider?

5. EDGE CASES AND FRUSTRATIONS
   - When would a user get stuck or confused?
   - What happens when they make a mistake — can they undo it?
   - Are there different permission levels (viewer, editor, admin)?

After all questions, summarize:
- User roles table (Role | Goal | Frequency | Tech level)
- Happy-path journey (numbered steps)
- Key integrations
- Top 3 edge cases to handle
```

**What this produces:** Fills **Users**, helps shape **Scope / MVP**, and surfaces integration/edge-case requirements.

---

### Step 3 — Scope and prioritization

Scope creep is the #1 killer. Force a boundary now. Ref: [MoSCoW prioritization](https://en.wikipedia.org/wiki/MoSCoW_method), [INVEST stories](https://en.wikipedia.org/wiki/INVEST_(mnemonic)).

**Prompt to use:**

```
Let's define what's in v1 and what's not. Interview me one question at a time.

1. MVP BOUNDARY
   - From the user journey above, which steps are essential for the very first usable version?
   - What can a user live without in v1 but would love in v2?
   - Is there a single feature that, if missing, makes the whole thing useless?

2. PRIORITIZE (MoSCoW)
   - For each capability we've discussed, classify:
     - MUST have (blocks launch without it)
     - SHOULD have (important but can ship without for a short time)
     - COULD have (nice to have, do if time allows)
     - WON'T have this release (explicitly deferred)

3. WHAT WE ARE NOT BUILDING
   - List things that might seem related but are out of scope.
   - Any features competitors have that we intentionally skip? Why?

4. CONSTRAINTS ON SCOPE
   - Is there a hard deadline? What's the available effort (solo weekends, full team, sprint)?
   - Budget constraints (hosting, third-party services)?
   - Are there legal or regulatory boundaries on what we can build?

5. SUCCESS METRICS
   - How will we know v1 succeeded? (adoption number, time saved, error rate, revenue)
   - What's the minimum bar to call it "shipped"?

After all questions, produce:
- MVP feature list (MUST / SHOULD / COULD / WON'T)
- Explicit out-of-scope list
- Success metrics with targets
- Timeline and effort estimate (rough)
```

**What this produces:** Fills **Scope / MVP**, **Out of scope**, and **Success criteria** in the PRD.

---

### Step 4 — Tech, architecture, and constraints

Teams often jump to tech choices before understanding the problem. Now that we have context, we can choose deliberately. Ref: [non-functional requirements checklist](https://www.door3.com/blog/non-functional-requirements-checklist), [ADR format](https://adr.github.io/).

**Prompt to use:**

```
Now let's decide how to build this. Interview me one question at a time.

1. TECH PREFERENCES
   - Do I have a preferred language, framework, or platform? Why?
   - Is there an existing codebase this lives in? What's its stack?
   - Any tech I want to avoid? (e.g. "no PHP", "avoid vendor lock-in")

2. INFRASTRUCTURE
   - Where will this run? (local, cloud — which provider, edge, serverless, on-prem)
   - Expected scale: how many users at launch? In 12 months? Peak concurrency?
   - Do we need a database? What kind of data? (relational, documents, time series, files)

3. NON-FUNCTIONAL REQUIREMENTS (the stuff teams forget)
   Walk through each — even a "not relevant" is useful:
   - **Performance:** Acceptable page load / API response time? (e.g. < 200ms p95)
   - **Availability:** How much downtime is OK? (99.9%? "best effort"?)
   - **Security:** Auth required? Roles/permissions? Data encryption at rest/transit?
   - **Privacy & compliance:** GDPR, HIPAA, SOC2, CCPA — any apply?
   - **Accessibility:** WCAG level required? Screen reader support?
   - **Scalability:** Does this need to handle 10x growth without re-architecture?
   - **Observability:** Logging, monitoring, alerting requirements?
   - **Backup & recovery:** RPO/RTO expectations? (how much data loss / downtime is tolerable)

4. INTEGRATIONS & DEPENDENCIES
   - Third-party APIs or services we depend on?
   - Auth provider (own, OAuth, SSO)?
   - Payment, email, SMS, file storage — any needed?

5. DEPLOYMENT & ENVIRONMENTS
   - How does code get to production? (CI/CD? manual? containerized?)
   - Do we need staging/preview environments?
   - Who deploys — me, a team, automated?

After all questions, produce:
- Proposed tech stack (runtime, framework, DB, infra)
- Non-functional requirements summary table
- Key ADR candidates (decisions that have trade-offs worth recording)
- Integration list
```

**What this produces:** Fills `docs/architecture.template.md`, identifies ADRs for `docs/adr/`, and fills **Risks/assumptions** and **Tech stack** in the PRD.

---

### Step 5 — Acceptance criteria (testable "done")

Every capability needs a testable "done" condition. If you can't describe how to verify it, the requirement isn't clear enough yet. Ref: [Atlassian acceptance criteria](https://www.atlassian.com/work-management/project-management/acceptance-criteria).

**Prompt to use:**

```
For the MVP features we defined, write acceptance criteria. Interview me if anything is ambiguous.

For each MUST-have and SHOULD-have feature:
1) Write a criterion that is outcome-focused:
   "User can…", "System must…", "When [condition], then [result]."
2) Describe how to verify it (automated test, manual step, or both).
3) Include at least one negative / edge case per feature
   (e.g. "Invalid input returns 400 with message", "Offline user sees cached data").

Format as:
| ID  | Feature       | Criterion                              | Verify                    |
|-----|---------------|----------------------------------------|---------------------------|
| AC1 | Login         | User can log in with email + password  | E2E test                  |
| AC2 | Login (fail)  | Invalid creds return 401, no stack trace | Unit test on auth service |

Also flag any criterion that is still vague and needs my input.
```

**What this produces:** Fills the **Acceptance criteria** table in the PRD. These become the "done" checklist and UAT gate.

---

### Step 6 — Risk and unknowns

What could go wrong? What don't we know yet? Most rework comes from risks nobody talked about. Ref: [apriorit requirements elicitation](https://www.apriorit.com/white-papers/699-requirement-elicitation).

**Prompt to use:**

```
Let's surface risks and unknowns before we start building. Interview me one question at a time.

1. TECHNICAL RISKS
   - Is any part of the tech stack unfamiliar to me/the team?
   - Are we depending on a third-party service that could change or go down?
   - Are there known performance bottlenecks or data-size concerns?

2. PRODUCT RISKS
   - Could users reject this because the workflow is wrong?
   - Are we guessing about user behavior without data?
   - Is there a competitor response to worry about?

3. RESOURCE RISKS
   - Am I the only person on this? What if I'm unavailable?
   - Is the timeline realistic given the scope?
   - Are there cost surprises (e.g. API usage, hosting at scale)?

4. UNKNOWNS ("what we don't know yet")
   - List anything we've said "we'll figure that out later" about.
   - For each unknown, propose: spike, research task, or ask someone.

After all questions, produce:
- Risk table: Risk | Likelihood | Impact | Mitigation
- Unknowns list with proposed action for each
```

**What this produces:** Fills **Risks and assumptions** in the PRD and may generate research tasks for `planning/`.

---

### Step 7 — Task breakdown and order

Now that we have a clear spec, break it into small, ordered, verifiable work items. Ref: [GSD atomic plans](https://github.com/gsd-build/get-shit-done), [Spec Kit tasks](https://github.com/github/spec-kit).

**Prompt to use:**

```
Using everything we've captured (PRD, architecture, acceptance criteria, risks), break the work into ordered tasks.

Rules:
- Each task is one logical thing (can be done in one sitting).
- Each task has a verification step (command, test, or manual check).
- List dependencies (which task IDs must finish first).
- Group into phases or milestones if there are natural break points.
- Flag any task that needs a spike or research first.

Output in this format (same as planning/tasks.template.md):

| ID | Description | Verification | Deps | Phase |
|----|-------------|--------------|------|-------|

After producing the list, tell me:
- Total number of tasks
- Estimated phases
- Which tasks can run in parallel
- Which tasks have the most risk / unknowns
```

**What this produces:** `planning/tasks-<feature>.md`. Implement in this order; run `./scripts/verify.sh` after each task.

---

### Step 8 — Review before building

One last gut-check before coding. Ref: [SDD — spec as source of truth](https://intent-driven.dev/knowledge/best-practices/).

**Prompt to use:**

```
Before we start implementing, review everything we've captured:
- Constitution: docs/constitution.md
- PRD: docs/prd-<name>.md
- Architecture: docs/architecture.template.md
- Tasks: planning/tasks-<name>.md

Check for:
1. Any acceptance criterion that is still vague or untestable.
2. Any MUST-have feature that has no tasks covering it.
3. Any task with no verification step.
4. Conflicting requirements or constraints.
5. Missing non-functional requirements (performance, security, accessibility).

List issues found and propose fixes. Do not start coding until issues are resolved or I say to proceed.
```

**What this produces:** A clean, reviewed spec. Issues get fixed now instead of during implementation.

---

## Part 2: AI / Human collaboration rules

### Who does what

| Activity | Human | AI |
|----------|--------|-----|
| **Define pain, users, scope, success** | Owns the "what" and "why"; answers prompts in Part 1 | Asks discovery questions; drafts PRD/AC from answers; flags gaps |
| **Decide tech and architecture** | Approves stack and key decisions; sets hard constraints | Proposes options with trade-offs; drafts ADRs; implements after approval |
| **Write specs and tasks** | Reviews and edits; signs off on acceptance criteria | Drafts constitution, PRD, architecture, tasks from prompts |
| **Implement code** | Reviews diffs; runs verify; accepts or requests changes | Implements per task list and coding standards; writes tests |
| **Verify and UAT** | Runs verify script; does manual checks; signs off "done" | Suggests test cases; can run commands if you approve |
| **Fix drift** | Decides when spec vs. code is source of truth | Prefers regenerating from spec when drift is large |

### When the human must be in the loop

- **Scope or goal change** — Human confirms before the AI rewrites PRD or tasks.
- **New tech or architectural decision** — Human approves before the AI adds an ADR or changes stack.
- **Secrets and production** — AI must never add secrets or deploy to prod without explicit human action.
- **Definition of Done** — Human confirms acceptance criteria are met (or delegates to automated tests that you approve).
- **Ambiguous requirements** — If the AI has to guess, it should ask first. "I assumed X — is that right?" is the minimum.

### When the AI should ask for clarification

- Ambiguous acceptance criterion (e.g. "fast enough" without a number).
- Conflicting constraints (e.g. "offline-first" vs "real-time sync" without priority).
- Missing context (e.g. existing API contract, brand guidelines, data format).
- Multiple valid implementations; AI should offer 2–3 options and ask which you prefer.
- Unclear scope boundary ("should I also handle [related thing]?").
- Non-functional requirements not specified (e.g. "You mentioned users but not expected scale — should I assume < 100 concurrent?").

### Shared rules to add to your constitution (optional)

- **Single source of truth:** For each feature, the PRD is the source of "what's done"; code and tests must align. When they drift, update the spec or regenerate.
- **One logical change per commit:** Conventional Commits (`feat(scope):`, `fix(scope):`).
- **Verify before commit:** Run `./scripts/verify.sh` before marking a task done.
- **No secrets in code or prompts:** AI must not read or commit `.env`, keys, or credentials.
- **Ask, don't assume:** When a requirement is unclear, ask one clarifying question rather than guessing.

---

## Quick reference: flow → artifacts

| Step | You / AI | Artifact updated |
|------|----------|------------------|
| 1. Pain deep-dive | You answer; AI interviews & summarizes | PRD Problem, Success criteria |
| 2. Users & context | You answer; AI maps journey | PRD Users, integrations, edge cases |
| 3. Scope & priority | You answer; AI drafts MoSCoW | PRD Scope/MVP, Out of scope, Success metrics |
| 4. Tech & constraints | You answer; AI proposes | Architecture, ADRs, PRD Risks |
| 5. Acceptance criteria | You approve; AI drafts table | PRD Acceptance criteria |
| 6. Risks & unknowns | You answer; AI tables risks | PRD Risks, research tasks in planning/ |
| 7. Tasks | AI drafts from all above | `planning/tasks-*.md` |
| 8. Review | AI audits; you approve | All artifacts checked for gaps |
| Implement | AI implements; you review | Code + verify |
| Verify / UAT | You run verify; sign off | Done checklist |

---

## How to use this doc with Cursor

1. **New project or big feature:** Start at Step 1. Paste the prompt, answer the AI's questions, then proceed to Step 2. By Step 8 you have a reviewed PRD and task list. Say "Implement the tasks in `planning/tasks-<name>.md` in order."
2. **Medium feature:** Steps 1, 3, 5, 7 (pain, scope+tech, acceptance criteria, tasks). Skip users deep-dive and risk analysis if scope is small and well-understood.
3. **Small fix:** Step 1 (one sentence pain + outcome) → Step 5 (AC for the fix) → "Break into 1–3 tasks and implement."
4. **AI/Human rules:** Copy the "Who does what" and "When the human must be in the loop" into the **Collaboration** section of `docs/constitution.md`.

> **Anti-pattern:** Do not paste a vague idea and say "build it." That's vibe coding. Even 5 minutes of answering Step 1 and Step 5 will save hours of rework. Ref: [SDD anti-patterns](https://intent-driven.dev/knowledge/best-practices/).

Reference: [Cursor rules](https://cursor.com/docs/context/rules), [Spec Kit](https://github.com/github/spec-kit), [GSD](https://github.com/gsd-build/get-shit-done), [BMAD](https://github.com/bmad-code-org/BMAD-METHOD), [Toptal requirements](https://www.toptal.com/product-managers/digital/requirements-gathering-mistakes), [5 Whys](https://atlassian.com/team-playbook/plays/5-whys), [non-functional requirements](https://www.door3.com/blog/non-functional-requirements-checklist).
