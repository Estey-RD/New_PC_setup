# --------------------------------------------------
# To be notice
# There are some softwares are most convenient ot download directly from the website
# Such as 
# Chrome
# https://www.google.com/chrome/
# Vscode
# https://code.visualstudio.com/download
# Anaconda
#	download:
# https://www.anaconda.com/
# 	manual:
# https://docs.anaconda.com/free/anaconda/install/linux/

# --------------------------------------------------
# update all package first
sudo apt update && sudo apt full-upgrade

# --------------------------------------------------
# build-essential
# This include:
# 	libc6-dev
# 	gcc
# 	g++
# 	make
# 	dpkg-dev
sudo apt install build-essential

# --------------------------------------------------
# git module
sudo apt-get install git-all

# --------------------------------------------------
# apache2 module
sudo apt-get install apache2

# --------------------------------------------------
# openssh-server module
sudo apt-get install openssh-server

# --------------------------------------------------
# Firewall setting
sudo apt-get install ufw
sudo ufw enable
sudo ufw allow ssh 

# --------------------------------------------------
# htop module
sudo snap install htop

# --------------------------------------------------
# neofetch module
sudo apt install neofetch

# --------------------------------------------------
# powertop module， power monitor software, $ powertop to use
sudo apt install powertop

# --------------------------------------------------
# python3 
sudo apt install python3

# --------------------------------------------------
# timeshift (restore point software)
sudo apt install timeshift
# create a snapshot 
sudo timeshift --create

# --------------------------------------------------
# anaconda 
#  Prerequisites pack:
sudo apt-get install libgl1-mesa-glx libegl1-mesa libxrandr2 libxrandr2 libxss1 libxcursor1 libxcomposite1 libasound2 libxi6 libxtst6
#  installer package
wget https://repo.anaconda.com/archive/Anaconda3-2023.09-0-Linux-x86_64.sh
bash Anaconda3-2023.09-0-Linux-x86_64.sh -b
rm -rf Anaconda3-2023.09-0-Linux-x86_64.sh

# --------------------------------------------------
# Vscode
wget -O vscode.deb "https://code.visualstudio.com/sha/download?build=stable&os=linux-deb-x64"
sudo dpkg -i vscode.deb
rm vscode.deb

# --------------------------------------------------
# Nvidia utilis
# driver needs to be install manually
#sudo apt install nvidia-driver-525 nvidia-dkms-525
# Use this to open NV gui
#nvidia-settings
# --------------------------------------------------
# Nvidia Cuda driver
#sudo apt install nvidia-cuda-toolkit
# Use this to check cuda version
#nvcc --version
# --------------------------------------------------
# 昨天做到这里
# https://developer.nvidia.com/cuda-downloads?target_os=Linux&target_arch=x86_64&Distribution=Ubuntu&target_version=22.04&target_type=deb_local
