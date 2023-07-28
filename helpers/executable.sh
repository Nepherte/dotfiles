#!/usr/bin/env zsh

. "${DOTFILES:-~/.dotfiles}/helpers/symlink.sh"

SCRIPT_DIR="${DOTFILES:-~/.dotfiles}/scripts"

# Symlinks a binary file into the user's home directory.
#
# Globals:
#   $HOME - the path to the user's home directory
#   $SCRIPT_DIR - the path to the script directory
# Arguments:
#   $1 - the script to symlink (relative to $SCRIPT_DIR)
executable() {
  local name=$(basename $1)
  symlink "$SCRIPT_DIR/$1" "${HOME}/.bin/$name"
}