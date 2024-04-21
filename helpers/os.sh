#!/usr/bin/env zsh

# Indicates whether this script is running on macOS.
#
# Globals:
#   None
# Arguments:
#   None
# Returns:
#   0 if on macos, 1 otherwise
on_mac() {
  _on_os "darwin"
}

# Indicates whether this script is running on arm64.
#
# Globals:
#   None
# Arguments:
#   None
# Returns:
#   0 if on arm, 1 otherwise
on_arm() {
  _on_platform "arm64"
}

# Indicates whether this script is running on a specified operating system.
#
# Globals:
#   None
# Arguments:
#   #1 - the name of the operating system (as per uname -s)
# Returns:
#   0 if on the specified operatying system, 1 otherwise
_on_os() {
  if uname -s | grep -qi "$1"; then
    return 0
  else
    return 1
  fi
}

# Indicates whether this script is running on a specified platform.
#
# Globals:
#   None
# Arguments:
#   $1 - the name of the platform (as per uname -m)
# Returns:
#   0 if on the specified platform, 1 otherwise
_on_platform() {
  if uname -m | grep -qi "$1"; then
    return 0
  else
    return 1
  fi
}

