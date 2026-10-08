@echo off

rem This is the location of an Iguana service we are copying from - comment out this variable
rem declaration if you do not want to copy from another instance.
set "IGUANA_SOURCE=C:\Program Files\iNTERFACEWARE\Iguana\"

set "IGUANA_APP_DIR=C:\Iguana-6.2.0\"
set "IGUANA_HTTP_PORT=6999"
set "IGUANA_WORKING_DIR=C:\IguanaConfig\"
set "IGUANA_LOG_DIR=C:\Iguana\logs\"

rem This is what you use for net stop Iguana62 in the command line and in services window.
set "IGUANA_SERVICE_NAME=Iguana62"

rem This description of the Iguana service in the services window.
set "IGUANA_SERVICE_DESCRIPTION=Iguana 6.2.0 Install"


if not defined IGUANA_SOURCE set "IGUANA_SOURCE=NEW"

echo.
echo ============================================================
echo  Iguana Configuration
echo ============================================================
echo  Copying from          : %IGUANA_SOURCE%
echo  Application directory : %IGUANA_APP_DIR%
echo  HTTP port             : %IGUANA_HTTP_PORT%
echo  Working directory     : %IGUANA_WORKING_DIR%
echo  Log directory         : %IGUANA_LOG_DIR%
echo  Service name          : %IGUANA_SERVICE_NAME%
echo  Service Description   : %IGUANA_SERVICE_DESCRIPTION%

echo ============================================================
echo.
