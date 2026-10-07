@echo off
curl.exe -L -o ..\iguana.zip "https://raw.githubusercontent.com/eliotmuirgrid/downloads/main/iguana_6_2_0_windows_x64_noinstaller.zip" || exit /b 1
tar.exe -xf ..\iguana.zip || exit /b 1
