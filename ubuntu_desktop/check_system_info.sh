#!/bin/bash

# Create the output directory
mkdir -p sys_info

# Set the output file
OUTPUT_FILE="sys_info/sys_info.txt"

# Start with an empty file
> "$OUTPUT_FILE"

# Helper function to add section
add_section() {
    echo "-------------------------------------------------------------------------------------------------------------" >> "$OUTPUT_FILE"
    echo "$1" >> "$OUTPUT_FILE"
    echo "-------------------------------------------------------------------------------------------------------------" >> "$OUTPUT_FILE"
    eval "$2" >> "$OUTPUT_FILE"
    echo "" >> "$OUTPUT_FILE"
}

# Collect and append system information
add_section "System Overview" "lsb_release -a"
add_section "CPU Info" "lscpu"
add_section "HardDrive Volume" "lsblk -o NAME,SIZE,TYPE,MOUNTPOINT,MODEL"
add_section "Mounted Disk Usage" "df -h"
add_section "NVMe Drive Info" "for dev in /dev/nvme*n1; do echo \"===== \$dev =====\"; sudo smartctl -i \"\$dev\"; echo; done"
add_section "SATA Disk info" "sudo smartctl -i /dev/sdX"
add_section "Memory Info 1 available RAM size" "free -h -t"
add_section "Memory Info 2 Memory hardware" "sudo dmidecode -t 17"
add_section "Display Info" "xrandr"
add_section "Graphics Info (NVIDIA)" "nvidia-smi"
add_section "Internet device overview" "nmcli device status"
# Match network interface names with hardware info
echo "-------------------------------------------------------------------------------------------------------------" >> "$OUTPUT_FILE"
echo "Network Devices Detailed Info" >> "$OUTPUT_FILE"
echo "-------------------------------------------------------------------------------------------------------------" >> "$OUTPUT_FILE"

echo "-------------------------------------------------------------------------------------------------------------" >> "$OUTPUT_FILE"
echo "Detailed Network Interface Summary (interface → vendor/device/PCI address + capacity/width/clock)" >> "$OUTPUT_FILE"
echo "-------------------------------------------------------------------------------------------------------------" >> "$OUTPUT_FILE"

for iface in $(ls /sys/class/net | grep -v lo); do
    echo "$iface" >> "$OUTPUT_FILE"
    
    dev_path=$(readlink -f /sys/class/net/$iface/device 2>/dev/null)
    pci_addr=$(basename "$dev_path" 2>/dev/null)

    if [[ -n "$pci_addr" ]]; then
        lspci -s "$pci_addr" >> "$OUTPUT_FILE"

        width=$(cat "$dev_path"/link_width 2>/dev/null)
        speed=$(cat "$dev_path"/link_speed 2>/dev/null)

        [[ -n "$width" || -n "$speed" ]] && echo "    (Width: ${width:-N/A}, Speed: ${speed:-N/A})" >> "$OUTPUT_FILE"
    else
        echo "    (Not associated with PCI device)" >> "$OUTPUT_FILE"
    fi

    echo "" >> "$OUTPUT_FILE"
done



# Save installed apps separately
echo "-------------------------------------------------------------------------------------------------------------" >> "$OUTPUT_FILE"
echo "Installed Applications: see sys_info/app_list.txt" >> "$OUTPUT_FILE"
echo "-------------------------------------------------------------------------------------------------------------" >> "$OUTPUT_FILE"
dpkg --get-selections > sys_info/app_list.txt
echo "" >> "$OUTPUT_FILE"


echo "System information collected in: $OUTPUT_FILE"




for dev in /dev/nvme*n1; do
  echo "===== $dev ====="
  sudo smartctl -a "$dev" | grep -E "Model Number|Serial Number|Firmware|Percentage Used|Data Units Written|Temperature"
  echo ""
done
