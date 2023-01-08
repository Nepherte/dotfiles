#!/usr/bin/env zsh

# This is a template which illustrates how the included scripts can be used
# to symlink dotfiles. For real-world examples, check the various branches.

. "${0:A:h}"/helpers/echos.sh
. "${0:A:h}"/helpers/config.sh

header "Configurations"

##
## zsh
##
title "zsh"
config zsh/zshrc .zshrc
