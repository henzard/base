# Tech stack decision guide

Use this guide **before** writing any code. Answer the questions below with your AI assistant (use "Act as Interviewer" mode). The answers drive your technology choices and prevent expensive rewrites later.

> **Rule of thumb:** Pick boring technology you (or your AI) know well. Trendy stacks cost 2-3x more in debugging time when things go wrong.

> **This workspace's preferred default stack** (used when you have no preference):
> React + TypeScript (frontend), Express.js + TypeScript (backend), SQLite (local dev), Supabase/PostgreSQL (production/distributed), Supabase Auth, Tailwind CSS + shadcn/ui.
> See `.cursor/rules/beginner-guardrails.mdc` for details.

<!-- Ref: https://stacksfinder.com/guides/how-to-choose-tech-stack-2026 -->
<!-- Ref: https://techgeeta.com/blog/best-tech-stack-for-mvp-2026 -->
<!-- Ref: https://techstack.sh/guides/tech-stack-for-startups/ -->

---

## Step 1 — What are you building?

| Question | Your answer |
|----------|-------------|
| What type of product? (SaaS, API, mobile app, CLI, content site, dashboard, data pipeline, marketplace, other) | |
| Who are the users? (consumers, businesses, internal team, developers, other) | |
| How many concurrent users in year one? (< 100, 100-1K, 1K-10K, 10K-100K, 100K+) | |
| Is this an MVP / prototype or production-grade from day one? | |

### Decision output

- **< 1K users, MVP**: Monolith with managed hosting. No microservices. No Kubernetes.
- **1K-10K users**: Monolith or modular monolith. Managed database. CDN for static assets.
- **10K+ users**: Consider service boundaries. Use load balancer and caching layer. Document in architecture ADR.

---

## Step 2 — Frontend

| Question | Your answer |
|----------|-------------|
| Does this need a web UI? | |
| Does this need a mobile app? | |
| Is SEO important? (content site, landing pages, blog) | |
| Is real-time important? (chat, live dashboards, collaboration) | |
| Does the team know a specific frontend framework? | |

### Decision matrix

| Situation | Recommended | Why |
|-----------|-------------|-----|
| Web app, team knows React | **Next.js + TypeScript** | SSR/SSG, large ecosystem, AI tooling support |
| Web app, want simplicity | **SvelteKit** | Less boilerplate, fast, small bundle |
| Web app, team knows Vue | **Nuxt** | Vue ecosystem, good DX |
| Content / marketing site | **Astro** or static Next.js | Fast, SEO-first, low JS |
| Mobile app (cross-platform) | **React Native** or **Flutter** | One codebase for iOS + Android |
| Admin dashboard / internal | **Next.js** or **Refine** | Fast to build, less polish needed |
| No frontend (API only) | Skip this section | |

### Default UI approach

- Use a component library rather than building from scratch: **shadcn/ui**, **Radix**, **Headless UI**, **Material UI**, or **Chakra UI**.
- Follow the rules in `.cursor/rules/ui-ux-design.mdc`.

---

## Step 3 — Backend

| Question | Your answer |
|----------|-------------|
| Does the team know a specific backend language? | |
| How complex is the business logic? (CRUD, moderate logic, complex domain) | |
| Do you need real-time (WebSockets, SSE)? | |
| Do you need background jobs (email, processing, scheduled tasks)? | |
| Will you integrate many third-party APIs? | |

### Decision matrix

| Situation | Recommended | Why |
|-----------|-------------|-----|
| JS/TS team, moderate complexity | **Node.js + Express or Fastify** | Same language front-to-back, huge ecosystem |
| Complex domain, enterprise | **NestJS (TS)** or **C# .NET** or **Java Spring Boot** | Structured, scalable, strong typing |
| Fast MVP, solo builder | **Next.js API routes** or **Laravel (PHP)** or **Supabase** | Batteries included, minimal boilerplate |
| Python team or ML/data focus | **FastAPI** | Async, type hints, great for APIs |
| Performance critical | **Go** or **Rust** | Low latency, low memory |

### Architecture pattern (pick one, document in ADR)

| Scale | Pattern | When |
|-------|---------|------|
| MVP / small | **Monolith** (MVC or layered) | < 5 developers, unclear domain boundaries |
| Medium | **Modular monolith** | Clear domain boundaries but single deployment |
| Large | **Microservices** | Large team (5+ devs per service), independent deployment needed |

> **Warning for beginners**: Start monolith. Extract services later when you have clear boundaries AND operational maturity. Premature microservices is the #1 architecture mistake.

---

## Step 4 — Database

| Question | Your answer |
|----------|-------------|
| Is data mostly relational? (users, orders, products with relationships) | |
| Is data mostly documents/flexible? (content, configs, varied schemas) | |
| Do you need full-text search? | |
| Do you need real-time subscriptions? | |
| Expected data volume in year one? | |

### Decision matrix

