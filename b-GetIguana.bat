@echo off

call "%~dp0config_edit.bat" || exit /b 1

if exist "%IGUANA_APP_DIR%iguana.exe" (
    echo Iguana is already installed in %IGUANA_APP_DIR% - skipping download.
    exit /b 0
)

echo Downloading Iguana...

curl.exe -L -o "%TEMP%\iguana.zip" "https://raw.githubusercontent.com/eliotmuirgrid/downloads/main/iguana_6_2_0_windows_x64_noinstaller.zip" || exit /b 1

if not exist "%IGUANA_APP_DIR%" mkdir "%IGUANA_APP_DIR%" || exit /b 1

echo Extracting Iguana into %IGUANA_APP_DIR%...

tar.exe -xf "%TEMP%\iguana.zip" -C "%IGUANA_APP_DIR%" --strip-components=1 || exit /b 1

echo Iguana installed successfully in %IGUANA_APP_DIR%.
