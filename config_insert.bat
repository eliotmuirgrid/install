@echo off

if "%~1"=="" (
    echo ERROR: Missing path to Working Dir.
    echo.
    echo Usage:
    echo   save_config ^<path-to-Working Dir^>
    exit /b 1
)

set "REPO=%~1"
set "CONFIG=IguanaConfiguration.xml"
set "TEMP=%TEMP%\iguana_config_%RANDOM%"

echo.
echo Saving Iguana configuration
echo   Repository: %REPO%
echo   Input:      %CD%\%CONFIG%
echo.

if not exist "%CONFIG%" (
    echo ERROR: Cannot find %CONFIG%.
    exit /b 1
)

if not exist "%REPO%\HEAD" (
    echo ERROR: "%REPO%" does not appear to be a Git repository.
    exit /b 1
)

echo Creating temporary working copy...

git clone "%REPO%/IguanaMainRepo" "%TEMP%" || goto :error

echo Copying configuration...

copy /Y "%CONFIG%" "%TEMP%\%CONFIG%" >nul || goto :error

pushd "%TEMP%" || goto :error

echo Committing configuration...

git add "%CONFIG%" || goto :error_popd

git diff --cached --quiet
if not errorlevel 1 (
    echo.
    echo No configuration changes to save.
    popd
    goto :cleanup
)

git commit -m "Update Iguana configuration" || goto :error_popd

echo Pushing configuration to IguanaMainRepo...

git push || goto :error_popd

popd

echo.
echo Successfully saved %CONFIG%.
echo.

goto :cleanup


:error_popd
popd

:error
echo.
echo ERROR: Failed to save %CONFIG%.
echo.
rmdir /S /Q "%TEMP%" 2>nul
exit /b 1


:cleanup
rmdir /S /Q "%TEMP%" 2>nul
exit /b 0
