#!/usr/bin/env zsh

DOTFILES="${0:A:h}"

. "${DOTFILES}/helpers/echos.sh"
. "${DOTFILES}/helpers/executable.sh"

header "Executables"

##
## IntelliJ
##
section "IntelliJ"
executable intellij/idea idea
