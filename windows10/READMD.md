# Windows 10 quick setup script

## Windows 11 24H2 installing bypass internet:

``` Shift + F10 ```

```
reg add HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\OOBE /v BypassNRO /t REG_DWORD /d 1 /f
shutdown /r /t 0
```

## Quick start
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

## Activate Windows by using 
https://github.com/massgravel/Microsoft-Activation-Scripts

## Nvidia CUDA tool kit 

1. run ```nvidia-smi``` in cmd, check the [CUDA Version] on top right, that would be the upper limit version of your CUDA runtime version
2. https://developer.nvidia.com/cuda-downloads?target_os=Windows&target_arch=x86_64&target_version=11 download and install your version
3. Check successful installment: ```nvcc --version--```
4. https://developer.nvidia.com/rdp/cudnn-archive download the right version(I choose the zip)
5. Extract the file into the directory, normally its: ```C:\Program Files\NVIDIA GPU Computing Toolkit\CUDA\v12.6```
6. Check successful installment: ```cd C:\Program Files\NVIDIA GPU Computing Toolkit\CUDA\v12.6\extras\demo_suite``` then ```bandwidthTest.exe``` ```deviceQuery.exe```



Other useful apps are like:
* TreeSize
* CrystalDiskinfo
* Diskgenius
* (These apps have no direct download link, hidden by the resource site, such as:"Wait for 5 seconds, download will begin shortly")
