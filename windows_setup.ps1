# Steam
write-Host "Start downloading Steam package";
$Path = $env:TEMP; 
$Installer = "steam_installer.exe"; 
Invoke-WebRequest "https://cdn.cloudflare.steamstatic.com/client/installer/SteamSetup.exe" -OutFile $Path\$Installer; 
Start-Process -FilePath $Path\$Installer -Args "/silent /install" -Verb RunAs -Wait; 
Remove-Item $Path\$Installer;
write-Host Steam Done";

# Chrome
write-Host "Start downloading Chrome package";
$Path = $env:TEMP; 
$Installer = "chrome_installer.exe"; 
Invoke-WebRequest "http://dl.google.com/chrome/install/375.126/chrome_installer.exe" -OutFile $Path\$Installer; 
Start-Process -FilePath $Path\$Installer -Args "/silent /install" -Verb RunAs -Wait; 
Remove-Item $Path\$Installer;
write-Host "Chrome Done";

# VScode
write-Host "Start downloading vscode package";
$Path = $env:TEMP; 
$Installer = "vscode_installer.exe"; 
Invoke-WebRequest "https://code.visualstudio.com/sha/download?build=stable&os=win32-x64-user" -OutFile $Path\$Installer; 
Start-Process -FilePath $Path\$Installer -Args "/silent /install" -Verb RunAs -Wait; 
Remove-Item $Path\$Installer;
write-Host "Vscode Done";


