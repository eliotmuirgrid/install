@echo off

call "%~dp0config_edit.bat" || exit /b 1

set "OUTPUT=%IGUANA_APP_DIR%iguana_service.hdf"

echo.
echo Generating Iguana service configuration
echo   Application directory : %IGUANA_APP_DIR%
echo   Working directory     : %IGUANA_WORKING_DIR%
echo   Output                : %OUTPUT%
echo.

if not exist "%IGUANA_APP_DIR%" (
    echo ERROR: Application directory does not exist:
    echo   %IGUANA_APP_DIR%
    exit /b 1
)

(
echo application{
echo    service_kill_timeout = 500000
echo    service_display_name=%IGUANA_SERVICE_DESCRIPTION%
echo    service_name=%IGUANA_SERVICE_NAME%
echo    service_description=HL7 Integration Engine
echo    command_line=iguana.exe --working_dir "%IGUANA_WORKING_DIR%"
echo    command_line_unix=./iguana --working_dir "%IGUANA_WORKING_DIR%"
echo    path_registry_entry_win32 = SYSTEM\CurrentControlSet\Control\Session Manager\Environment
echo }
) > "%OUTPUT%"

if errorlevel 1 (
    echo.
    echo ERROR: Failed to write:
    echo   %OUTPUT%
    exit /b 1
)

echo.
echo Successfully created:
echo   %OUTPUT%
echo.
type %OUTPUT%

exit /b 0
