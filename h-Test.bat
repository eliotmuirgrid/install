call "%~dp0a-Configure.bat" || exit /b 1

%IGUANA_APP_DIR%iguana --run --working_dir %IGUANA_WORKING_DIR%
