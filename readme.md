# Controlled upgrade for Windows Iguana 6

This is a series of powershell scripts intended to assist customers do a controlled upgrade of Iguana 6.

To start run either this one line to get a portable git and to clone this repository so you have access to the scripts.

```
curl.exe -L -o MinGit.zip "https://github.com/git-for-windows/git/releases/download/v2.56.0.windows.2/MinGit-2.56.0.2-64-bit.zip"; mkdir git; tar.exe -xf MinGit.zip -C git; .\git\cmd\git.exe clone https://github.com/eliotmuirgrid/install.git
```
