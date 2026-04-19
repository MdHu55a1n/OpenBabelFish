@echo off
setlocal enabledelayedexpansion

REM --- OPENBABELFISH APPLIANCE LAUNCHER ---
echo [INIT] Starting OpenBabelFish...

set "PYTHONUTF8=1"
set "PIP_NO_WARN_SCRIPT_LOCATION=0"
set "VENV_DIR=venv"
set "VENV_PYTHON=%~dp0%VENV_DIR%\Scripts\python.exe"

REM 0. Check Python
python --version >nul 2>nul
if !errorlevel! neq 0 (
    echo [ERROR] Python not found. Please install Python 3.10+ from https://python.org
    pause
    exit /b 1
)

REM 1. Create Venv if missing
if not exist "%VENV_DIR%" (
    echo [1/5] Workspace: Initializing virtual environment...
    python -m venv "%VENV_DIR%"
)

REM 2. Activate and Setup
echo [2/5] Activation: Entering isolated environment...
call "%VENV_DIR%\Scripts\activate.bat"

REM 2.1 Ensure Core Compatibility (NumPy < 2.0.0, Pillow, etc.)
"%VENV_PYTHON%" -c "import numpy; exit(0 if numpy.__version__.startswith('1.') else 1)" >nul 2>nul
if !errorlevel! neq 0 (
    echo [3/5] Dependencies: Synchronizing core libraries...
    "%VENV_PYTHON%" -m pip install --upgrade pip "setuptools<82" wheel --no-warn-script-location
    "%VENV_PYTHON%" -m pip install "numpy<2.0.0" "Pillow>=9.0.0" "urllib3<2.0.0" --no-warn-script-location
)

REM 3. Ensure the package itself is installed
echo [4/5] Integration: Verifying local package link...
"%VENV_PYTHON%" -m pip show openbabelfish-translate >nul 2>nul
if !errorlevel! neq 0 (
    echo [4/5] Integration: Linking to venv now...
    "%VENV_PYTHON%" -m pip install -e . --no-build-isolation --no-warn-script-location
    if !errorlevel! neq 0 (
        echo [WARNING] Local installation failed. Attempting to run directly...
    )
) else (
    echo [4/5] Integration: Already linked to venv.
)

REM 4. Run
echo [5/5] Launching OpenBabelFish...
echo.

REM Start the CLI. 
REM Since there are no arguments, it will automatically enter the Rich Interactive Shell.
"%VENV_PYTHON%" -m openbabelfish.cli

exit /b 0
