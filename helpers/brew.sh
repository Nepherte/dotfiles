#!/usr/bin/env zsh

. "${DOTFILES:-~/.dotfiles}/helpers/cmd.sh"
. "${DOTFILES:-~/.dotfiles}/helpers/echos.sh"
. "${DOTFILES:-~/.dotfiles}/helpers/io.sh"
. "${DOTFILES:-~/.dotfiles}/helpers/os.sh"

# Returns the location of Homebrew or one of its formulae.
#
# When no argument is provided, the location (actual or expected) of Homebrew is
# returned. The returned value is as per the official docs (ie. brew shellenv).
#
# When a formula is provided as an argument, the location (actual or expected)
# of that formula is returned. See also paragraph above.
#
# Globals:
#   $HOMEBREW_PREFIX - the homebrew prefix (optional)
# Arguments:
#   $1 - the formula (optional)
brew_prefix() {
  local brew_prefix;

  if [[ -v HOMEBREW_PREFIX ]]; then
    brew_prefix="${HOMEBREW_PREFIX}";
  elif on_arm; then
    brew_prefix="/opt/homebrew"
  else
    brew_prefix="/usr/local"
  fi

  if [[ -v 1 ]]; then
    brew_prefix="${brew_prefix}/opt/${1}"
  fi

  echo "${brew_prefix}"
}

# Installs Homebrew (if missing) and updates it to the latest version. Assumes
# that the Command Line Tools are installed. See install_command_line_tools.sh
#
# Globals:
#   None
# Arguments:
#   None
install_brew() {
  if ! file_exists "$(_brew_bin)"; then
    curl -s -o /tmp/homebrew-install.sh https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh
    eval_cmd "Install Homebrew" "NONINTERACTIVE=1 /bin/bash /tmp/homebrew-install.sh"
  else
    eval_cmd "Update Homebrew" "$(_brew_bin) update"
  fi
}

# Adds the specified package repository ("tap") to Homebrew.
#
# Globals:
#   None
# Arguments:
#   $1 - the package repository to add
tap() {
  local name="Tap $1"
  eval_cmd "$name" "$(_brew_bin) tap $1"
}

# Installs the specified source package ("formula") from Homebrew (if missing).
#
# Globals:
#   None
# Arguments:
#   $1 - the name of the package to install
formula() {
  local name="Install $1"

  if ! _formula_installed "$1"; then
    eval_cmd "$name" "$(_brew_bin) install --formula $1"
  else
    print_ok "$name"
  fi
}

# Installs the specified binary package ("cask") from Homebrew (if missing).
# Assumes that Rosetta 2 installed (if needed). See install_rosetta.sh
#
# Globals:
#   None
# Arguments:
#   $1 - the name of the package to install
cask() {
  local name="Install $1"

  if ! _cask_installed "$1"; then
    eval_cmd "$name" "$(_brew_bin) install --cask --adopt $1"
  else
    print_ok "$name"
  fi
}

# Returns the expected location of the brew command.
#
# Globals:
#   None
# Arguments:
#   None
_brew_bin() {
  echo "$(brew_prefix)/bin/brew"
}

# Checks if the specified source package ("formula") is installed.
#
# Globals:
#   None
# Arguments:
#   - $1: the name of the package to check
# Returns:
#   0 if the formula is installed, 1 otherwise
_formula_installed() {
  $(_brew_bin) list --formula "$1" &> /dev/null
}

# Checks if the specified binary package ("cask") is installed.
#
# Globals:
#   None
# Arguments:
#   $1 - the name of the package to check
# Returns:
#   0 if the cask is installed, 1 otherwise
_cask_installed() {
  $(_brew_bin) list --cask "$1" &> /dev/null
}
