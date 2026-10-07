@echo off

if "%~2"=="" (
    echo ERROR: Missing arguments.
    echo.
    echo Usage:
    echo   set_working_dir ^<application-install-directory^> ^<working-directory^>
    exit /b 1
)

set "APP=%~1"
set "WORK=%~2"
set "CONFIG_DIR=%APP%"
set "OUTPUT=%CONFIG_DIR%\iguana_service.hdf"

echo.
echo Configuring Iguana working directory
echo   Application: %APP%
echo   Working dir: %WORK%
echo   Output:      %OUTPUT%
echo.

if not exist "%APP%" (
    echo ERROR: Application directory does not exist:
    echo   %APP%
    exit /b 1
)

if not exist "%CONFIG_DIR%" (
    echo Creating config directory...
    mkdir "%CONFIG_DIR%" || exit /b 1
)

(
echo application{
echo    service_kill_timeout = 500000
echo    service_display_name=iNTERFACEWARE Iguana 2
echo    service_name=Iguana2
echo    service_description=HL7 Integration Engine
echo    command_line=iguana.exe --working_dir "%WORK%"
echo    command_line_unix=./iguana --working_dir "%WORK%"
echo    path_registry_entry_win32 = SYSTEM\CurrentControlSet\Control\Session Manager\Environment
echo }
) > "%OUTPUT%"

if errorlevel 1 (
    echo.
    echo ERROR: Failed to write %OUTPUT%.
    exit /b 1
)

echo Successfully created:
echo   %OUTPUT%
echo.

exit /b 0
