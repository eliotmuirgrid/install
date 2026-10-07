curl.exe -L -o ..\iguana.zip "https://raw.githubusercontent.com/eliotmuirgrid/downloads/main/iguana_6_2_0_windows_x64_noinstaller.zip" || exit /b 1

mkdir ..\iguana 2>nul
tar.exe -xf ..\iguana.zip -C ..\iguana --strip-components=1 || exit /b 1
