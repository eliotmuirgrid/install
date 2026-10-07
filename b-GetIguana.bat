@echo off

call "%~dp0a-Configure.bat" || exit /b 1

set "IGUANA_ZIP=%~dp0../iguana.zip"

if exist "%IGUANA_APP_DIR%iguana.exe" (
    echo Iguana already exists in %IGUANA_APP_DIR%
    echo Skipping download.
    exit /b 0
)

echo.
echo Downloading Iguana...

curl.exe -L -o "%IGUANA_ZIP%" "https://raw.githubusercontent.com/eliotmuirgrid/downloads/main/iguana_6_2_0_windows_x64_noinstaller.zip" || exit /b 1

if not exist "%IGUANA_APP_DIR%" (
    echo.
    echo Creating %IGUANA_APP_DIR%
    mkdir "%IGUANA_APP_DIR%" || exit /b 1
)

echo.
echo Extracting Iguana into %IGUANA_APP_DIR%...

tar.exe -xf "%IGUANA_ZIP%" -C "%IGUANA_APP_DIR%" --strip-components=1 || exit /b 1

echo.
echo Removing downloaded ZIP...
del "%IGUANA_ZIP%"

echo.
echo Iguana installed successfully:
echo   %IGUANA_APP_DIR%
echo.

exit /b 0
