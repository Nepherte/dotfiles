#!/usr/bin/env zsh

DOTFILES="${0:A:h}"

. "${DOTFILES}/helpers/echos.sh"
. "${DOTFILES}/helpers/brew.sh"
. "${DOTFILES}/helpers/cmd.sh"
. "${DOTFILES}/helpers/git.sh"
. "${DOTFILES}/helpers/mac.sh"

header "Applications"
ask_for_sudo

##
## Prerequisites
##
section "Prerequisites"
install_command_line_tools
install_brew

##
## Repositories
##
section "Repositories"

comment "Oh-my-zsh"
git "https://github.com/ohmyzsh/ohmyzsh.git" "/opt/oh-my-zsh"
git "https://github.com/qoomon/zsh-lazyload.git" "/opt/oh-my-zsh/custom/plugins/zsh-lazyload"
git "https://github.com/romkatv/powerlevel10k.git" "/opt/oh-my-zsh/custom/themes/powerlevel10k"

##
## Packages
##
section "Packages"

# Command Line Tools
comment "Command Line Tools"
formula "coreutils"
formula "tree"

# Shells
comment "Shells"
formula "zsh"
formula "zsh-completions"

# Productivity
comment "Productivity"
cask "alfred"
cask "firefox"
cask "iterm2"
cask "rectangle-pro"

# Dependency Management
comment "Dependency Management"
formula "jenv"
formula "volta"
formula "pyenv"

# Java
comment "Java"
cask "microsoft-openjdk@11"
cask "microsoft-openjdk@17"
cask "microsoft-openjdk@21"

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
cask "logi-options+"

# Developer Tools
comment "Developer Tools"
formula "git"
cask "docker"
cask "httpie"

# Editors
comment "Editors"
cask "markedit"
cask "intellij-idea"

# Multimedia
comment "Multimedia"
cask "roon"
cask "tidal"

# Networking
comment "Networking"
cask "mullvadvpn"
cask "transmission"
cask "transmit"

# Security
comment "Security"
cask "1password"
cask "yubico-authenticator"