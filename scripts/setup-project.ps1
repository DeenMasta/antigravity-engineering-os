$ErrorActionPreference = "Stop"

$scriptRoot = Split-Path -Parent $MyInvocation.MyCommand.Path
$osRoot = (Resolve-Path (Join-Path $scriptRoot "..")).Path

$masterSkillsPath = Join-Path $osRoot ".agents\skills"
$masterRulesPath  = Join-Path $osRoot ".agents\rules"
$masterAgentsPath = Join-Path $osRoot ".agents\agents"
$registryPath     = Join-Path $osRoot "registry\skills.yaml"

function Ask-Choice {
    param([string]$Question,[string[]]$Options,[int]$Default = 1)
    Write-Host ""; Write-Host $Question
    for ($i=0; $i -lt $Options.Count; $i++) {
        $suffix = if (($i+1) -eq $Default) { " (recommended)" } else { "" }
        Write-Host "  [$($i+1)] $($Options[$i])$suffix"
    }
    while ($true) {
        $answer = Read-Host "Select [$Default]"
        if ([string]::IsNullOrWhiteSpace($answer)) { return $Options[$Default-1] }
        $number = 0
        if ([int]::TryParse($answer,[ref]$number) -and $number -ge 1 -and $number -le $Options.Count) {
            return $Options[$number-1]
        }
        Write-Host "Invalid selection. Enter a number from 1 to $($Options.Count)." -ForegroundColor Yellow
    }
}

function Ask-YesNo {
    param([string]$Question,[bool]$Default=$true)
    $hint = if ($Default) { "Y/n" } else { "y/N" }
    while ($true) {
        $answer = Read-Host "$Question [$hint]"
        if ([string]::IsNullOrWhiteSpace($answer)) { return $Default }
        switch ($answer.Trim().ToLower()) {
            "y" { return $true }; "yes" { return $true }
            "n" { return $false }; "no" { return $false }
            default { Write-Host "Please enter y or n." -ForegroundColor Yellow }
        }
    }
}

function Add-Unique {
    param([System.Collections.Generic.List[string]]$List,[string]$Value)
    if ($Value -and -not $List.Contains($Value)) { [void]$List.Add($Value) }
}

function Get-RegistryRecommendations {
    param([string]$ProjectType)
    $result = [System.Collections.Generic.List[string]]::new()
    if (-not (Test-Path $registryPath)) { return $result }

    $currentSkill = $null
    $inside = $false

    foreach ($line in (Get-Content $registryPath)) {
        if ($line -match '^\s{2}([A-Za-z0-9_-]+):\s*$') {
            $currentSkill = $Matches[1]
            $inside = $false
            continue
        }
        if ($currentSkill -and $line -match '^\s{4}recommended_for:\s*$') {
            $inside = $true
            continue
        }
        if ($inside) {
            if ($line -match '^\s{6}-\s*(.+?)\s*$') {
                $type = $Matches[1].Trim()
                if ($type -eq "all" -or $type -eq $ProjectType) { Add-Unique $result $currentSkill }
                continue
            }
            if ($line -match '^\s{4}\S') { $inside = $false }
        }
    }
    return $result
}

Write-Host ""
Write-Host "===================================================="
Write-Host "     Antigravity Engineering OS - Project Setup"
Write-Host "===================================================="
Write-Host ""

$projectName = Read-Host "Project name"
if ([string]::IsNullOrWhiteSpace($projectName)) { throw "Project name cannot be empty." }

$projectType = Ask-Choice "What are you building?" @(
    "landing-page","corporate-website","saas","internal-business-system",
    "pos","flutter-app","custom-client-app","ai-application"
) 1

$frontend = "none"; $backend = "none"; $database = "none"; $uiStyle = "modern-saas"; $scalability = "moderate"

switch ($projectType) {
    "landing-page" { $frontend="nextjs"; $uiStyle="modern-saas"; $scalability="moderate" }
    "corporate-website" { $frontend="nextjs"; $uiStyle="corporate"; $scalability="moderate" }
    "saas" { $frontend="nextjs"; $backend="laravel"; $database="postgresql"; $uiStyle="modern-saas"; $scalability="high" }
    "internal-business-system" { $frontend="nextjs"; $backend="laravel"; $database="postgresql"; $uiStyle="enterprise"; $scalability="high" }
    "pos" { $frontend="nextjs"; $backend="laravel"; $database="mysql"; $uiStyle="enterprise"; $scalability="high" }
    "flutter-app" { $frontend="flutter"; $backend="laravel"; $database="postgresql"; $uiStyle="mobile-first"; $scalability="moderate" }
    "custom-client-app" { $frontend="nextjs"; $backend="laravel"; $database="postgresql"; $uiStyle="enterprise"; $scalability="high" }
    "ai-application" { $frontend="nextjs"; $backend="nodejs"; $database="postgresql"; $uiStyle="modern-saas"; $scalability="high" }
}

