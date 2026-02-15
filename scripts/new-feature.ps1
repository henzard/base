# Scaffold a new feature: creates PRD, tasks, and optionally ADR from templates.
# Usage: .\scripts\new-feature.ps1 <feature-name>
# Example: .\scripts\new-feature.ps1 user-auth

param(
    [Parameter(Mandatory=$true, Position=0)]
    [string]$FeatureName
)

$ErrorActionPreference = "Stop"
$Slug = $FeatureName.ToLower() -replace '\s+', '-'

Write-Host "=== Scaffolding feature: $Slug ==="

# PRD
$PrdFile = "docs\prd-$Slug.md"
if (-not (Test-Path $PrdFile)) {
    Copy-Item "docs\prd.template.md" $PrdFile
    Write-Host "Created: $PrdFile"
} else {
    Write-Host "Exists:  $PrdFile (skipped)"
}

# Tasks
$TaskFile = "planning\tasks-$Slug.md"
if (-not (Test-Path $TaskFile)) {
    Copy-Item "planning\tasks.template.md" $TaskFile
    Write-Host "Created: $TaskFile"
} else {
    Write-Host "Exists:  $TaskFile (skipped)"
}

# ADR (find next number)
$AdrFiles = Get-ChildItem "docs\adr\*.md" -ErrorAction SilentlyContinue
$NextNum = if ($AdrFiles) { $AdrFiles.Count + 1 } else { 1 }
$AdrNum = $NextNum.ToString("D4")
$AdrFile = "docs\adr\$AdrNum-$Slug.md"
if (-not (Test-Path $AdrFile)) {
    Copy-Item "docs\adr\0001-template.md" $AdrFile
    (Get-Content $AdrFile) -replace 'Template for Architecture Decision Records', "$Slug architecture decision" | Set-Content $AdrFile
    Write-Host "Created: $AdrFile"
} else {
    Write-Host "Exists:  $AdrFile (skipped)"
}

Write-Host ""
Write-Host "=== Done. Next steps ==="
Write-Host "1. Fill $PrdFile (use workflow-sdlc.md prompts)"
Write-Host "2. Fill $TaskFile with tasks and verification steps"
Write-Host "3. Optionally fill $AdrFile if there are key decisions"
Write-Host "4. Tell Cursor: `"Implement tasks in planning/tasks-$Slug.md in order`""
