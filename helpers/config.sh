#!/usr/bin/env zsh

. "${DOTFILES:-~/.dotfiles}/helpers/symlink.sh"

CONFIG_DIR="${DOTFILES:-~/.dotfiles}/configs"

# Symlinks a config file into the user's $HOME directory.
#
# Globals:
#   $HOME - the path to the user's home directory
#   $CONFIG_DIR - the path to the config directory
# Arguments:
#   $1 - the config to symlink (relative to $CONFIG_DIR)
#   $2 - the location to put the symlink (relative to $HOME)
config() {
  symlink "$CONFIG_DIR/$1" "$HOME/$2"
}