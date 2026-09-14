$ErrorActionPreference = "Stop"

$root = (Resolve-Path (Join-Path $PSScriptRoot "..")).Path

$skillsRegistry = Join-Path $root "registry\skills.yaml"
$sourcesRegistry = Join-Path $root "registry\sources.yaml"

Write-Host ""
Write-Host "========================================"
Write-Host " Engineering OS Registry Validation"
Write-Host "========================================"
Write-Host ""

$failed = $false

if (-not (Test-Path $skillsRegistry)) {
    Write-Host "[FAIL] registry\skills.yaml missing" -ForegroundColor Red
    $failed = $true
}
else {
    Write-Host "[OK] registry\skills.yaml"
}

if (-not (Test-Path $sourcesRegistry)) {
    Write-Host "[FAIL] registry\sources.yaml missing" -ForegroundColor Red
    $failed = $true
}
else {
    Write-Host "[OK] registry\sources.yaml"
}

$skillsRoot = Join-Path $root ".agents\skills"

if (-not (Test-Path $skillsRoot)) {
    Write-Host "[FAIL] .agents\skills missing" -ForegroundColor Red
    $failed = $true
}
else {
    Write-Host "[OK] .agents\skills"
}

Write-Host ""

if ($failed) {
    Write-Host "REGISTRY VALIDATION: FAILED" -ForegroundColor Red
    exit 1
}

Write-Host "REGISTRY VALIDATION: PASSED" -ForegroundColor Green