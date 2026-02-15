#!/usr/bin/env bash
# Scaffold a new feature: creates PRD, tasks, and optionally ADR from templates.
# Usage: ./scripts/new-feature.sh <feature-name>
# Example: ./scripts/new-feature.sh user-auth

set -e

if [ -z "$1" ]; then
  echo "Usage: ./scripts/new-feature.sh <feature-name>"
  echo "Example: ./scripts/new-feature.sh user-auth"
  exit 1
fi

FEATURE="$1"
SLUG=$(echo "$FEATURE" | tr '[:upper:]' '[:lower:]' | tr ' ' '-')

echo "=== Scaffolding feature: $SLUG ==="

# PRD
if [ ! -f "docs/prd-${SLUG}.md" ]; then
  cp docs/prd.template.md "docs/prd-${SLUG}.md"
  echo "Created: docs/prd-${SLUG}.md"
else
  echo "Exists:  docs/prd-${SLUG}.md (skipped)"
fi

# Tasks
if [ ! -f "planning/tasks-${SLUG}.md" ]; then
  cp planning/tasks.template.md "planning/tasks-${SLUG}.md"
  echo "Created: planning/tasks-${SLUG}.md"
else
  echo "Exists:  planning/tasks-${SLUG}.md (skipped)"
fi

# ADR (find next number)
NEXT_ADR=$(ls docs/adr/*.md 2>/dev/null | wc -l | tr -d ' ')
NEXT_ADR=$((NEXT_ADR + 1))
ADR_NUM=$(printf "%04d" "$NEXT_ADR")
ADR_FILE="docs/adr/${ADR_NUM}-${SLUG}.md"
if [ ! -f "$ADR_FILE" ]; then
  cp docs/adr/0001-template.md "$ADR_FILE"
  # Update title
  sed -i.bak "s/Template for Architecture Decision Records/${SLUG} architecture decision/" "$ADR_FILE" && rm -f "${ADR_FILE}.bak"
  echo "Created: $ADR_FILE"
else
  echo "Exists:  $ADR_FILE (skipped)"
fi

# Context handoff
if [ ! -f "docs/context-handoff.md" ]; then
  echo "Note: docs/context-handoff.md not found. Consider creating from template."
fi

echo ""
echo "=== Done. Next steps ==="
echo "1. Fill docs/prd-${SLUG}.md (use workflow-sdlc.md prompts)"
echo "2. Fill planning/tasks-${SLUG}.md with tasks and verification steps"
echo "3. Optionally fill $ADR_FILE if there are key decisions"
echo "4. Tell Cursor: \"Implement tasks in planning/tasks-${SLUG}.md in order\""
