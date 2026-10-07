@echo off

rem ============================================================
rem iNTERFACEWARE Git Setup
rem
rem Expected layout:
rem
rem   git\
rem   scripts\
rem       setup_git.bat
rem
rem ============================================================

set "GIT_HOME=%~dp0..\git"

rem ------------------------------------------------------------
rem Verify Git
rem ------------------------------------------------------------

if not exist "%GIT_HOME%\cmd\git.exe" (
    echo ERROR: Cannot find Git:
    echo   %GIT_HOME%\cmd\git.exe
    exit /b 1
)

rem ------------------------------------------------------------
rem Put our bundled Git first on PATH
rem
rem Do NOT use setlocal here. We want PATH to remain changed
rem for the calling installation script.
rem ------------------------------------------------------------

set "PATH=%GIT_HOME%\cmd;%GIT_HOME%\bin;%PATH%"

echo.
echo Using Git:
where git
git --version || exit /b 1

git config --global core.pager cat

rem ------------------------------------------------------------
rem Identity
rem ------------------------------------------------------------

git config --global user.name "iNTERFACEWARE Setup" || exit /b 1
git config --global user.email "Setup@interfaceware.com" || exit /b 1

rem ------------------------------------------------------------
rem Pull / merge behaviour
rem ------------------------------------------------------------

rem Pull using merge rather than rebase
git config --global pull.rebase false || exit /b 1

rem Allow fast-forward merges where possible
git config --global merge.ff true || exit /b 1

rem ------------------------------------------------------------
rem Windows behaviour
rem ------------------------------------------------------------

rem Convert LF to CRLF on checkout and back to LF on commit
git config --global core.autocrlf true || exit /b 1

rem Support long Windows paths
git config --global core.longpaths true || exit /b 1

rem ------------------------------------------------------------
rem Repository defaults
rem ------------------------------------------------------------

git config --global init.defaultBranch master || exit /b 1

rem Remove stale remote-tracking branches during fetch
git config --global fetch.prune true || exit /b 1

rem Enable normal command-line colours
git config --global color.ui auto || exit /b 1

rem ------------------------------------------------------------
rem Done
rem ------------------------------------------------------------

echo.
echo Git setup complete.
echo.
git config --global --list

exit /b 0
