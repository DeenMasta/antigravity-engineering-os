$ErrorActionPreference = "Stop"

# ============================================================
# Antigravity Engineering OS - Project Setup
# ============================================================

Write-Host ""
Write-Host "===================================================="
Write-Host "     Antigravity Engineering OS - Project Setup"
Write-Host "===================================================="
Write-Host ""

# ------------------------------------------------------------
# Helpers
# ------------------------------------------------------------

function Ask-Choice {
    param(
        [string]$Question,
        [string[]]$Options,
        [int]$Default = 1
    )

    Write-Host ""
    Write-Host $Question

    for ($i = 0; $i -lt $Options.Count; $i++) {
        $suffix = ""
        if (($i + 1) -eq $Default) {
            $suffix = " (recommended)"
        }

        Write-Host "  [$($i + 1)] $($Options[$i])$suffix"
    }

    while ($true) {
        $answer = Read-Host "Select [$Default]"

        if ([string]::IsNullOrWhiteSpace($answer)) {
            return $Options[$Default - 1]
        }

        $number = 0

        if ([int]::TryParse($answer, [ref]$number)) {
            if ($number -ge 1 -and $number -le $Options.Count) {
                return $Options[$number - 1]
            }
        }

        Write-Host "Invalid selection. Enter a number from 1 to $($Options.Count)." -ForegroundColor Yellow
    }
}

function Ask-YesNo {
    param(
        [string]$Question,
        [bool]$Default = $true
    )

    $hint = if ($Default) { "Y/n" } else { "y/N" }

    while ($true) {
        $answer = Read-Host "$Question [$hint]"

        if ([string]::IsNullOrWhiteSpace($answer)) {
            return $Default
        }

        switch ($answer.Trim().ToLower()) {
            "y"    { return $true }
            "yes"  { return $true }
            "n"    { return $false }
            "no"   { return $false }
            default {
                Write-Host "Please enter y or n." -ForegroundColor Yellow
            }
        }
    }
}

function Add-Unique {
    param(
        [System.Collections.Generic.List[string]]$List,
        [string]$Value
    )

    if (-not $List.Contains($Value)) {
        [void]$List.Add($Value)
    }
}

function Remove-ItemIfExists {
    param(
        [string]$Path
    )

    if (Test-Path $Path) {
        Remove-Item $Path -Recurse -Force
    }
}

# ------------------------------------------------------------
# Project name
# ------------------------------------------------------------

$projectName = Read-Host "Project name"

if ([string]::IsNullOrWhiteSpace($projectName)) {
    throw "Project name cannot be empty."
}

# ------------------------------------------------------------
# Project type
# ------------------------------------------------------------

$projectType = Ask-Choice `
    "What are you building?" `
    @(
        "landing-page"
        "corporate-website"
        "saas"
        "internal-business-system"
        "pos"
        "flutter-app"
        "custom-client-app"
        "ai-application"
    ) `
    1

# ------------------------------------------------------------
# Recommended project profile
# ------------------------------------------------------------

$frontend = "none"
$backend = "none"
$database = "none"
$uiStyle = "modern-saas"
$scalability = "moderate"

switch ($projectType) {

    "landing-page" {
        $frontend = "nextjs"
        $uiStyle = "modern-saas"
        $scalability = "moderate"
    }

    "corporate-website" {
        $frontend = "nextjs"
        $uiStyle = "corporate"
        $scalability = "moderate"
    }

    "saas" {
        $frontend = "nextjs"
        $backend = "laravel"
        $database = "postgresql"
        $uiStyle = "modern-saas"
        $scalability = "high"
    }

    "internal-business-system" {
        $frontend = "nextjs"
        $backend = "laravel"
        $database = "postgresql"
        $uiStyle = "enterprise"
        $scalability = "high"
    }

    "pos" {
        $frontend = "nextjs"
        $backend = "laravel"
        $database = "mysql"
        $uiStyle = "enterprise"
        $scalability = "high"
    }

    "flutter-app" {
        $frontend = "flutter"
        $backend = "laravel"
        $database = "postgresql"
        $uiStyle = "mobile-first"
        $scalability = "moderate"
    }

    "custom-client-app" {
        $frontend = "nextjs"
        $backend = "laravel"
        $database = "postgresql"
        $uiStyle = "enterprise"
        $scalability = "high"
    }

    "ai-application" {
        $frontend = "nextjs"
        $backend = "nodejs"
        $database = "postgresql"
        $uiStyle = "modern-saas"
        $scalability = "high"
    }
}

# ------------------------------------------------------------
# Show recommendations
# ------------------------------------------------------------

Write-Host ""
Write-Host "===================================================="
Write-Host "     RECOMMENDED PROJECT ARCHITECTURE"
Write-Host "===================================================="
Write-Host ""
Write-Host "Project Type : $projectType"
Write-Host "Frontend     : $frontend"
Write-Host "Backend      : $backend"
Write-Host "Database     : $database"
Write-Host "UI Style     : $uiStyle"
Write-Host "Scalability  : $scalability"
Write-Host ""

$customizeArchitecture = Ask-YesNo `
    "Customize the recommended architecture?" `
    $false

if ($customizeArchitecture) {

    $frontend = Ask-Choice `
        "Frontend" `
        @(
            "nextjs"
            "react"
            "flutter"
            "none"
        ) `
        1

    $backend = Ask-Choice `
        "Backend" `
        @(
            "laravel"
            "nodejs"
            "none"
        ) `
        1

    $database = Ask-Choice `
        "Primary database" `
        @(
            "postgresql"
            "mysql"
            "mongodb"
            "none"
        ) `
        1

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
        ) `
        1

    $scalability = Ask-Choice `
        "Expected scalability" `
        @(
            "low"
            "moderate"
            "high"
        ) `
        2
}

