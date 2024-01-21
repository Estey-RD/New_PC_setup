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
sudo apt-get update

# --------------------------------------------------
# git module
sudo apt-get install git-all

# --------------------------------------------------
# htop module
sudo snap install htop

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
# neofetch module
sudo apt install neofetch

# --------------------------------------------------
# powertop module
sudo apt install powertop

# --------------------------------------------------
# python3 
sudo apt install python3

# --------------------------------------------------
# anaconda 
# 	Prerequisites pack:
sudo apt-get install libgl1-mesa-glx libegl1-mesa libxrandr2 libxrandr2 libxss1 libxcursor1 libxcomposite1 libasound2 libxi6 libxtst6
# 	Replace <INSTALLER_VERSION> with the version of the installer file you want to download
# All installers can be found at repo.anaconda.com/archive
#curl -O https://repo.anaconda.com/archive/Anaconda3-<INSTALLER_VERSION>-Linux-x86_64.sh


# --------------------------------------------------
# Nvidia utilis
# driver needs to be install manually
sudo apt install nvidia-driver-525 nvidia-dkms-525
# Use this to open NV gui
#nvidia-settings
# --------------------------------------------------
# Nvidia Cuda driver
sudo apt install nvidia-cuda-toolkit
# Use this to check cuda version
#nvcc --version
# --------------------------------------------------
# 昨天做到这里
# https://developer.nvidia.com/cuda-downloads?target_os=Linux&target_arch=x86_64&Distribution=Ubuntu&target_version=22.04&target_type=deb_local
