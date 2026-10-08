@echo off

echo.
echo ============================================================
echo  Iguana Installation
echo ============================================================
echo.

call 0-git_setup.bat || goto :error
call a-Configure.bat || goto :error
call b-GetIguana.bat || goto :error
call c-iguana_service.bat || goto :error
call d-CopyVmds.bat || goto :error
call e-IguanaMainRepo_createIfNeeded.bat || goto :error
call f-IguanaConfiguration_extract.bat || goto :error
call g-IguanaConfiguration_alter.bat || goto :error
call h-IguanaConfiguration_insert.bat || goto :error
call j-StartService.bat || goto :error

echo.
echo ============================================================
echo  Iguana installation completed (hopefully successfully!)
echo ============================================================
echo.
exit /b 0

:error
echo.
echo ============================================================
echo  ERROR: Iguana installation failed.
echo ============================================================
echo.
exit /b 1
