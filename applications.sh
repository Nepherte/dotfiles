#!/usr/bin/env zsh

# This is a template which illustrates how the included scripts can be used
# to install applications. For real-world examples, check the various branches.

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
section "Prerequisites"
install_command_line_tools
install_brew

if on_arm; then
  install_rosetta
fi

##
## Repositories
##
section "Repositories"

comment "Formulae"
tap "homebrew/core"
tap "homebrew/services"

comment "Casks"
tap "homebrew/cask"

##
## Install packages
##
section "Packages"

# Command Line Tools
comment "Command Line Tools"
formula "coreutils"

# Productivity
comment "Productivity"
cask "alfred"
