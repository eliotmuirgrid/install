@echo off

call "%~dp0config_edit.bat" || exit /b 1

echo.
echo Copying Iguana configuration artifacts
echo   From: %IGUANA_APP_DIR%
echo   To:   %CD%
echo.

copy /Y "%IGUANA_APP_DIR%\ack_verify.vmd" . || exit /b 1
copy /Y "%IGUANA_APP_DIR%\autoack.vmd" . || exit /b 1
copy /Y "%IGUANA_APP_DIR%\autonack.vmd" . || exit /b 1

echo.
echo Successfully copied configuration artifacts.
echo.

exit /b 0
