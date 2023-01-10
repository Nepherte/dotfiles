#!/usr/bin/env zsh

. "${DOTFILES:-~/.dotfiles}/helpers/cmd.sh"
. "${DOTFILES:-~/.dotfiles}/helpers/echos.sh"
. "${DOTFILES:-~/.dotfiles}/helpers/os.sh"

# Installs Homebrew (if missing) and updates it to the latest version. Assumes that the Command Line Tools are installed.
#
# Globals:
#   None
# Arguments:
#   None
install_brew() {
  if ! cmd_exists brew; then
    curl -s -o /tmp/homebrew-install.sh https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh
    eval_cmd "Install Homebrew" "NONINTERACTIVE=1 /bin/bash /tmp/homebrew-install.sh"
    
    if on_arm; then
      eval "$(/opt/homebrew/bin/brew shellenv)"
    else
      eval "$(/usr/local/bin/brew shellenv)"
    fi
  else
    eval_cmd "Update Homebrew" "brew update"
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
  eval_cmd "$name" "brew tap $1"
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
    eval_cmd "$name" "brew install --formula $1"
  else
    print_ok "$name"
  fi
}

# Installs the specified binary package ("cask") from Homebrew (if missing). Assumes that Rosetta 2 installed (for packages that require it).
#
# Globals:
#   None
# Arguments:
#   $1 - the name of the package to install
cask() {
  local name="Install $1"

  if ! _cask_installed "$1"; then
    eval_cmd "$name" "brew install --cask --adopt $1"
  else
    print_ok "$name"
  fi
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
  brew list --formula "$1" &> /dev/null
}

# Check if the specified binary package ("cask") is installed.
#
# Globals:
#   None
# Arguments:
#   $1 - the name of the package to check
# Returns:
#   0 if the cask is installed, 1 otherwise
_cask_installed() {
  brew list --cask "$1" &> /dev/null
}
