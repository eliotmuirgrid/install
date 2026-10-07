call "%~dp0a-Configure.bat" || exit /b 1

net start %IGUANA_SERVICE_NAME%