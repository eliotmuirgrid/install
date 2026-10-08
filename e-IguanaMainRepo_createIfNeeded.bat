@echo off
setlocal

call "%~dp0a-Configure.bat" || exit /b 1

set "SOURCE=IguanaConfiguration.xml"
set "WORK=_IguanaMainRepo_temp"
set "TARGET=%IGUANA_WORKING_DIR%\IguanaMainRepo"

echo.
echo Creating IguanaMainRepo if needed
echo   Working directory : %IGUANA_WORKING_DIR%
echo   Repository        : %TARGET%
echo.

if exist "%IGUANA_SOURCE%\IguanaMainRepo\" (
   xcopy "%IGUANA_SOURCE%\IguanaMainRepo" "%IGUANA_WORKING_DIR%\IguanaMainRepo\" /E /I /Y
   echo Copied %IGUANA_SOURCE%\IguanaMainRepo into %IGUANA_WORKING_DIR%
   exit /b 0
)

rem Create the Iguana configuration/working directory if necessary
if not exist "%IGUANA_WORKING_DIR%" (
    echo Creating working directory:
    echo   %IGUANA_WORKING_DIR%
    mkdir "%IGUANA_WORKING_DIR%" || exit /b 1
)

rem Nothing to do if the repository already exists
if exist "%TARGET%" (
    echo IguanaMainRepo already exists.
    echo Nothing to do.
    exit /b 0
)

if not exist "%SOURCE%" (
    echo ERROR: %SOURCE% not found.
    exit /b 1
)

rem Create temporary working repository
if exist "%WORK%" rmdir /s /q "%WORK%"

mkdir "%WORK%" || exit /b 1
copy "%SOURCE%" "%WORK%\IguanaConfiguration.xml" >nul || exit /b 1

pushd "%WORK%" || exit /b 1

git init || goto :error
git add IguanaConfiguration.xml || goto :error
git commit -m "Initial Iguana configuration" || goto :error

popd

rem Create bare IguanaMainRepo
git clone --bare "%WORK%" "%TARGET%" || exit /b 1

rem Remove temporary repository
rmdir /s /q "%WORK%"

echo.
echo Successfully created:
echo   %TARGET%
echo.

exit /b 0


:error
popd
rmdir /s /q "%WORK%" 2>nul
exit /b 1
