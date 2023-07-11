#!/usr/bin/env zsh

DOTFILES="${0:A:h}"

. "${DOTFILES}/helpers/echos.sh"
. "${DOTFILES}/helpers/brew.sh"
. "${DOTFILES}/helpers/cmd.sh"
. "${DOTFILES}/helpers/git.sh"
. "${DOTFILES}/helpers/mac.sh"
. "${DOTFILES}/helpers/os.sh"

header "Applications"
ask_for_sudo

##
## Install Prerequisites
##
title "Prerequisites"
install_command_line_tools
install_brew

if on_arm; then
  install_rosetta
fi

##
## Repositories
##
title "Repositories"

comment "Third-party"
tap "bell-sw/liberica"

comment "Oh-my-zsh"
git "https://github.com/ohmyzsh/ohmyzsh.git" "/opt/oh-my-zsh"
git "https://github.com/romkatv/powerlevel10k.git" "/opt/oh-my-zsh/custom/themes/powerlevel10k"

##
## Install packages
##
title "Packages"

# Command Line Tools
comment "Command Line Tools"
formula "coreutils"
formula "tree"

# Shells
comment "Shells"
formula "zsh"
formula "zsh-completion"

# Productivity
comment "Productivity"
cask "alfred"
cask "firefox"
cask "hyper"
cask "rectangle-pro"

# Dependency Management
comment "Dependency Management"
formula "jenv"
formula "nvm"

# Java
comment "Java"
#formula "maven"
cask "liberica-jdk8-full"
cask "liberica-jdk11-full"
cask "liberica-jdk17-full"
cask "liberica-jdk20-full"

# Office
comment "Office"
cask "microsoft-word"
cask "microsoft-excel"
cask "microsoft-powerpoint"
cask "microsoft-outlook"
cask "microsoft-teams"

# Communication
comment "Communication"
cask "whatsapp"

# Peripherals
comment "Peripherals"
cask "via"
cask "logi-options-plus"
cask "logitech-camera-settings"

# Developer Tools
comment "Developer Tools"
formula "git"
cask "httpie"

# Editors
comment "Editors"
cask "visual-studio-code"
cask "intellij-idea"

# Multimedia
comment "Multimedia"
cask "roon"
cask "iina"

# Networking
comment "Networking"
cask "mullvadvpn"
cask "transmission"
cask "transmit"

# Security
comment "Security"
cask "1password"

cask "yubico-authenticator"
cask "yubico-yubikey-manager"