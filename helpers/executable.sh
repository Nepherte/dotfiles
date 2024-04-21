#!/usr/bin/env zsh

. "${DOTFILES:-~/.dotfiles}/helpers/symlink.sh"

EXECUTABLES_DIR="${DOTFILES:-~/.dotfiles}/executables"

# Symlinks an executable file into the user's $HOME/.bin directory.

# Globals:
#   $HOME - the path to the user's home directory
#   $EXECUTABLES_DIR - the path to the executables directory
# Arguments:
#   $1 - the executable to symlink (relative to $EXECUTABLES_DIR)
executable() {
  local name=$(basename $1)
  symlink "$EXECUTABLES_DIR/$1" "${HOME}/.bin/$name"
}