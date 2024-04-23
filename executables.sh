#!/usr/bin/env zsh

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
