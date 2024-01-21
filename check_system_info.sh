# --------------------------------------------------
mkdir sys_info

lsb_release -a >> sys_info/0.sys_overview.txt

lscpu >> sys_info/1.cpu_info.txt

lsblk >> sys_info/2.blk_info.txt

df -h >> sys_info/3.os_blk_info.txt

free  >> sys_info/4.memory_info.txt

xrandr >> sys_info/5.display_info.txt

nvidia-smi >> sys_info/6.graphic_info.txt
