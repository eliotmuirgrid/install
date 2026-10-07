@echo off

if "%~1"=="" (
    echo Usage: extract_config ^<path-to-IguanaMainRepo^>
    exit /b 1
)

git --git-dir="%~1" show HEAD:IguanaConfiguration.xml > IguanaConfiguration.xml || exit /b 1
