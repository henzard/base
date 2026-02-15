# Quality gate: lint -> test -> typecheck -> build (PowerShell).
# Replace TODO blocks with real commands for your stack. Ref: powerhouse workflow.

$ErrorActionPreference = "Stop"

Write-Host "=== Lint ==="
# TODO: add your linter, e.g.:
# npm run lint
# npx eslint .
Write-Host "TODO: run project linter"

Write-Host "=== Test ==="
# TODO: add your test runner, e.g.:
# npm test
# pytest
Write-Host "TODO: run project tests"

Write-Host "=== Typecheck ==="
# TODO: add if applicable, e.g.:
# npx tsc --noEmit
Write-Host "TODO: run project typecheck (optional)"

Write-Host "=== Build ==="
# TODO: add your build, e.g.:
# npm run build
Write-Host "TODO: run project build"

Write-Host "=== Verify complete ==="
