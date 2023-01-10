#!/usr/bin/env zsh

. "${DOTFILES:-~/.dotfiles}/helpers/cmd.sh"

# Creates a symbolic link to a specified location.
#
# Globals:
#   None
# Arguments:
#   $1 - the path the symbolic link points to
#   $2 - the path under which to store the link
symlink() {
   target_dir="$(dirname $2)"

   if [ ! -d "$target_dir" ]; then
    # Look for the nearest existing directory in the path hierarchy.
    existing_dir="$(dirname $target_dir)"

    while [ ! -d "$existing_dir" ]; do
      existing_dir="$(dirname $existing_dir)"
    done

    # Create the missing directories (use sudo if we don't have write permissions).
    if [[ ! -w "$existing_dir" ]]; then
      eval_cmd "Create directory $target_dir" "sudo mkdir -p $target_dir"
    else
      eval_cmd "Create directory $target_dir" "mkdir -p $target_dir"
    fi
  fi

  # Make the user the owner of the destination directory if needed. 
  if [[ ! -w "$target_dir" ]]; then
    eval_cmd "Change ownership $target_dir" "sudo chown ${USER}:staff $target_dir"
  fi

  desc="Symbolic link for ${2/"$HOME\/"/}"
  eval_cmd "$desc" "ln -sf $1 $2"
}