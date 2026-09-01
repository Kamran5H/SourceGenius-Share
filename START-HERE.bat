@echo off
title Source Genius - Brand Reader
cd /d "%~dp0scraper"

echo ============================================
echo   Source Genius - starting the brand reader
echo ============================================
echo.

where node >nul 2>nul
if errorlevel 1 (
  echo [X] Node.js is not installed.
  echo.
  echo     Install the LTS build from https://nodejs.org
  echo     then run this file again.
  echo.
  pause
  exit /b 1
)

reg query "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\App Paths\chrome.exe" >nul 2>nul
if errorlevel 1 (
  reg query "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\App Paths\chrome.exe" >nul 2>nul
  if errorlevel 1 (
    echo [!] Google Chrome was not found in the registry.
    echo     The reader drives real Chrome - install it from
    echo     https://www.google.com/chrome if the reader fails to start.
    echo.
  )
)

if not exist "node_modules\playwright" (
  echo Installing dependencies, one time only. This needs internet...
  call npm install
  if errorlevel 1 (
    echo.
    echo [X] npm install failed. Check your internet connection and retry.
    pause
    exit /b 1
  )
  echo.
)

echo Reader starting on http://127.0.0.1:3000
echo Leave THIS WINDOW OPEN while you work. Closing it stops the reader.
echo.

:loop
node server.js
echo.
echo Reader stopped or crashed. Restarting in 2 seconds... (Ctrl+C to quit)
timeout /t 2 >nul
goto loop