Write-Host ""; Write-Host "===================================================="; Write-Host "     RECOMMENDED PROJECT ARCHITECTURE"; Write-Host "===================================================="
Write-Host "Project Type : $projectType"; Write-Host "Frontend     : $frontend"; Write-Host "Backend      : $backend"; Write-Host "Database     : $database"; Write-Host "UI Style     : $uiStyle"; Write-Host "Scalability  : $scalability"

if (Ask-YesNo "Customize the recommended architecture?" $false) {
    $frontend = Ask-Choice "Frontend" @("nextjs","react","flutter","none") 1
    $backend = Ask-Choice "Backend" @("laravel","nodejs","none") 1
    $database = Ask-Choice "Primary database" @("postgresql","mysql","mongodb","none") 1
    $uiStyle = Ask-Choice "UI/UX style" @("modern-saas","enterprise","corporate","minimal","premium","dashboard","mobile-first","custom") 1
    $scalability = Ask-Choice "Expected scalability" @("low","moderate","high") 2
}

$quality = Ask-Choice "Engineering quality" @("strict","standard") 1
$mode = Ask-Choice "Engineering mode" @("mode-b","mode-c","both") 1

$testingUnit = "recommended"; $testingIntegration = "optional"; $testingE2e = "optional"
if ($projectType -in @("saas","internal-business-system","pos","custom-client-app","ai-application","flutter-app")) {
    $testingUnit="required"; $testingIntegration="required"; $testingE2e="required"
}

$skills = [System.Collections.Generic.List[string]]::new()
Add-Unique $skills "project-profile"

if ($mode -eq "mode-b" -or $mode -eq "both") {
    Add-Unique $skills "mode-b"; Add-Unique $skills "feature-planner"; Add-Unique $skills "architecture-reviewer"; Add-Unique $skills "pre-approval-reviewer"
}
if ($mode -eq "mode-c" -or $mode -eq "both") {
    Add-Unique $skills "mode-c"; Add-Unique $skills "feature-planner"; Add-Unique $skills "architecture-reviewer"; Add-Unique $skills "pre-approval-reviewer"
}
if ($database -ne "none") { Add-Unique $skills "database-architect" }

if ($frontend -eq "nextjs" -or $frontend -eq "react") {
    Add-Unique $skills "ui-ux-pro-max"; Add-Unique $skills "visual-qa"; Add-Unique $skills "web-design-guidelines"; Add-Unique $skills "vercel-react-best-practices"; Add-Unique $skills "playwright-cli"
    if ($projectType -in @("saas","internal-business-system","pos","custom-client-app","ai-application")) { Add-Unique $skills "vercel-composition-patterns" }
}
if ($frontend -eq "flutter") {
    Add-Unique $skills "ui-ux-pro-max"; Add-Unique $skills "flutter-architecture"; Add-Unique $skills "flutter-widget-test"; Add-Unique $skills "flutter-integration-test"; Add-Unique $skills "flutter-responsive"; Add-Unique $skills "flutter-http"; Add-Unique $skills "flutter-routing"; Add-Unique $skills "dart-static-analysis"
}

foreach ($registrySkill in (Get-RegistryRecommendations $projectType)) {
    if (Test-Path (Join-Path $masterSkillsPath $registrySkill)) { Add-Unique $skills $registrySkill }
}

Write-Host ""; Write-Host "===================================================="; Write-Host "     RECOMMENDED SKILLS"; Write-Host "===================================================="
foreach ($skill in $skills) { Write-Host "  [x] $skill" }

