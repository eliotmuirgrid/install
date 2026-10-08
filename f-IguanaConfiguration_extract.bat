@echo off

call "%~dp0a-Configure.bat" || exit /b 1

echo Attempting extraction of IguanaConfiguration.xml

@echo on
git --git-dir="%IGUANA_WORKING_DIR%IguanaMainRepo" show HEAD:IguanaConfiguration.xml > IguanaConfiguration.xml || exit /b 1
@echo off
