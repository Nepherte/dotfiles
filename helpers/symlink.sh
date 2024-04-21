#!/usr/bin/env zsh

. "${DOTFILES:-~/.dotfiles}/helpers/cmd.sh"
. "${DOTFILES:-~/.dotfiles}/helpers/io.sh"

# Creates a symbolic link to a specified location.
#
# Globals:
#   None
# Arguments:
#   $1 - the path the symbolic link points to
#   $2 - the path under which to store the link
symlink() {
   local target_dir="$(dirname $2)"

   if ! dir_exists "$target_dir"; then
    # Look for the nearest existing directory in the path hierarchy.
    local parent_dir="$(dirname $target_dir)"

    while ! dir_exists "$parent_dir"; do
      parent_dir="$(dirname $parent_dir)"
    done

    # Create the missing directories (use sudo if we don't have write permissions).
    if ! writable "$parent_dir"; then
      eval_cmd "Create directory $target_dir" "sudo mkdir -p $target_dir"
    else
      eval_cmd "Create directory $target_dir" "mkdir -p $target_dir"
    fi
  fi

  # Make the user the owner of the destination directory if needed.
  if ! writable "$target_dir"; then
    eval_cmd "Change ownership $target_dir" "sudo chown ${USER}:staff $target_dir"
  fi

  local desc="Symbolic link for ${2/"$HOME\/"/}"
  eval_cmd "$desc" "ln -sf $1 $2"
}