if (Ask-YesNo "Do you want to edit the recommended skill list?" $true) {
    $availableSkills = @(Get-ChildItem $masterSkillsPath -Directory | Sort-Object Name | Select-Object -ExpandProperty Name)
    Write-Host ""; Write-Host "Available local skills:"
    for ($i=0; $i -lt $availableSkills.Count; $i++) {
        $mark = if ($skills.Contains($availableSkills[$i])) { "x" } else { " " }
        Write-Host "  [$mark] [$($i+1)] $($availableSkills[$i])"
    }
    $selection = Read-Host "Enter skill numbers separated by commas, or press ENTER to keep recommendations"
    if (-not [string]::IsNullOrWhiteSpace($selection)) {
        $newSkills = [System.Collections.Generic.List[string]]::new()
        foreach ($raw in ($selection -split ",")) {
            $n=0
            if ([int]::TryParse($raw.Trim(),[ref]$n) -and $n -ge 1 -and $n -le $availableSkills.Count) {
                Add-Unique $newSkills $availableSkills[$n-1]
            }
        }
        Add-Unique $newSkills "project-profile"
        if ($mode -eq "mode-b" -or $mode -eq "both") {
            Add-Unique $newSkills "mode-b"; Add-Unique $newSkills "feature-planner"; Add-Unique $newSkills "architecture-reviewer"; Add-Unique $newSkills "pre-approval-reviewer"
        }
        if ($mode -eq "mode-c" -or $mode -eq "both") {
            Add-Unique $newSkills "mode-c"; Add-Unique $newSkills "feature-planner"; Add-Unique $newSkills "architecture-reviewer"; Add-Unique $newSkills "pre-approval-reviewer"
        }
        $skills = $newSkills
    }
}

New-Item -ItemType Directory ".agents\skills" -Force | Out-Null
New-Item -ItemType Directory ".agents\rules" -Force | Out-Null
New-Item -ItemType Directory ".agents\agents" -Force | Out-Null
New-Item -ItemType Directory ".project" -Force | Out-Null

Write-Host ""; Write-Host "===================================================="; Write-Host "     INSTALLING SELECTED SKILLS"; Write-Host "===================================================="
foreach ($skill in $skills) {
    $source = Join-Path $masterSkillsPath $skill
    $destination = Join-Path ".agents\skills" $skill
    if (Test-Path $source) {
        Copy-Item $source $destination -Recurse -Force
        Write-Host "[OK] $skill"
    } else {
        Write-Host "[SKIP] $skill - not found in master library" -ForegroundColor Yellow
    }
}

if (Test-Path $masterRulesPath) {
    Write-Host ""; Write-Host "Installing project rules..."
    Get-ChildItem $masterRulesPath -File -Filter "*.md" | ForEach-Object {
        Copy-Item $_.FullName (Join-Path ".agents\rules" $_.Name) -Force
        Write-Host "[OK] rule: $($_.BaseName)"
    }
}

if ($mode -eq "mode-c" -or $mode -eq "both") {
    Write-Host ""; Write-Host "Installing Mode C agents..."
    $agentNames = @("planner-agent.md","architecture-agent.md","qa-agent.md","security-agent.md","code-review-agent.md","release-agent.md","mode-c-coordinator.md")
    foreach ($agentName in $agentNames) {
        $source = Join-Path $masterAgentsPath $agentName
        $destination = Join-Path ".agents\agents" $agentName
        if (Test-Path $source) {
            Copy-Item $source $destination -Force
            Write-Host "[OK] agent: $agentName"
        } else {
            Write-Host "[SKIP] agent: $agentName - not found in master library" -ForegroundColor Yellow
        }
    }
}

$mobileFramework = if ($frontend -eq "flutter") { "flutter" } else { "none" }
$mobileLanguage = if ($frontend -eq "flutter") { "dart" } else { "none" }
$cache = if ($database -ne "none") { "redis" } else { "none" }
$frontendLanguage = "typescript"
$frontendStyling = "tailwind"
$frontendComponents = "shadcn"

if ($frontend -eq "flutter") {
    $frontendLanguage = "dart"
    $frontendStyling = "flutter"
    $frontendComponents = "flutter-widgets"
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
  language: $frontendLanguage
  styling: $frontendStyling
  components: $frontendComponents
backend:
  framework: $backend
mobile:
  framework: $mobileFramework
  language: $mobileLanguage
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
  unit: $testingUnit
  integration: $testingIntegration
  e2e: $testingE2e
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
  agents: $($mode -ne "mode-b")
  mcp: false
"@

Set-Content $profilePath $profile -Encoding UTF8

Write-Host ""; Write-Host "===================================================="; Write-Host "     SETUP COMPLETE"; Write-Host "===================================================="; Write-Host ""
Write-Host "Project: $projectName"
Write-Host "Type:    $projectType"
Write-Host "Frontend: $frontend"
Write-Host "Backend:  $backend"
Write-Host "Database: $database"
Write-Host "Testing:  unit=$testingUnit integration=$testingIntegration e2e=$testingE2e"
Write-Host ""
Write-Host "Skills installed:"
foreach ($skill in $skills) { Write-Host "  [x] $skill" }
Write-Host ""
Write-Host "Generated: .project\project-profile.yaml, .agents\skills\, .agents\rules\"
if ($mode -eq "mode-c" -or $mode -eq "both") { Write-Host "Generated: .agents\agents\" }
Write-Host ""
Write-Host "Open this project in Antigravity."
Write-Host ""
