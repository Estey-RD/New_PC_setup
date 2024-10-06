# Windows 10 quick setup script

Only some apps can be installed with just script(like Ubuntu just one line of ```apt install``` and job down). So most of the time you still need to click "next" on pop-up windows manually.
At least this will save you time in finding the resources.

First, create a working directory, and download the script there.

Use ```Win + S``` , type in ```powershell```, open it with admin mode.

```cd C:\path\to\your\directory```
```ls```
If you see this:
```
Mode                 LastWriteTime         Length Name
----                 -------------         ------ ----
-a----          2/1/2024   2:11 PM           2053 test.ps1
```
That means you are on the right track

``` .\windows_setup.ps1 ``` to start installing

Use this cmd in powershell if encountered permissions issue
```Set-ExecutionPolicy -ExecutionPolicy Unrestricted -Scope CurrentUser```

Activate Windows by using 
https://github.com/massgravel/Microsoft-Activation-Scripts

Other useful apps are like:
* TreeSize
* CrystalDiskinfo
* Diskgenius
* (These apps have no direct download link, hidden by the resource site, such as:"Wait for 5 seconds, download will begin shortly")
