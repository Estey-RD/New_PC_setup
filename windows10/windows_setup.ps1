#Disable progress bar to speed up download speed(50X faster compared to enable it)
$ProgressPreference = 'SilentlyContinue'

function Install-software{
	param(
		[string]$software_name,
		[string]$url,
		[string]$slient
	)

	Write-Host "Start downloading $software_name"
	$Path = $env:TEMP; 
	$Installer = "$software_name.exe"; 
	Invoke-WebRequest "$url" -OutFile $Path\$Installer; 
	write-Host "Download completed";
	if($slient -eq 1){
		Write-Host "Slient install";
		Start-Process -FilePath $Path\$Installer -Args "/silent /install" -Verb RunAs -Wait;}
	elseif($slient -eq 0){
		Write-Host "Not Slient install";
		Start-Process -FilePath $Path\$Installer -Wait;}
	Remove-Item $Path\$Installer;
	write-Host "$software_name Done";
}

function Download-software{
	param(
		[string]$software_name,
		[string]$url,
		[string]$file_type
	)

	Write-Host "Start downloading $software_name"
	$Installer = "$software_name.$file_type"; 
	Invoke-WebRequest "$url" -OutFile $Installer; 
	write-Host "Download completed";
}


Install-software -software_name "Git" 		-url "https://github.com/git-for-windows/git/releases/download/v2.43.0.windows.1/Git-2.43.0-64-bit.exe" -slient 1;
Install-software -software_name "Anaconda" 	-url "https://repo.anaconda.com/archive/Anaconda3-2023.09-0-Windows-x86_64.exe" 			-slient 1;
Install-software -software_name "Steam" 	-url "https://cdn.cloudflare.steamstatic.com/client/installer/SteamSetup.exe" 				-slient 1;
Install-software -software_name "Chrome" 	-url "http://dl.google.com/chrome/install/375.126/chrome_installer.exe" 				-slient 1;
Install-software -software_name "VScode" 	-url "https://code.visualstudio.com/sha/download?build=stable&os=win32-x64-user" 			-slient 1;
Install-software -software_name "VS_studio" 	-url "https://aka.ms/vs/17/release/vs_community.exe" 							-slient 0;


Download-software -software_name "mobaxterm" 	-url "https://download.mobatek.net/2362023122033030/MobaXterm_Installer_v23.6.zip" 			-file_type zip;
Download-software -software_name "winscp" 	-url "https://cdn.winscp.net/files/WinSCP-6.1.2-Setup.exe?secure=L_gmnQlDwXB0QHujO2O65g==,1706845247" 	-file_type exe;
Download-software -software_name "obs" 		-url "https://cdn-fastly.obsproject.com/downloads/OBS-Studio-30.0.2-Full-Installer-x64.exe"		-file_type exe;


$ProgressPreference = 'Continue'
