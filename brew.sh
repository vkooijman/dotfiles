#!/bin/bash

############################################################
# Install Homebrew, brew formulae and brew casks (brew.sh) #
############################################################

# Source: http://redsymbol.net/articles/unofficial-bash-strict-mode/
set -euo pipefail
IFS=$'\n\t'

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until `brew.sh` has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Install Homebrew if not available on the system
if ! hash brew 2>/dev/null; then
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
    brew update     # Update Homebrew to make sure we are on the latest version
    brew upgrade	# Update any already installed brew packages
fi

# Tap third-party repositories
brew tap caskroom/cask
brew tap caskroom/fonts
brew tap caskroom/drivers
brew tap caskroom/versions

# Install formulae
readonly FORMULAE=(
    "git"
    "git-flow"
    "wget"
    "mas"
    "shellcheck"
    "zsh"
    "zsh-completions"
    "zsh-syntax-highlighting"
    "binutils"
    "coreutils"
    "watch"
    "tree"
    "rename"
    "httpd"
)

for formula in "${FORMULAE[@]}"; do
    brew install "${formula}"
done

# Install casks (third-party apps)
readonly CASKS=(
    "google-chrome"
    "firefox"
    "microsoft-office"
    "fantastical"
    "1password"
    "dropbox"
    "transmit"
    "vlc"
    "appcleaner"
    "beamer"
    "macpass"
    "vmware-fusion8"
    "spotify"
    "spotify-notifications"
    "whatsapp"
    "skype"
    "dash"
    "iterm2"
    "paw"
    "hipchat"
    "sourcetree"
    "visual-studio-code"
    "java"
    "java8"
    "jd-gui"
    "intellij-idea"
    "datagrip"
    "phpstorm"
    "pycharm"
    "font-source-code-pro"
    "font-inconsolata-g-for-powerline"
    "transmission"
    "apache-directory-studio"
    "docker"
    "slack"
    "staruml"
    "logitech-options"
    "nzbvortex"
    "mysqlworkbench"
    "toggl"
)

for cask in "${CASKS[@]}"; do
    brew cask install "${cask}"
done

brew install findutils --with-default-names # brew doesn't like the argument within a string up top
brew install maven # can only be installed after cask java has been installed

brew services start httpd # run httpd as a service

# Cleanup
brew cleanup
brew cask cleanup

# Allow and change to brew installed `zsh` as shell
if ! fgrep -q '/usr/local/bin/zsh' /etc/shells; then
  echo '/usr/local/bin/zsh' | sudo tee -a /etc/shells;
  chsh -s /usr/local/bin/zsh;
fi;

echo ""
echo "Installation of brew, formulae and casks is done."
echo ""
echo "Remember to manually install Norton Security, Royal TSX and reboot for Logitech Options."
echo ""
echo "oh-my-zsh will now be installed and will switch shell"
echo ""

# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
