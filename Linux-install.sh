#!/usr/bin/env bash

# Text Color Variables
GREEN='\033[32m'  # Green
YELLOW='\033[33m' # YELLOW
CLEAR='\033[0m'   # Clear color and formatting

# Setup script for setting up a new macos machine
echo -e "${GREEN}Starting Install !${CLEAR}"

## Setup /etc/sudoers for sudo without password prompt
# echo -e "${GREEN}Setup NOPASSWD for %staff ${CLEAR}"
# sudo grep -q '^%staff' /etc/sudoers || sudo sed -i '' 's/^%admin.*/&\n%staff          ALL = (ALL) NOPASSWD: ALL/' /etc/sudoers

## Command Line Tools for Xcode
# echo "Install command line developer tools"
# xcode-select --install
# xcode-select -p &> /dev/null
# if [ $? -ne 0 ]; then
#   echo "Xcode CLI tools not found. Installing them..."
#   touch /tmp/.com.apple.dt.CommandLineTools.installondemand.in-progress;
#   PROD=$(softwareupdate -l |
#     grep "\*.*Command Line" |
#     head -n 1 | awk -F"*" '{print $2}' |
#     sed -e 's/^ *//' |
#     tr -d '\n')
#   softwareupdate -i "$PROD" -v;
# else
#   echo "Xcode CLI tools OK"
# fi

install-dev-tools() {

    ## Homebrew
    echo -e "${YELLOW}Install Homebrew${CLEAR}"
    CI=1
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    brew update

    ## NVM
    echo -e "${YELLOW}Install NVM${CLEAR}"
    brew install nvm

    ## git
    echo -e "${YELLOW}Install GIT${CLEAR}"
    brew install git

    ## yarn
    echo -e "${YELLOW}Install yarn${CLEAR}"
    brew install yarn

    ## Visual Studio Code
    echo -e "${YELLOW}Install Visual Studio Code${CLEAR}"
    brew install visual-studio-code

    ## mas-cli
    ## A simple command line interface for the Mac App Store. Designed for scripting and automation.
    echo -e "${YELLOW}Install mas-cli${CLEAR}"
    brew install mas

    ## ngrok
    echo -e "${YELLOW}Install ngrok${CLEAR}"
    brew install ngrok
}

install-basic-tools() {
    ## Google Chrome
    echo -e "${YELLOW}Install Google Chrome${CLEAR}"
    brew install google-chrome

    ## Line
    echo -e "${YELLOW}Install Line${CLEAR}"
    mas install 539883307
}

install-others() {

    ##Spotify
    echo -e "${YELLOW}Install Spotify${CLEAR}"
    brew install spotify
}

install-all() {
    echo -e "${GREEN}Starting Install dev-tools !${CLEAR}"
    install-dev-tools

    echo -e "${GREEN}Starting Install basic-tools !${CLEAR}"
    install-basic-tools

    echo -e "${GREEN}Starting Install others !${CLEAR}"
    install-others
}

install-all
