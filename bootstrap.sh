#!/bin/bash

##########################################################
# Run all installation and configuration scripts at once #
##########################################################

# Source: http://redsymbol.net/articles/unofficial-bash-strict-mode/
set -euo pipefail
IFS=$'\n\t'

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until `brew.sh` has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Get latest version
git pull origin master

# Run scripts
source ./brew.sh
source ./app_store.sh

# Run configuration
readonly SOURCES=(
    ".macos"
    ".httpd"
    ".iterm2"
    ".sourcetree"
)

for source in "${SOURCES[@]}"; do
    source ./${source}
done

# Deploy configuration
cp ./preferences/com.hegenberg.BetterSnapTool.plist ~/Library/Preferences/com.hegenberg.BetterSnapTool.plist