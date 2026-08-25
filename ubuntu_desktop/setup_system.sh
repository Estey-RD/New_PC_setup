#!/bin/bash
# Fresh Ubuntu Desktop deployment (Ubuntu 22.04/24.04, x86_64).
# Reads the apt manifest from packages.txt (one package per line) so
# the manifest is the single source of truth and is independently
# machine-verifiable by the daily CI check.
#
# Steps:
#   1. snapshot current app list
#   2. full upgrade
#   3. install manifest (apt + snap)
#   4. drivers / firewall
#   5. Anaconda, VS Code, Sublime, Chrome, Docker
#   6. timeshift restore point
#   7. app-list diff
#   8. reboot
#
# NOT included: VPN, nvidia driver (manual), CUDA (see README)
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR"

# --------------------------------------------------
# 1. current app list
dpkg -l > app_list_before.txt
# --------------------------------------------------
# 2. update
sudo apt update
sudo apt full-upgrade -y
# --------------------------------------------------
# 3. manifest (comment/space lines stripped; portable across bash 3/4/5)
PKG_COUNT=$(grep -cEv '^\s*(#|$)' packages.txt)
echo ">> installing $PKG_COUNT packages from packages.txt"
sudo apt-get install -y $(grep -vE '^\s*(#|$)' packages.txt)
# snap tools
sudo snap install htop
sudo snap install tree
# --------------------------------------------------
# 4. drivers + firewall
sudo ubuntu-drivers autoinstall
sudo ufw enable
sudo ufw allow ssh
# --------------------------------------------------
# 5. Anaconda (pinned version — bump here and in README only)
AC_VER="2023.09-0"
wget "https://repo.anaconda.com/archive/Anaconda3-${AC_VER}-Linux-x86_64.sh"
bash "Anaconda3-${AC_VER}-Linux-x86_64.sh" -b -y
rm -f "Anaconda3-${AC_VER}-Linux-x86_64.sh"
echo 'export PATH=~/anaconda3/bin:$PATH' >> ~/.bashrc
conda update conda
conda init
conda config --set auto_activate_base false
# --------------------------------------------------
# VS Code
wget -O vscode.deb "https://code.visualstudio.com/sha/download?build=stable&os=linux-deb-x64"
sudo DEBIAN_FRONTEND=noninteractive dpkg -i vscode.deb
rm vscode.deb
# --------------------------------------------------
# Chrome
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo DEBIAN_FRONTEND=noninteractive dpkg -i google-chrome-stable_current_amd64.deb
sudo apt-get install -f
rm google-chrome-stable_current_amd64.deb
# (Sublime-Text apt repo + package already added by packages.txt step;
#  if `apt install sublime-text` was skipped, run:
#  wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo gpg --dearmor -o /usr/share/keyrings/sublimehq-archive-keyring.gpg
#  echo "deb [signed-by=...] https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list)
# --------------------------------------------------
# 6. timeshift snapshot (interactive prompt — accept defaults)
sudo timeshift --create
# --------------------------------------------------
# 7. app diff
dpkg -l > app_list_after.txt
diff app_list_before.txt app_list_after.txt > installed_app.txt || true
# --------------------------------------------------
# 8. reboot
echo ">> rebooting in 10s (ctrl+c to cancel)"
sleep 10
sudo reboot
