@echo off

call "%~dp0config_edit.bat" || exit /b 1

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

powershell.exe -NoProfile -Command ^
  "$file = '%CD%\%CONFIG%';" ^
  "[xml]$xml = Get-Content -Raw $file;" ^
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
type %CONFIG%

exit /b 0
