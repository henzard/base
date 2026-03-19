# Design patterns quick reference

A beginner-friendly guide to the patterns this workspace uses. When in doubt, the AI should default to the simplest pattern that solves the problem.

> **Golden rule for juniors**: Don't pick a pattern because it sounds impressive. Pick it because your problem matches the "Use when" description below.

---

## Architecture patterns (system level)

### Layered / N-Tier

```
Presentation → Business Logic → Data Access → Database
```

- **Use when**: Standard web app, CRUD operations, clear separation needed.
- **Avoid when**: Complex domain with many cross-cutting concerns.
- **Example**: Controller calls a Service, Service calls a Repository, Repository queries DB.

### MVC (Model-View-Controller)

- **Use when**: Server-rendered web apps, traditional request-response.
- **How it works**: Request → Controller (handles input) → Model (business logic + data) → View (renders output).
- **Key rule**: Views never talk to the database. Controllers stay thin.

### Modular monolith

- **Use when**: Growing app with clear domain boundaries but you're not ready for microservices.
- **How it works**: One deployable unit, but code is organized into independent modules by domain (auth, billing, orders). Modules communicate through defined interfaces, not by reaching into each other's internals.
- **Key rule**: Modules only depend on each other through public APIs/interfaces. No cross-module database table sharing.

### Client-server / API-first

- **Use when**: Frontend and backend deployed separately, or multiple clients (web, mobile, CLI).
- **How it works**: Backend exposes a REST or GraphQL API. Frontend is a separate app that consumes it.
- **Key rule**: Define the API contract first (`docs/api-contract.template.md`), then implement both sides.

---

## Code patterns (file/class level)

### Repository pattern

```
Service → Repository (interface) → Database
```

- **Use when**: You want to swap databases or mock data access in tests.
- **How it works**: Repository abstracts all database queries behind an interface. Service code never writes SQL directly.
- **Key rule**: One repository per domain entity (UserRepository, OrderRepository).

### Service layer

- **Use when**: Business logic is more than simple CRUD.
- **How it works**: Services contain business rules and orchestrate repositories. Controllers call services, never repositories directly.
- **Key rule**: Services should be stateless. Don't store request data in service instances.

### DTO (Data Transfer Object)

- **Use when**: Data shape differs between layers (API response vs. database row vs. internal model).
- **How it works**: Separate objects for API input/output, database entities, and internal domain models. Map between them at boundaries.
- **Key rule**: Never expose your database model directly in an API response.

### Factory pattern

- **Use when**: Object creation is complex or varies by context.
- **How it works**: A function/class that encapsulates creation logic.
- **Example**: `createNotification(type)` returns EmailNotification, SMSNotification, or PushNotification based on type.

### Strategy pattern

- **Use when**: Multiple algorithms for the same task (e.g. different payment processors, different sorting strategies).
- **How it works**: Define an interface, implement variants, inject the right one at runtime.
- **Key rule**: Prefer this over large `if/else` or `switch` chains.

### Observer / Event pattern

- **Use when**: One action triggers multiple side effects (e.g. user signs up → send email, create profile, log event).
- **How it works**: Publisher emits events. Subscribers listen and react independently.
- **Key rule**: Keep events simple data objects. Subscribers should be independently testable.

---

## API design patterns

### REST conventions

| Action | Method | URL pattern | Status code |
|--------|--------|------------|-------------|
| List | GET | `/resources` | 200 |
| Get one | GET | `/resources/:id` | 200 (404 if not found) |
| Create | POST | `/resources` | 201 |
| Update (full) | PUT | `/resources/:id` | 200 |
| Update (partial) | PATCH | `/resources/:id` | 200 |
| Delete | DELETE | `/resources/:id` | 204 |

- Use plural nouns for resources: `/users`, `/orders`.
- Nest for relationships: `/users/:id/orders`.
- Use query params for filtering: `/orders?status=pending&sort=-created_at`.
- Always return consistent error shape: `{ "error": { "code": "...", "message": "..." } }`.

### Pagination

- Use cursor-based pagination for large datasets: `?cursor=abc123&limit=20`.
- Use offset-based for simple admin tools: `?page=2&per_page=20`.
- Always include pagination metadata in response: `{ "data": [...], "next_cursor": "..." }`.

### Versioning

- URL prefix: `/api/v1/resources` (simplest, recommended for most projects).
- Only version when you make breaking changes.

---

## Error handling patterns

### Structured errors

```
{
  "error": {
    "code": "VALIDATION_ERROR",
    "message": "Email is required",
    "field": "email"
  }
}
```

- Use error codes (machine-readable) alongside messages (human-readable).
- Map internal errors to appropriate HTTP status codes.
- Never expose stack traces or internal paths in production.

### Error boundaries (frontend)

- Wrap page sections in error boundaries so one broken component doesn't crash the whole page.
- Show a friendly fallback UI: "Something went wrong. Try refreshing."
- Log the error to a monitoring service.

### Retry with backoff

- For network calls to external services: retry 2-3 times with exponential backoff.
- Make retried operations idempotent (safe to repeat).

---

## State management patterns (frontend)

| Scale | Pattern | Example |
|-------|---------|---------|
| Component-local | `useState` / reactive vars | Toggle, form input |
| Shared (few components) | Context / props / stores | Theme, current user |
| Complex / global | State library (Zustand, Redux Toolkit, Pinia) | Shopping cart, multi-step wizard |
| Server data | Query library (TanStack Query, SWR) | API data with caching, refetching |

**Key rule**: Start with the simplest level. Move up only when you feel pain. Most apps need only useState + a query library.

---

## Testing patterns

| What to test | Pattern | Tool examples |
|---|---|---|
| Pure functions, utilities | **Unit test** | Jest, Vitest, pytest |
| API endpoints | **Integration test** | Supertest, httpx |
| User flows | **E2E test** | Playwright, Cypress |
| Component rendering | **Component test** | Testing Library |
| Visual appearance | **Snapshot / visual regression** | Chromatic, Percy |

**Priority for beginners**: Unit tests for business logic → Integration tests for API → E2E for critical user flows. Don't aim for 100% coverage — aim for confidence in the important paths.

---

## Anti-patterns decision tree

Before implementing, ask:

1. **Am I copying code?** → Extract into a shared function or component.
2. **Am I passing more than 3 params?** → Use an options object or rethink the interface.
3. **Is this function doing two things?** → Split it.
4. **Am I writing a 200+ line file?** → Split by responsibility.
5. **Am I adding a `type` field and switching on it?** → Consider strategy pattern or polymorphism.
6. **Am I accessing the database from a controller?** → Add a service layer.
7. **Am I hardcoding config values?** → Move to environment variables.
8. **Am I building auth/payments/email from scratch?** → Use a proven library or service.

---

## When to create an ADR

Create an Architecture Decision Record (`docs/adr/`) when you:

- Choose a technology (framework, database, hosting).
- Choose an architecture pattern (monolith vs. services).
- Make a trade-off you'll need to explain later (denormalization, caching strategy).
- Decide NOT to do something common (e.g. "we chose not to use TypeScript because...").

Template: `docs/adr/0001-template.md`.
