#!/usr/bin/env zsh

# This is a template which illustrates how the included scripts can be used
# to symlink config files. For real-world examples, check the various branches.

DOTFILES="${0:A:h}"

. "${DOTFILES}/helpers/echos.sh"
. "${DOTFILES}/helpers/config.sh"

header "Configurations"
