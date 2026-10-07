call "%~dp0config_edit.bat" || exit /b 1

@echo on

copy /Y "%IGUANA_APP_DIR%\ack_verify.vmd" . || exit /b 1
copy /Y "%IGUANA_APP_DIR%\autoack.vmd" . || exit /b 1
copy /Y "%IGUANA_APP_DIR%\autonack.vmd" . || exit /b 1
