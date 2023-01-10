#!/usr/bin/env zsh

. "${DOTFILES:-~/.dotfiles}/helpers/cmd.sh"
. "${DOTFILES:-~/.dotfiles}/helpers/echos.sh"

# Clones (or update) a git repo into a destination directory.
#
# Globals:
#   None
# Arguments:
#   $1 - the git repo to retrieve (clone or pull)
#   $2 - the directory in which to store the git repo
git() {
  if [ ! -d "$2" ]; then
    # Look for the nearest existing directory in the path hierarchy.
    dir_exists="$(dirname $2)"

    while [ ! -d "$dir_exists" ]; do
      dir_exists="$(dirname $dir_exists)"
    done

    # Create the missing directories (use sudo if we don't have write permissions).
    if [[ ! -w "$dir_exists" ]]; then
      eval_cmd "Create directory $2" "sudo mkdir -p $2"
    else
      eval_cmd "Create directory $2" "mkdir -p $2"
    fi
  fi

  # Make the user the owner of the destination directory if needed. 
  if [[ ! -w "$2" ]]; then
    eval_cmd "Change ownership $2" "sudo chown ${USER}:staff $2"
  fi

  # Clone or update the git repo to the destination directory.
  if [ -d "$2/.git" ]; then
    eval_cmd "Update $1" "git -C $2 pull"
  else
    eval_cmd "Clone $1" "/bin/bash -c \"git clone ${1} ${2}\""
  fi
}
