# Install Iguana Manually Procedure

## 1. Create a working directory

Open **Command Prompt** as Administrator and run:

Do not use Powershell

```cmd
cd %USERPROFILE%
mkdir install
cd install
```

## 2. Download MinGit

```cmd
curl.exe -L -o MinGit.zip "https://github.com/git-for-windows/git/releases/download/v2.56.0.windows.2/MinGit-2.56.0.2-64-bit.zip"
```

## 3. Unpack Git

```cmd
mkdir git && tar.exe -xf MinGit.zip -C git
```

## 4. Put this Git first in the PATH

```cmd
set "PATH=%CD%\git\cmd;%PATH%"
```

Now verify we're using it:

```cmd
where git
git --version
```

The nice part is that **from this point onward the documentation can just say `git`**. We don't need `git\cmd\git.exe` everywhere.

## 5. Download the installation scripts

```cmd
git clone https://github.com/eliotmuirgrid/install.git scripts
```

Then:

```cmd
cd scripts
```

The run 0-git_setup:

```cmd
o-git_setup
```


## How to clean things up on windows in at the command line:

```
rmdir /s /q <dir name>
```

