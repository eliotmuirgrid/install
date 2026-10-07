call "%~dp0config_edit.bat" || exit /b 1

@echo on

copy /Y "%IGUANA_APP_DIR%*.vmd" %IGUANA_WORKING_DIR% || exit /b 1
