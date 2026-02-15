#!/usr/bin/env bash
# Quality gate: lint → test → typecheck → build.
# Replace TODO blocks with real commands for your stack. Ref: powerhouse workflow.

set -e

echo "=== Lint ==="
# TODO: add your linter, e.g.:
# npm run lint
# npx eslint .
# ruff check .
# cargo clippy
echo "TODO: run project linter"

echo "=== Test ==="
# TODO: add your test runner, e.g.:
# npm test
# pytest
# cargo test
echo "TODO: run project tests"

echo "=== Typecheck ==="
# TODO: add if applicable, e.g.:
# npx tsc --noEmit
# mypy .
echo "TODO: run project typecheck (optional)"

echo "=== Build ==="
# TODO: add your build, e.g.:
# npm run build
# cargo build
echo "TODO: run project build"

echo "=== Verify complete ==="
