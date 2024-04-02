echo "CPU Model:    " 

sysctl -n machdep.cpu.brand_string

echo "CPU Core:  " 

sysctl -n machdep.cpu.core_count

echo "CPU Thread:  "

sysctl -n machdep.cpu.thread_count

echo "Misc："

system_profiler SPDisplaysDataType SPMemoryDataType SPStorageDataType | grep 'Graphics/Displays:\|Chipset Model:\|VRAM (Total):\|Resolution:\|Memory Slots:\|Size:\|Speed:\|Storage:\|Media Name:\|Medium Type:'
