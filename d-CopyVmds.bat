call "%~dp0a-Configure.bat" || exit /b 1

@echo on

mkdir -p %IGUANA_WORKING_DIR%
copy /Y "%IGUANA_APP_DIR%*.vmd" %IGUANA_WORKING_DIR% || exit /b 1
