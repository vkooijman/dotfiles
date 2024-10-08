#!/bin/bash

############################################################
# macOS system and default applications configuration      #
# Thanks to Mathias Bynens' .macos (https://mths.be/macos) #
# and various other .dotfile blogs and repositories        #
############################################################

# Close any open System Preferences panes
osascript -e 'tell application "System Preferences" to quit'

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until `.macos` has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

##########################################
# System Preferences: General            #
##########################################

# Use dark menu bar and dock
defaults write NSGlobalDomain AppleInterfaceStyle -string "Dark"
# Sidebar icon size: small
defaults write NSGlobalDomain NSTableViewDefaultSizeMode -int 1
# Show scroll bars: Always show scrollbars
defaults write NSGlobalDomain AppleShowScrollBars -string "Always"
# Click in the scroll bar to: Jump to the spot that's clicked
defaults write NSGlobalDomain AppleScrollerPagingBehavior -bool true

##########################################
# System Preferences: Screensaver        #
##########################################

# Never show screensaver
defaults -currentHost write com.apple.screensaver idleTime -int 0

##########################################
# System Preferences: Dock               #
##########################################

# Tilesize
defaults write com.apple.dock tilesize -float 36
# Turn magnification on
defaults write com.apple.dock magnification -bool true
# Magnified tilesize
defaults write com.apple.dock largesize -float 72
# Minimize windows into application icon
defaults write com.apple.dock minimize-to-application -bool true
# Show indicators for open applications
defaults write com.apple.dock show-process-indicators -bool true

##########################################
# System Preferences: Mission Control    #
##########################################

# Disable automatically rearrange Spaces based on most recent use
defaults write com.apple.dock mru-spaces -bool false
# Group windows by application
defaults write com.apple.dock expose-group-apps -bool true
# Dashboard: Off
defaults write com.apple.dashboard dashboard-enabled-state -int 1

##########################################
# System Preferences: Security & Privacy #
##########################################

# Require password immediately after sleep or screen saver begins
defaults write com.apple.screensaver askForPassword -int 1
defaults write com.apple.screensaver askForPasswordDelay -float 0
# Allow apps downloaded from: Anywhere (Note: this disables Gatekeeper completely!)
sudo spctl --master-disable

##########################################
# System Preferences: Notifications      #
##########################################

# Enable Do Not Disturb 'When the display is sleeping'
defaults -currentHost write com.apple.notificationcenterui dndEnabledDisplaySleep -bool true
# Enable Do Not Disturb 'When mirroring to TVs and projectors'
defaults -currentHost write com.apple.notificationcenterui dndMirroring -bool true
# Enable Do Not Disturb between 22:00 and 07:00 (values are number of minutes since 00:00)
defaults -currentHost write com.apple.notificationcenterui dndStart -float 1320
defaults -currentHost write com.apple.notificationcenterui dndEnd -float 420

##########################################
# System Preferences: Keyboard           #
##########################################

# Disable correct spelling automatically
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false
# Disable smart quotes
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false
# Disable smart dashes
defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false
# Set a blazingly fast keyboard repeat rate
defaults write NSGlobalDomain KeyRepeat -int 1
defaults write NSGlobalDomain InitialKeyRepeat -int 10

##########################################
# System Preferences: Mouse              #
##########################################

# Disable Scroll direction: Natural
defaults write NSGlobalDomain com.apple.swipescrolldirection -bool false
# Set Tracking speed
defaults write NSGlobalDomain com.apple.mouse.scaling -float 1.5
# Set Scrolling speed
defaults write NSGlobalDomain com.apple.mouse.scrollwheel.scaling -float 0.5

##########################################
# System Preferences: Trackpad           #
##########################################

# Enable Tap to click
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1

##########################################
# Finder                                 #
##########################################

# Show status bar
defaults write com.apple.finder ShowStatusBar -bool true
# Show path bar
defaults write com.apple.finder ShowPathbar -bool true
# Enable spring loading for directories
defaults write NSGlobalDomain com.apple.springing.enabled -bool true
# Remove the spring loading delay for directories
defaults write NSGlobalDomain com.apple.springing.delay -float 0
# Avoid creating .DS_Store files on network volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
# Enable snap-to-grid for icons on the desktop and in other icon views
/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :FK_StandardViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :StandardViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist
# Use list view in all Finder windows by default
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"
# Show the ~/Library folder
chflags nohidden ~/Library
# Show the /Volumes folder
sudo chflags nohidden /Volumes
# Sort folders on top
defaults write com.apple.finder "_FXSortFoldersFirst" -bool true

##########################################
# Various                                #
##########################################

# Disable shadow in screenshots
defaults write com.apple.screencapture disable-shadow -bool true
# Expand save panel by default
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode2 -bool true
# Expand print panel by default
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint2 -bool true
# Disable the “Are you sure you want to open this application?” dialog
defaults write com.apple.LaunchServices LSQuarantine -bool false
# Never go into computer sleep mode
sudo systemsetup -setcomputersleep Off > /dev/null
# Disable default Apache webserver
sudo apachectl stop
sudo launchctl unload -w /System/Library/LaunchDaemons/org.apache.httpd.plist 2>/dev/null

for app in "Dock" "Finder" "Safari" "SystemUIServer" "NotificationCenter"; do
    killall "${app}" &> /dev/null
done

echo ""
echo "macOS System Configuration is done. Some of these modifications might require a restart."
echo ""
