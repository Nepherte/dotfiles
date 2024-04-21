#!/usr/bin/env zsh

. "${DOTFILES:-~/.dotfiles}/helpers/echos.sh"

# Indicates whether a command exists.
#
# Globals:
#   None
# Arguments:
#   $1 - the command to check
# Returns:
#   0 if the command exists, 1 otherwise
cmd_exists() {
  command -v "$1" > /dev/null 2>&1
}

# Evaluates a command (using eval) while also pretty-printing its status.
#
# Globals:
#   None
# Arguments:
#   $1 - the description of the command to evaluate
#   $2 - the command to evaluate (using eval)
eval_cmd() {
  print_running "$1"

  # Request for sudo privileges if the command calls for it.
  if [[ "$2" == sudo* ]]; then
    ask_for_sudo
  fi

  # Split multiple commands into individual statements.
  local commands=(${(@s:;:)2})

  # Execute each command while showing its last line of output.
  for command in $commands; do
    (eval "$command" 2> /tmp/error-msg; echo "$?" > /tmp/error-code) |
      while IFS= read -r line; do
        clear_line
        printf "%s" "$(echo "$line" | cut -c1-"$(tput cols)")"
      done
  done

  local cmd_status=$(</tmp/error-code)

  # Replace last 2 lines with success or error message.
  clear_lines 2
  if [ "$cmd_status" -ne 0 ]; then
    print_error "$1" "$(</tmp/error-msg)"
  else
    print_ok "$1"
  fi
}

# Requests the user for sudo permissions. Keeps sudo privileges cached until
# the parent script finishes.
#
# Globals:
#   None
# Arguments:
#   None
ask_for_sudo() {
  # See if sudo permissions are cached.
  sudo -nv > /dev/null 2>&1
  local cached=$?

  if [ "$cached" -ne 0 ]; then
    # They are not. Ask user to enter password.
    print_running_inline "Administrator "
    eval "sudo -v"
    clear_lines 2
  fi

  while true; do
    # Prevent cached sudo privileges from timing out until the script finishes.
    sudo -n true; sleep 60; kill -0 "$$" || exit;
  done 2>/dev/null &
}
