#!/usr/bin/env zsh

# This is a template which illustrates how the included scripts can be used
# to install applications. For real-world examples, check the various branches.

DOTFILES="${0:A:h}"

. "${DOTFILES}/helpers/echos.sh"
. "${DOTFILES}/helpers/brew.sh"
. "${DOTFILES}/helpers/cmd.sh"
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

##
## Packages
##
section "Packages"