| Situation | Recommended | Why |
|-----------|-------------|-----|
| Relational data (most apps) | **PostgreSQL** | Flexible, JSON support, scales well, free |
| Document-first / flexible schema | **MongoDB** | Schema flexibility, good for prototyping |
| Simple app, want speed | **SQLite** (embedded) or **Supabase** (hosted Postgres) | Zero setup |
| Full-text search needed | **PostgreSQL** (built-in) or add **Meilisearch** / **Typesense** | Avoid Elasticsearch unless massive scale |
| Real-time subscriptions | **Supabase** (Postgres + realtime) or **Firebase** | Built-in pub/sub |
| Caching layer needed | **Redis** | In-memory, fast, widely supported |

> Follow the rules in `.cursor/rules/database-design.mdc` for all schema work.

---

## Step 5 — Authentication

| Question | Your answer |
|----------|-------------|
| Do users need to log in? | |
| Social login (Google, GitHub, etc.)? | |
| Enterprise SSO (SAML, OIDC)? | |
| API key auth for developers? | |

### Decision matrix

| Situation | Recommended | Why |
|-----------|-------------|-----|
| Standard web app | **Clerk**, **Auth.js (NextAuth)**, or **Supabase Auth** | Handles OAuth, sessions, JWT |
| Enterprise / SSO | **Auth0** or **Clerk** | SAML, OIDC, org management |
| API-only | **API keys** + rate limiting | Simple, stateless |
| Roll your own | **Don't.** Use a library. | Auth is deceptively hard to get right |

---

## Step 6 — Hosting and deployment

| Question | Your answer |
|----------|-------------|
| Budget per month? ($0-50, $50-500, $500+) | |
| Need custom domain? | |
| Where are your users geographically? | |
| Any compliance requirements (data residency, HIPAA, SOC2)? | |

### Decision matrix

| Situation | Recommended | Why |
|-----------|-------------|-----|
| Frontend + serverless backend | **Vercel** or **Netlify** | Auto-deploy, edge CDN, free tier |
| Full-stack, want simplicity | **Railway** or **Render** | Easy monolith hosting, managed DB |
| Need containers / flexibility | **Fly.io** or **AWS ECS** | Docker-based, multi-region |
| Enterprise / compliance | **AWS**, **Azure**, or **GCP** | Full control, compliance certifications |
| Static site | **Cloudflare Pages** or **GitHub Pages** | Free, fast, global CDN |

---

## Step 7 — Document your decisions

After answering the questions above:

1. Fill in `docs/architecture.template.md` with your chosen stack.
2. Create an ADR (`docs/adr/0002-tech-stack.md`) documenting why you chose each technology.
3. Update `docs/constitution.md` with any tech constraints or principles.
4. Wire up `scripts/verify.sh` with the real lint, test, typecheck, and build commands for your stack.

---

## Quick-start stacks (copy-paste starting points)

### Workspace preferred default (use when no preference stated)
- **Frontend**: React + TypeScript + Tailwind CSS + shadcn/ui (Vite or Next.js)
- **Backend**: Express.js + TypeScript
- **Database (local/dev)**: SQLite (via better-sqlite3 or Drizzle ORM) — zero-config, instant setup
- **Database (production)**: Supabase (PostgreSQL) — sync SQLite to Supabase for multi-user / cloud / real-time
- **Auth**: Supabase Auth
- **Hosting**: Vercel or Railway (frontend) + Supabase (DB + auth)
- **Cost**: Free tier to ~$25/mo for MVP
- **Why this stack**: React has the largest ecosystem and hiring pool. Express is the most understood Node.js backend. SQLite gives instant local development. Supabase gives you PostgreSQL, auth, real-time, and storage in one managed service when you need to go distributed.

### Alternative: "Next.js all-in-one" (full-stack web app)
- **Frontend + Backend**: Next.js + TypeScript + Tailwind CSS + shadcn/ui (API routes for backend)
- **Database**: PostgreSQL (via Supabase or Neon)
- **Auth**: Clerk or Auth.js
- **Hosting**: Vercel (frontend) + managed DB
- **Cost**: Free tier to ~$25/mo for MVP

### The "Laravel express" (fast MVP)
- **Full-stack**: Laravel + Blade/Livewire or Inertia.js + Vue/React
- **Database**: PostgreSQL or MySQL
- **Auth**: Laravel built-in
- **Hosting**: Laravel Forge + DigitalOcean
- **Cost**: ~$12/mo

### The "Python data app"
- **Backend**: FastAPI + SQLAlchemy
- **Frontend**: Next.js or Streamlit (for dashboards)
- **Database**: PostgreSQL
- **Auth**: FastAPI-Users or Clerk
- **Hosting**: Railway or AWS Lambda
- **Cost**: Free tier to ~$20/mo

### The "API / platform"
- **Backend**: NestJS + TypeScript or Go
- **Database**: PostgreSQL + Redis
- **Auth**: API keys + JWT
- **Docs**: OpenAPI / Swagger auto-generated
- **Hosting**: Fly.io or AWS
- **Cost**: ~$10-50/mo
