#!/bin/bash

# Create the output directory
mkdir -p sys_info

# Set the output file
OUTPUT_FILE="sys_info/sys_info.txt"

# Start with an empty file
> "$OUTPUT_FILE"

# Helper function to add section
add_section() {
    echo "--------------------------------------------------------------" >> "$OUTPUT_FILE"
    echo "$1" >> "$OUTPUT_FILE"
    echo "--------------------------------------------------------------" >> "$OUTPUT_FILE"
    eval "$2" >> "$OUTPUT_FILE"
    echo "" >> "$OUTPUT_FILE"
}

# Collect and append system information
add_section "System Overview" "lsb_release -a"
add_section "CPU Info" "lscpu"
add_section "Block Devices" "lsblk"
add_section "Disk Usage" "df -h"
add_section "Memory Info 1 available RAM size" "free -h -t"
add_section "Memory Info 2 Memory hardware" "sudo dmidecode -t 17"
add_section "Display Info" "xrandr"
add_section "Graphics Info (NVIDIA)" "nvidia-smi"
add_section "Installed Applications" "dpkg --get-selections"

echo "System information collected in: $OUTPUT_FILE"
