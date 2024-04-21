#!/usr/bin/env zsh

. "${DOTFILES:-~/.dotfiles}/helpers/cmd.sh"
. "${DOTFILES:-~/.dotfiles}/helpers/echos.sh"
. "${DOTFILES:-~/.dotfiles}/helpers/io.sh"

# Clones (or update) a git repo into a destination directory.
#
# Globals:
#   None
# Arguments:
#   $1 - the git repo to retrieve (clone or pull)
#   $2 - the directory in which to store the git repo
git() {
  local target_dir="$2"

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

  # Clone or update the git repo to the destination directory.
  if dir_exists "$target_dir/.git"; then
    eval_cmd "Update $1" "git -C $target_dir pull"
  else
    eval_cmd "Clone $1" "/bin/bash -c \"git clone ${1} ${target_dir}\""
  fi
}
