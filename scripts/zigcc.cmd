@echo off
pwsh -NoProfile -NonInteractive -File "%~dp0zigcc.ps1" %*
exit /b %ERRORLEVEL%
