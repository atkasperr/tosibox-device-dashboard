@echo off
REM Find the RIS Dashboard folder in the user's profile and run start_dashboard.bat

set "RIS_FOLDER=%USERPROFILE%\RIS Dashboard"
if exist "%RIS_FOLDER%\start_dashboard.bat" (
    cd /d "%RIS_FOLDER%"
    start "" start_dashboard.bat
) else (
    echo RIS Dashboard folder or start_dashboard.bat not found in your user profile.
    pause
)