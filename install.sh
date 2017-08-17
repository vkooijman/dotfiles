#!/usr/bin/env bash

# Source: http://redsymbol.net/articles/unofficial-bash-strict-mode/
set -euo pipefail
IFS=$'\n\t'

readonly BREWS=(
    "git"
    "git-flow"
    "wget"
    "mas"
    "shellcheck"
    "ruby"
    "postgresql"
    "zsh-syntax-highlighting"
)

readonly CASKS=(
    "google-chrome"
    "firefox"
    "microsoft-office"
    "1password"
    "dropbox"
    "transmit"
    "vlc"
    "appcleaner"
    "beamer"
    "macpass"
    "vmware-fusion"
    "spotify"
    "spotify-notifications"
    "whatsapp"
    "gimp"
    "skype"
    "dash"
    "iterm2"
    "paw"
    "hipchat"
    "sourcetree"
    "visual-studio-code"
    "java"
    "jd-gui"
    "intellij-idea"
    "datagrip"
    "phpstorm"
    "pycharm-ce"
    "font-source-code-pro"
    "docker-toolbox"
)

# Install Homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Install brew formulae
for brew in "${BREWS[@]}"
do
    brew install "${brew}"
done

# Install brew casks
for cask in "${CASKS[@]}"
do
    brew cask install "${cask}"
done

# Install Mac App Store apps using mas
mas install 417375580 #BetterSnapTool
mas install 557168941 #Tweetbot for Twitter
mas install 1026566364 #GoodNotes

# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Enable zsh syntax highlighting
echo "source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ~/.zshrc

brew cleanup
brew cask cleanup