@echo off

if "%~1"=="" (
    echo Usage: extract_config ^<path-to-working dir^>
    exit /b 1
)

echo "Attempting extraction of IguanaConfiguration.xml"
git --git-dir="%~1\IguanaMainRepo" show HEAD:IguanaConfiguration.xml > IguanaConfiguration.xml || exit /b 1
