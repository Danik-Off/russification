# Applies the Russian localization overlay to this DawnCraft instance.
# Run:  powershell -ExecutionPolicy Bypass -File apply.ps1
# (ASCII-only on purpose so Windows PowerShell 5.1 parses it regardless of encoding.)

$ErrorActionPreference = "Stop"
$here     = Split-Path -Parent $MyInvocation.MyCommand.Path
$instance = Split-Path -Parent $here            # .../DawnCraft - Echoes of Legends
$mc       = Join-Path $instance "minecraft"

Write-Host "Instance: $instance"

# 0) Safety check: refuse to deploy structurally broken .snbt files.
#    A corrupted quest file (unbalanced { } or [ ]) breaks the whole quest book,
#    so validate every .snbt under config\ BEFORE copying anything.
$bad = @()
Get-ChildItem -Path (Join-Path $here "config") -Recurse -Filter *.snbt -ErrorAction SilentlyContinue | ForEach-Object {
    $t = [System.IO.File]::ReadAllText($_.FullName)
    $ob = ([regex]::Matches($t, '\{')).Count; $cb = ([regex]::Matches($t, '\}')).Count
    $os = ([regex]::Matches($t, '\[')).Count; $cs = ([regex]::Matches($t, '\]')).Count
    if ($ob -ne $cb -or $os -ne $cs) {
        $bad += "$($_.Name)  {$ob/$cb} [$os/$cs]"
    }
}
if ($bad.Count -gt 0) {
    Write-Host "[ABORT] Broken .snbt files found - NOTHING was copied:" -ForegroundColor Red
    $bad | ForEach-Object { Write-Host "        $_" -ForegroundColor Red }
    Write-Host "        Fix them (restore from minecraft\defaultconfigs\) and re-run."
    exit 1
}

# 1) Resource pack with mod translations
$packSrc = Join-Path $here "resourcepacks\RU_DawnCraft"
$packDst = Join-Path $mc   "resourcepacks\RU_DawnCraft"
if (Test-Path $packSrc) {
    if (Test-Path $packDst) { Remove-Item $packDst -Recurse -Force }
    Copy-Item $packSrc $packDst -Recurse -Force
    Write-Host "[OK] Resource pack -> resourcepacks\RU_DawnCraft"
    Write-Host "     Enable it in-game: Options -> Resource Packs (put it ABOVE DawnCraft_Resources)."
}

# 2) Config-based translations (quests, DC-Classes, FancyMenu menus).
#    Mirrors russification\config\* into minecraft\config\* (merge, overwrite).
$cfgSrc = Join-Path $here "config"
$cfgDst = Join-Path $mc   "config"
if (Test-Path $cfgSrc) {
    Copy-Item (Join-Path $cfgSrc "*") $cfgDst -Recurse -Force
    Write-Host "[OK] Config translations -> config\ (ftbquests, dcclasses, fancymenu)"
}

Write-Host ""
Write-Host "NOTE: instance metadata (instance.cfg name, flame\manifest.json *_ru fields)"
Write-Host "      is per-install - see the metadata\ folder if cloning to another copy."
Write-Host "Done. Restart the game."