# ------------------------------------------------------------
# Engineering configuration
# ------------------------------------------------------------

$quality = Ask-Choice `
    "Engineering quality" `
    @(
        "strict"
        "standard"
    ) `
    1

$mode = Ask-Choice `
    "Engineering mode" `
    @(
        "mode-b"
        "mode-c"
        "both"
    ) `
    1

# ------------------------------------------------------------
# Determine recommended local skills
# ------------------------------------------------------------

$skills = New-Object System.Collections.Generic.List[string]

# Core
Add-Unique $skills "project-profile"
Add-Unique $skills "feature-planner"

if ($mode -eq "mode-b" -or $mode -eq "both") {
    Add-Unique $skills "mode-b"
}

if ($mode -eq "mode-c" -or $mode -eq "both") {
    Add-Unique $skills "mode-c"
    Add-Unique $skills "architecture-reviewer"
}

# Architecture
if ($projectType -in @(
    "saas",
    "internal-business-system",
    "pos",
    "custom-client-app",
    "ai-application"
)) {
    Add-Unique $skills "architecture-reviewer"
}

# Database
if ($database -ne "none") {
    Add-Unique $skills "database-architect"
}

# Web frontend
if ($frontend -eq "nextjs" -or $frontend -eq "react") {
    Add-Unique $skills "ui-ux-pro-max"
    Add-Unique $skills "visual-qa"
    Add-Unique $skills "web-design-guidelines"
    Add-Unique $skills "vercel-react-best-practices"
    Add-Unique $skills "vercel-composition-patterns"
    Add-Unique $skills "playwright-cli"
}

# Flutter
if ($frontend -eq "flutter") {
    Add-Unique $skills "ui-ux-pro-max"
    Add-Unique $skills "flutter-architecture"
    Add-Unique $skills "flutter-widget-test"
    Add-Unique $skills "flutter-integration-test"
    Add-Unique $skills "flutter-responsive"
    Add-Unique $skills "flutter-http"
    Add-Unique $skills "flutter-routing"
    Add-Unique $skills "dart-static-analysis"
}

# ------------------------------------------------------------
# Show final skill recommendation
# ------------------------------------------------------------

Write-Host ""
Write-Host "===================================================="
Write-Host "     RECOMMENDED SKILLS"
Write-Host "===================================================="
Write-Host ""

foreach ($skill in $skills) {
    Write-Host "  [x] $skill"
}

Write-Host ""

$editSkills = Ask-YesNo `
    "Do you want to edit the recommended skill list?" `
    $true

