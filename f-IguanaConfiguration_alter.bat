@echo off

call "%~dp0a-Configure.bat" || exit /b 1

set "CONFIG=IguanaConfiguration.xml"

echo.
echo Editing Iguana configuration
echo   File          : %CONFIG%
echo   HTTP port     : %IGUANA_HTTP_PORT%
echo   Log directory : %IGUANA_LOG_DIR%
echo.

if not exist "%CONFIG%" (
    echo ERROR: Cannot find %CONFIG%.
    exit /b 1
)

echo Loading XML and applying changes...
echo.

powershell.exe -NoProfile -Command ^
  "$file = '%CD%\%CONFIG%';" ^
  "[xml]$xml = Get-Content -Raw $file;" ^
  "Write-Host '  HTTP port:' $xml.iguana_config.web_config.port '->' '%IGUANA_HTTP_PORT%';" ^
  "Write-Host '  Log dir  :' $xml.iguana_config.log_config.log_directory '->' '%IGUANA_LOG_DIR%';" ^
  "Write-Host '  Index dir:' $xml.iguana_config.log_config.index_directory '->' '%IGUANA_LOG_DIR%index';" ^
  "$xml.iguana_config.web_config.port = '%IGUANA_HTTP_PORT%';" ^
  "$xml.iguana_config.log_config.log_directory = '%IGUANA_LOG_DIR%';" ^
  "$xml.iguana_config.log_config.index_directory = '%IGUANA_LOG_DIR%index';" ^
  "$xml.Save($file)"

if errorlevel 1 (
    echo.
    echo ERROR: Failed to edit %CONFIG%.
    exit /b 1
)

echo.
echo Successfully updated %CONFIG%.
echo.
echo ------------------------------------------------------------
echo Updated configuration:
echo ------------------------------------------------------------
type "%CONFIG%"
echo.
echo ------------------------------------------------------------

exit /b 0
