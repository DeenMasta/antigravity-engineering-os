$ErrorActionPreference = "Stop"

Write-Host ""
Write-Host "============================================"
Write-Host "  Antigravity Engineering OS"
Write-Host "  Project Setup"
Write-Host "============================================"
Write-Host ""

# ------------------------------------------------------------
# Helpers
# ------------------------------------------------------------

function Ask-Choice {
    param(
        [string]$Question,
        [array]$Options
    )

    Write-Host ""
    Write-Host $Question

    for ($i = 0; $i -lt $Options.Count; $i++) {
        Write-Host "[$($i + 1)] $($Options[$i])"
    }

    do {
        $answer = Read-Host "Select"
        $number = 0
        $valid = [int]::TryParse($answer, [ref]$number)
    } while (
        -not $valid -or
        $number -lt 1 -or
        $number -gt $Options.Count
    )

    return $Options[$number - 1]
}

# ------------------------------------------------------------
# Project information
# ------------------------------------------------------------

$projectName = Read-Host "Project name"

$projectType = Ask-Choice `
    "Project type" `
    @(
        "landing-page"
        "corporate-website"
        "saas"
        "internal-business-system"
        "pos"
        "flutter-app"
        "custom-client-app"
        "ai-application"
    )

$mode = Ask-Choice `
    "Engineering mode" `
    @(
        "mode-b"
        "mode-c"
        "both"
    )

$uiStyle = Ask-Choice `
    "UI/UX style" `
    @(
        "modern-saas"
        "enterprise"
        "corporate"
        "minimal"
        "premium"
        "dashboard"
        "mobile-first"
        "custom"
    )

$quality = Ask-Choice `
    "Engineering quality" `
    @(
        "strict"
        "standard"
    )

# ------------------------------------------------------------
# Optional stacks
# ------------------------------------------------------------

$frontend = Ask-Choice `
    "Frontend" `
    @(
        "nextjs"
        "react"
        "none"
    )

$backend = Ask-Choice `
    "Backend" `
    @(
        "laravel"
        "nodejs"
        "none"
    )

$database = Ask-Choice `
    "Primary database" `
    @(
        "postgresql"
        "mysql"
        "mongodb"
        "none"
    )

# ------------------------------------------------------------
# Create project folders
# ------------------------------------------------------------

New-Item -ItemType Directory ".agents\skills" -Force | Out-Null
New-Item -ItemType Directory ".agents\rules" -Force | Out-Null
New-Item -ItemType Directory ".project" -Force | Out-Null

# ------------------------------------------------------------
# Base custom skills
# ------------------------------------------------------------

$baseSkills = @(
    "project-profile"
    "feature-planner"
    "architecture-reviewer"
)

$selectedSkills = New-Object System.Collections.Generic.List[string]

foreach ($skill in $baseSkills) {
    $selectedSkills.Add($skill)
}

# ------------------------------------------------------------
# Mode
# ------------------------------------------------------------

if ($mode -eq "mode-b" -or $mode -eq "both") {
    $selectedSkills.Add("mode-b")
}

if ($mode -eq "mode-c" -or $mode -eq "both") {
    $selectedSkills.Add("mode-c")
}

# ------------------------------------------------------------
# UI / browser
# ------------------------------------------------------------

$selectedSkills.Add("ui-ux-pro-max")
$selectedSkills.Add("visual-qa")

if ($projectType -ne "flutter-app") {
    $selectedSkills.Add("web-design-guidelines")
    $selectedSkills.Add("playwright-cli")
}

# ------------------------------------------------------------
# Database
# ------------------------------------------------------------

if ($database -ne "none") {
    $selectedSkills.Add("database-architect")
}

# ------------------------------------------------------------
# Frontend
# ------------------------------------------------------------

if ($frontend -eq "nextjs" -or $frontend -eq "react") {
    $selectedSkills.Add("vercel-react-best-practices")
    $selectedSkills.Add("vercel-composition-patterns")
}

# ------------------------------------------------------------
# Flutter
# ------------------------------------------------------------

if ($frontend -eq "none" -and $projectType -eq "flutter-app") {
    $selectedSkills.Add("flutter-architecture")
    $selectedSkills.Add("flutter-widget-test")
    $selectedSkills.Add("flutter-integration-test")
    $selectedSkills.Add("flutter-responsive")
    $selectedSkills.Add("flutter-http")
    $selectedSkills.Add("flutter-routing")
    $selectedSkills.Add("dart-static-analysis")
}

# ------------------------------------------------------------
# Remove duplicates
# ------------------------------------------------------------

$selectedSkills = $selectedSkills | Select-Object -Unique

Write-Host ""
Write-Host "============================================"
Write-Host "  Recommended Skills"
Write-Host "============================================"
Write-Host ""

foreach ($skill in $selectedSkills) {
    Write-Host "[x] $skill"
}

Write-Host ""

$confirm = Read-Host "Create project configuration? [Y/n]"

if ($confirm -and $confirm.ToLower() -ne "y") {
    Write-Host "Cancelled."
    exit 0
}

# ------------------------------------------------------------
# Locate master Engineering OS
# ------------------------------------------------------------

$scriptRoot = Split-Path -Parent $PSScriptRoot
$masterSkills = Join-Path $scriptRoot ".agents\skills"

# ------------------------------------------------------------
# Copy skills
# ------------------------------------------------------------

foreach ($skill in $selectedSkills) {

    $source = Join-Path $masterSkills $skill
    $destination = Join-Path ".agents\skills" $skill

    if (Test-Path $source) {

        Write-Host "Installing local skill: $skill"

        Copy-Item `
            -Recurse `
            -Force `
            $source `
            $destination
    }
    else {
        Write-Warning "Skill not found in master registry: $skill"
    }
}

# ------------------------------------------------------------
# Create project profile
# ------------------------------------------------------------

$profilePath = ".project\project-profile.yaml"

$profile = @"
project:
  name: "$projectName"
  type: $projectType

engineering:
  quality: $quality
  philosophy: pragmatic-clean
  scalability: high
  maintainability: high
  testing: strict
  security: strict

frontend:
  framework: $frontend
  language: typescript
  styling: tailwind
  components: shadcn

backend:
  framework: $backend

database:
  primary: $database
  secondary: []
  cache: redis

ui:
  style: $uiStyle
  density: comfortable
  responsive: true
  accessibility: strict
  visual_qa: required
  animation: subtle

testing:
  unit: required
  integration: required
  e2e: required
  browser: required
  visual: required

approval:
  architecture: required
  database: required
  security: required
  major_dependencies: required
  infrastructure: required
  deployment: required

ai:
  providers: []
  agents: false
  mcp: false
"@

Set-Content `
    -Path $profilePath `
    -Value $profile `
    -Encoding UTF8

# ------------------------------------------------------------
# Summary
# ------------------------------------------------------------

Write-Host ""
Write-Host "============================================"
Write-Host "  Project Setup Complete"
Write-Host "============================================"
Write-Host ""

Write-Host "Project:     $projectName"
Write-Host "Type:        $projectType"
Write-Host "Mode:        $mode"
Write-Host "UI Style:    $uiStyle"
Write-Host "Quality:     $quality"
Write-Host "Frontend:    $frontend"
Write-Host "Backend:     $backend"
Write-Host "Database:    $database"

Write-Host ""
Write-Host "Generated:"
Write-Host "  .project\project-profile.yaml"
Write-Host "  .agents\skills\"

Write-Host ""
Write-Host "Next:"
Write-Host "  Review the generated Project Profile."
Write-Host "  Then open the project in Antigravity."
Write-Host ""