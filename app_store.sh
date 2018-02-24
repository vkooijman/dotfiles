#!/bin/bash

###############################################################
# Install Mac App Store applications using mas (app_store.sh) #
###############################################################

# Source: http://redsymbol.net/articles/unofficial-bash-strict-mode/
set -euo pipefail
IFS=$'\n\t'

# Check for mas availability on the system
if ! hash mas 2>/dev/null; then
    echo "mas is not available. Please install it manually or using the brew.sh script."
    exit 1
fi

readonly APPS=(
    1295203466  # Microsoft Remote Desktop
    417375580   # BetterSnapTool
    918858936   # Airmail 3
    937984704   # Amphetamine
    1026566364  # GoodNotes
    557168941   # Tweetbot
    410628904   # Wunderlist
)

for app in "${APPS[@]}"
do
    mas install "${app}"
done

echo ""
echo "Installation of Mac App Store applications is done."
echo ""