#!/usr/bin/env zsh

# This is a template which illustrates how the included scripts can be used
# to install applications. For real-world examples, check the various branches.

. "${0:A:h}"/helpers/echos.sh
. "${0:A:h}"/helpers/brew.sh
. "${0:A:h}"/helpers/cmd.sh
. "${0:A:h}"/helpers/git.sh
. "${0:A:h}"/helpers/mac.sh
. "${0:A:h}"/helpers/os.sh

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

comment "Formulae"
tap "homebrew/core"
tap "homebrew/services"

comment "Casks"
tap "homebrew/cask"

##
## Install packages
##
title "Packages"

# Command Line Tools
comment "Command Line Tools"
formula "coreutils"

# Productivity
comment "Productivity"
cask "alfred"
