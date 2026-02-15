# API / interface contract (template)

> Define endpoints, payloads, and response shapes before implementation. Copy per API or service. Ref: [Spec Kit plan step](https://github.com/github/spec-kit).

## Service

- **Name**: _e.g. User API_
- **Base URL**: _e.g. `/api/v1/users`_
- **Auth**: _e.g. Bearer JWT; roles: admin, user_

## Endpoints

### `POST /api/v1/users`

- **Description**: Create a new user.
- **Auth**: Admin only.
- **Request body**:
  ```json
  {
    "email": "string (required)",
    "name": "string (required)",
    "role": "admin | user (default: user)"
  }
  ```
- **Response 201**:
  ```json
  {
    "id": "string (uuid)",
    "email": "string",
    "name": "string",
    "role": "string",
    "createdAt": "ISO 8601"
  }
  ```
- **Error responses**:
  | Status | When | Body |
  |--------|------|------|
  | 400 | Validation fails | `{ "error": "email is required" }` |
  | 401 | No token | `{ "error": "unauthorized" }` |
  | 409 | Email exists | `{ "error": "user already exists" }` |

### `GET /api/v1/users/:id`

- **Description**: _Get user by ID._
- **Auth**: _Any authenticated user._
- **Response 200**: _Same shape as create response._
- **Error responses**: _404 if not found._

<!-- Add more endpoints below using the same format. -->

## Shared types

<!-- Types used across endpoints. -->
```
User {
  id: string (uuid)
  email: string
  name: string
  role: "admin" | "user"
  createdAt: string (ISO 8601)
}
```

## Conventions

- All dates: ISO 8601 UTC.
- All IDs: UUID v4.
- Error shape: `{ "error": "human-readable message" }`. No stack traces.
- Pagination (if needed): `?page=1&limit=20`; response includes `{ data: [], total: number, page: number }`.

## When NOT to use this

- Internal-only functions or modules: document with types/JSDoc instead.
- Prototypes: skip formal contract; define inline.
