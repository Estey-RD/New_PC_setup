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
sudo apt update && sudo apt full-upgrade -y

# --------------------------------------------------
# build-essential
# This include:
# 	libc6-dev
# 	gcc
# 	g++
# 	make
# 	dpkg-dev
#	git module
sudo apt install build-essential git-all -y

# --------------------------------------------------
# ubuntu servers module:
# 	apache2, openssh
sudo apt-get install apache2 openssh-server -y

# --------------------------------------------------
# Firewall setting
sudo apt-get install ufw
sudo ufw enable
sudo ufw allow ssh 

# --------------------------------------------------
# system monitor
# 	htop, powertop
sudo snap install htop
sudo apt install powertop

# --------------------------------------------------
# neofetch module
sudo apt install neofetch -y

# --------------------------------------------------
# python3 
sudo apt install python3

# --------------------------------------------------
# anaconda 
#  Prerequisites pack:
sudo apt-get install libgl1-mesa-glx libegl1-mesa libxrandr2 libxrandr2 libxss1 libxcursor1 libxcomposite1 libasound2 libxi6 libxtst6 -y
#  installer package
wget https://repo.anaconda.com/archive/Anaconda3-2023.09-0-Linux-x86_64.sh
bash Anaconda3-2023.09-0-Linux-x86_64.sh -b
export PATH=~/anaconda3/bin:$PATH
rm -rf Anaconda3-2023.09-0-Linux-x86_64.sh

# --------------------------------------------------
# Vscode
wget -O vscode.deb "https://code.visualstudio.com/sha/download?build=stable&os=linux-deb-x64"
sudo dpkg -i vscode.deb
rm vscode.deb

# --------------------------------------------------
# Sublimetext
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo gpg --dearmor -o /usr/share/keyrings/sublimehq-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/sublimehq-archive-keyring.gpg] https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list > /dev/null
sudo apt update
sudo apt install sublime-text

# --------------------------------------------------
# Chrome
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb
sudo apt-get install -f
google-chrome

# --------------------------------------------------
# docker
sudo apt update
sudo apt install -y docker.io

# --------------------------------------------------
# timeshift (restore point software)
sudo apt install timeshift
# create a snapshot 
sudo timeshift --create

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
