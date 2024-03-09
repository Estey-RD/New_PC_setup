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
# Rectangle, windows control plugin software
brew install --cask rectangle
# Install VSocde， iterm2, Chrome and Steam
brew install --cask visual-studio-code
brew install --cask iterm2
brew install --cask google-chrome
brew install --cask steam
