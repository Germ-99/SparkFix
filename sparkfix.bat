@echo off
set "filepath=%appdata%\IgniteVR\Spark\settings.json"

echo Checking for settings file...
if not exist "%filepath%" (
    echo ERROR: File not found at %filepath%
    echo.
    echo Press any key to close...
    pause >nul
    exit /b 1
)

echo File found! Modifying...

powershell -Command "try { $json = Get-Content -Raw '%filepath%' | ConvertFrom-Json; $json.discordOAuthRefreshToken = ''; $json | ConvertTo-Json -Depth 100 | Set-Content '%filepath%' } catch { exit 1 }"

if %errorlevel% neq 0 (
    echo.
    echo ERROR: Failed to modify the file
    echo.
    echo Press any key to close...
    pause >nul
    exit /b 1
)

echo.
echo SUCCESS: Open spark!
echo.
echo Press any key to close...
pause >nul
