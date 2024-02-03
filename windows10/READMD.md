# Windows 10 quick setup script

Only some app can be install with just script(like ubuntu just one line of ```apt install``` and job down). So most of the time you still need to click "next" on pop up windows manually.
At least this will save your time on finding the resources.

First create a working directory, and download script to there.

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

Other useful apps are like:
* TreeSize
* CeystalDiskinfo
* Diskgenius
