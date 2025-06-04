@echo on
cd /d "%~dp0"
echo Checking for Python...
python --version
IF ERRORLEVEL 1 (
    echo Python is not installed. Please install Python 3.9 or newer from https://www.python.org/downloads/
    pause
    exit /b
)

echo Checking for Flask...
pip show flask
IF ERRORLEVEL 1 (
    echo Flask is not installed. Installing Flask now...
    pip install flask
)

echo.
echo ---------------------------------------------
echo The RIS Dashboard server will now start in a new window.
echo.
echo 1. Wait until you see "Running on http://localhost:5000" in the new window.
echo 2. Open your web browser and go to: http://localhost:5000
echo 3. When you are done, return to this window and press any key to stop the server and close both windows.
echo ---------------------------------------------
echo.

REM Start the server in a new Command Prompt window with a unique title
start "RIS_DASHBOARD_SERVER" cmd /k python app.py

REM Open the dashboard in the default web browser
start "" http://localhost:5000

REM Wait for user input
pause

REM Print a large message to push previous output out of view
cls
echo.
echo ************************************************************
echo *                                                          *
echo *   The RIS Dashboard server has been stopped.             *
echo *   You can now close this window.                         *
echo *                                                          *
echo ************************************************************
echo.
REM Print many blank lines to push up any taskkill output
for /l %%i in (1,1,30) do echo.

REM Kill the Flask server window by its title
taskkill /FI "WINDOWTITLE eq RIS_DASHBOARD_SERVER*" /T /F

exit