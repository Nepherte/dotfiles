#!/usr/bin/env zsh

# Indicates whether a file exists.
#
# Globals:
#   None
# Arguments:
#   $1 - the file to check
# Returns:
#   0 if the file exists, 1 otherwise
file_exists() {
  test -f "$1"
}

# Indicates whether a directory exists.
#
# Globals:
#   None
# Arguments:
#   $1 - the directory to check
# Returns:
#   0 if the directory exists, 1 otherwise
dir_exists() {
  test -d "$1"
}

# Indicates whether a location is writable.
#
# Globals:
#   None
# Arguments:
#   $1 - the location to check
# Returns:
#   0 if the location is writable, 1 otherwise
writable() {
  test -w "$1"
}