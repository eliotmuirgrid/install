# Controlled upgrade for Windows Iguana 6

This is a series of powershell scripts intended to assist customers do a controlled upgrade of Iguana 6.

To start run either this one line to get a portable git and to clone this repository so you have access to the scripts.

Open command shell

Use cd to your home directory

```
cd C:\Users\<your username>\
```

Then make an install directory and move into it.

```
mkdir install
cd install
```
Then download MinGit - a portable implementation of GIT:

```
curl.exe -L -o MinGit.zip "https://github.com/git-for-windows/git/releases/download/v2.56.0.windows.2/MinGit-2.56.0.2-64-bit.zip"
```

Then unpack it:

```
mkdir git && tar.exe -xf MinGit.zip -C git
```

Now get clone the this install repository so you have the scripts you need:

```
rmdir /S /Q install 2>nul & git\cmd\git.exe clone https://github.com/eliotmuirgrid/install.git && cd install
```
Now you have your install repository with the scripts which makes it easier to do a staged install.


## How to clean things up on windows in at the command line:

```
rmdir /s /q <dir name>
```

