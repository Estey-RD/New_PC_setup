# use git cmd to install some software
git
# Install homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
(echo; echo 'eval "$(/opt/homebrew/bin/brew shellenv)"') >> /Users/estey/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"
brew update
# Install some software
brew install htop
brew install tree
brew install python
brew install zsh
brew install mos
gem install iStats
# Rectangle, windows control plugin software
brew install --cask rectangle
# Install VSocde， iterm2, Chrome
brew install --cask visual-studio-code
brew install --cask iterm2
brew install --cask google-chrome
# Gaming
brew install --cask steam
brew install --cask whisky
brew install --cask zed
# MS Office 
brew install onenote-cli
# Oh my zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
# Anaconda3
curl -O https://repo.anaconda.com/archive/Anaconda3-2021.11-MacOSX-x86_64.sh
bash Anaconda3-2021.11-MacOSX-x86_64.sh -b
echo 'export PATH="/Users/estey/anaconda3/bin:$PATH"' >> ~/.zshrc
source ~/.zshrc
conda update conda -y
conda init zsh
conda config --set auto_activate_base false
rm -rf Anaconda3-2021.11-MacOSX-x86_64.sh


