@echo off
setlocal

set "SOURCE=IguanaConfiguration.xml"
set "WORK=_IguanaMainRepo_temp"
set "TARGET=IguanaMainRepo"

if not exist "%SOURCE%" (
    echo ERROR: %SOURCE% not found.
    exit /b 1
)

if exist "%TARGET%" (
    echo ERROR: %TARGET% already exists.
    exit /b 1
)

rem Create temporary working repository
mkdir "%WORK%" || exit /b 1
copy "%SOURCE%" "%WORK%\IguanaConfiguration.xml" >nul || exit /b 1

pushd "%WORK%"

git init || exit /b 1
git add IguanaConfiguration.xml || exit /b 1
git commit -m "Initial Iguana configuration" || exit /b 1

popd

rem Create bare repository from it
git clone --bare "%WORK%" "%TARGET%" || exit /b 1

rem Remove temporary repository
rmdir /s /q "%WORK%"

echo.
echo Created bare repository:
echo   %TARGET%
echo.

endlocal
