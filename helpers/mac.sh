#!/usr/bin/env zsh

. "${DOTFILES:-~/.dotfiles}/helpers/cmd.sh"
. "${DOTFILES:-~/.dotfiles}/helpers/io.sh"


# Install the Command Line Tools.
#
# Globals:
#   None
# Arguments:
#   None
install_command_line_tools() {
  if ! _command_line_tools_installed; then
    touch /tmp/.com.apple.dt.CommandLineTools.installondemand.in-progress
    local PROD="softwareupdate -l |
      grep -B 1 -E 'Command Line Tools' |
      awk -F'*' '/^ *\\*/ {print \$2}' |
      sed -e 's/^ *Label: //' -e 's/^ *//' |
      sort -V |
      tail -n1"
    eval_cmd "Install Command Line Tools" "softwareupdate -i \"\$(${PROD})\""
    rm /tmp/.com.apple.dt.CommandLineTools.installondemand.in-progress
  fi
}

# Install Rosetta 2.
#
# Globals:
#   None
# Arguments:
#   None
install_rosetta() {
  if [ ! _rosetta_installed ]; then
    eval_cmd "Install Rosetta 2" "/usr/sbin/softwareupdate --install-rosetta --agree-to-license"
  fi
}

# Installs the specified application from the App Store (if missing).
# Assumes that mas is installed and that you're signed in.
#
# Globals:
#   None
# Arguments:
#   $1 - the application id
app() {
  local name="Install $(mas info $1 | head -n 1)"

  if ! _app_installed "$1"; then
    eval_cmd "$name" "mas install $1"
  else
    print_ok "$name"
  fi
}

# Indicates if the Command Line Tools are installed.
#
# Globals:
#   None
# Arguments:
#   None
# Returns:
#   0 if command line tools are installed, 1 otherwise
_command_line_tools_installed() {
  xcode-select -p &> /dev/null
  test $? -eq 0
}

# Indicates if Rosetta 2 is installed.
#
# Globals:
#   None
# Arguments:
#   None
# Returns:
#   0 if rosetta 2 are installed, 1 otherwise
_rosetta_installed() {
  test -d /usr/libexec/rosetta
}

# Checks if the specified application from the app store is installed.
#
# Globals:
#   None
# Arguments:
#   $1 - the application id
# Returns:
#   0 if the application is installed, 1 otherwise
_app_installed() {
  mas list 2>&1 | grep $1 &> /dev/null
}