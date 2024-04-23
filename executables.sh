#!/usr/bin/env zsh

# This is a template which illustrates how the included scripts can be used
# to symlink executables. For real-world examples, check the various branches.

DOTFILES="${0:A:h}"

. "${DOTFILES}/helpers/echos.sh"
. "${DOTFILES}/helpers/executable.sh"

header "Executables"

##
## Mercurial
##
section "Mercurial"
executable hg/authentication.py authentication.py

##
## IntelliJ
##
section "IntelliJ"
executable intellij/idea idea
