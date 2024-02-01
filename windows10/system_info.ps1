echo model | Out-File -Append -FilePath PC_generic_info.txt
Get-WmiObject -Class Win32_ComputerSystem | Out-File -Append -FilePath PC_generic_info.txt
echo CPU | Out-File -Append -FilePath PC_generic_info.txt
Get-CimInstance Win32_Processor | Select-Object Name, Manufacturer, MaxClockSpeed | Out-File -Append -FilePath PC_generic_info.txt
echo RAM | Out-File -Append -FilePath PC_generic_info.txt
Get-CimInstance Win32_PhysicalMemory | Select-Object Manufacturer, @{Name='Capacity(GB)'; Expression={[math]::Round($_.Capacity / 1GB, 2)}} | Out-File -Append -FilePath PC_generic_info.txt
echo GPU | Out-File -Append -FilePath PC_generic_info.txt
Get-CimInstance Win32_VideoController | Select-Object Caption, AdapterRAM, VideoProcessor | Out-File -Append -FilePath PC_generic_info.txt
echo Harddrive | Out-File -Append -FilePath PC_generic_info.txt
Get-Volume | Out-File -Append -FilePath PC_generic_info.txt
echo Monitor | Out-File -Append -FilePath PC_generic_info.txt
Get-CimInstance -Namespace root/cimv2 -ClassName Win32_DesktopMonitor | Select-Object DeviceID, ScreenWidth, ScreenHeight, PNPDeviceID, Caption, MonitorManufacturer, MonitorType | Out-File -Append -FilePath PC_generic_info.txt


Get-CimInstance Win32_PnPEntity | Where-Object {$_.ConfigManagerErrorCode -eq 0} | Select-Object Name, DeviceID, Manufacturer, Service > device_list.txt


Get-ComputerInfo > detail.txt


echo "Output saved"
ls