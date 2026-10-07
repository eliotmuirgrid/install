@echo off

if exist "..\Iguana\iguana.exe" (
    echo Iguana is already installed - skipping download.
    exit /b 0
)

echo Downloading Iguana...

curl.exe -L -o ..\iguana.zip "https://raw.githubusercontent.com/eliotmuirgrid/downloads/main/iguana_6_2_0_windows_x64_noinstaller.zip" || exit /b 1

mkdir ..\Iguana 2>nul

echo Extracting Iguana...

tar.exe -xf ..\iguana.zip -C ..\Iguana --strip-components=1 || exit /b 1

echo Iguana installed successfully.
