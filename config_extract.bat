@echo off

if "%~1"=="" (
    echo Usage: extract_config ^<path-to-IguanaMainRepo^>
    exit /b 1
)

echo "Attempting extraction of IguanaConfiguration.xml"
git --git-dir="%~1" show HEAD:IguanaConfiguration.xml > IguanaConfiguration.xml || exit /b 1
