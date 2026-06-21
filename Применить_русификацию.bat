@echo off
REM ============================================================
REM  DawnCraft RU - applies the Russian localization overlay.
REM  Double-click this file to apply. ASCII-only on purpose so
REM  cmd.exe never mangles it; Russian output comes from apply.ps1.
REM ============================================================
chcp 65001 >nul
title DawnCraft RU - apply
cd /d "%~dp0"

echo.
echo  This will copy the RU overlay into the game (resource pack + quests + configs).
echo  Source: %~dp0
echo.
choice /c YN /m "Apply now? [Y]es / [N]o"
if errorlevel 2 goto :cancel

echo.
powershell -NoProfile -ExecutionPolicy Bypass -File "%~dp0apply.ps1"
set "RC=%errorlevel%"
echo.
if not "%RC%"=="0" (
    echo  [ERROR] apply.ps1 exited with code %RC% - nothing may have been applied.
) else (
    echo  Done. Enable the "DawnCraft RU" resource pack in-game and restart.
)
echo.
pause
exit /b %RC%

:cancel
echo  Cancelled. Nothing was changed.
echo.
pause
exit /b 0