if ($editSkills) {

    Write-Host ""
    Write-Host "Available local skills:"
    Write-Host ""

    $masterSkillsPath = Join-Path $PSScriptRoot "..\.agents\skills"

    $availableSkills = @(
        Get-ChildItem `
            $masterSkillsPath `
            -Directory |
        Sort-Object Name |
        Select-Object -ExpandProperty Name
    )

    for ($i = 0; $i -lt $availableSkills.Count; $i++) {

        $mark = " "

        if ($skills.Contains($availableSkills[$i])) {
            $mark = "x"
        }

        Write-Host "  [$mark] [$($i + 1)] $($availableSkills[$i])"
    }

    Write-Host ""
    Write-Host "Enter skill numbers separated by commas."
    Write-Host "Press ENTER to keep the recommended list."
    Write-Host ""

    $selection = Read-Host "Skill selection"

    if (-not [string]::IsNullOrWhiteSpace($selection)) {

        $newSkills = New-Object System.Collections.Generic.List[string]

        $numbers = $selection -split ","

        foreach ($rawNumber in $numbers) {

            $number = 0

            if ([int]::TryParse($rawNumber.Trim(), [ref]$number)) {

                if ($number -ge 1 -and $number -le $availableSkills.Count) {

                    Add-Unique `
                        $newSkills `
                        $availableSkills[$number - 1]
                }
            }
        }

        # Always keep the profile + planner.
        Add-Unique $newSkills "project-profile"
        Add-Unique $newSkills "feature-planner"

        if ($mode -eq "mode-b" -or $mode -eq "both") {
            Add-Unique $newSkills "mode-b"
        }

        if ($mode -eq "mode-c" -or $mode -eq "both") {
            Add-Unique $newSkills "mode-c"
        }

        $skills = $newSkills
    }
}

# ------------------------------------------------------------
# Create project directories
# ------------------------------------------------------------

New-Item -ItemType Directory ".agents\skills" -Force | Out-Null
New-Item -ItemType Directory ".agents\rules" -Force | Out-Null
New-Item -ItemType Directory ".project" -Force | Out-Null

# ------------------------------------------------------------
# Copy selected skills
# ------------------------------------------------------------

$masterSkillsPath = Join-Path $PSScriptRoot "..\.agents\skills"

Write-Host ""
Write-Host "===================================================="
Write-Host "     INSTALLING SELECTED SKILLS"
Write-Host "===================================================="
Write-Host ""

foreach ($skill in $skills) {

    $source = Join-Path $masterSkillsPath $skill
    $destination = Join-Path ".agents\skills" $skill

    if (Test-Path $source) {

        Write-Host "[OK] $skill"

        Copy-Item `
            -Path $source `
            -Destination $destination `
            -Recurse `
            -Force
    }
    else {
        Write-Host "[SKIP] $skill - not found in master library" -ForegroundColor Yellow
    }
}

# ------------------------------------------------------------
# Project profile
# ------------------------------------------------------------

$mobileFramework = "none"

if ($frontend -eq "flutter") {
    $mobileFramework = "flutter"
}

$cache = "none"

if ($database -ne "none") {
    $cache = "redis"
}

$profilePath = ".project\project-profile.yaml"

$profile = @"
project:
  name: "$projectName"
  type: $projectType

engineering:
  quality: $quality
  philosophy: pragmatic-clean
  scalability: $scalability
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

mobile:
  framework: $mobileFramework
  language: dart

database:
  primary: $database
  secondary: []
  cache: $cache

infrastructure:
  hosting: ""
  containerization: ""
  cdn_dns: ""
  ci_cd: github-actions
  monitoring: ""

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
# Final summary
# ------------------------------------------------------------

Write-Host ""
Write-Host "===================================================="
Write-Host "     SETUP COMPLETE"
Write-Host "===================================================="
Write-Host ""

Write-Host "Project:"
Write-Host "  $projectName"
Write-Host ""

Write-Host "Type:"
Write-Host "  $projectType"
Write-Host ""

Write-Host "Stack:"
Write-Host "  Frontend : $frontend"
Write-Host "  Backend  : $backend"
Write-Host "  Database : $database"
Write-Host ""

Write-Host "UI:"
Write-Host "  Style       : $uiStyle"
Write-Host "  Accessibility: strict"
Write-Host "  Visual QA   : required"
Write-Host ""

Write-Host "Skills installed:"
foreach ($skill in $skills) {
    Write-Host "  [x] $skill"
}

Write-Host ""
Write-Host "Generated:"
Write-Host "  .project\project-profile.yaml"
Write-Host "  .agents\skills\"
Write-Host ""

Write-Host "Open this project in Antigravity."
Write-Host ""
