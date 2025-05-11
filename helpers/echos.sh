#!/usr/bin/env zsh

# Colors and magic characters.
ESC_SEQ="\x1b["
COL_RESET="${ESC_SEQ}39;49;00m"
COL_RED="${ESC_SEQ}31;01m"
COL_GREEN="${ESC_SEQ}32;01m"
COL_MAGENTA="${ESC_SEQ}35;01m"
COL_CYAN="${ESC_SEQ}36;01m"

# Internal state management.
FIRST_HEADER=true
FIRST_SECTION=true
FIRST_COMMENT=true

# Prints a header (level 1).
#
# Globals:
#   None
# Arguments:
#   $1 - the header
header() {
  FIRST_SECTION="true"

  if [ "$FIRST_HEADER" = "true" ]; then
    FIRST_HEADER="false"
  else
    _print_new_line
  fi

  _print_header "$1"
  _print_new_line
}

# Prints a section (level 2).
#
# Globals:
#   None
# Arguments:
#   $1 - the section
section() {
  FIRST_COMMENT="true"

  if [ "$FIRST_SECTION" = "true" ]; then
    FIRST_SECTION="false"
  else
    _print_new_line
  fi

  _print_section "$1"
}

# Prints a comment (level 3).
#
# Globals:
#   None
# Arguments:
#   $1 - the comment
comment() {
  if [ "$FIRST_COMMENT" = "true" ]; then
    FIRST_COMMENT="false"
  else
    _print_new_line
  fi

  _print_comment "$1"
}

# Clears the last line of output.
#
# Globals:
#   None
# Arguments:
#   None
clear_line() {
  printf "\r\033[K"
}

# Clears the last <n> lines of output.
#
# Globals:
#   None
# Arguments:
#   $1 - the number of lines
clear_lines() {
  clear_line
  for _ in $(seq 2 "$1"); do
    tput cuu1
    clear_line
  done
}

# Prints an inline message, prefixed with [running].
#
# Globals:
#   None
# Arguments:
#   $1 - the message to print
print_running_inline() {
  printf "%b[running]%b %s" "$COL_MAGENTA" "$COL_RESET" "$1"
}

# Prints a message, prefixed with [running].
#
# Globals:
#   None
# Arguments:
#   $1 - the message to print
print_running() {
  print_running_inline "$1"
  _print_new_line
}

# Prints a message, prefixed with [ok].
#
# Globals:
#   None
# Arguments:
#   $1 - the message to print
print_ok() {
  printf "%b[ok]%b      %s\n" "$COL_GREEN" "$COL_RESET" "$1"
}

# Prints a message, prefixed with [error].
#
# Globals:
#   None
# Arguments:
#   $1 - the message to print
print_error() {
  printf "%b[error]%b   %s\n%s\n" "$COL_RED" "$COL_RESET" "$1" "$2"
}

# Prints a header.
#
# Globals:
#   None
# Arguments:
#   $1 - the header
_print_header() {
  local col_width=$(tput cols)
  local title_width=${#1}

  local title_prefix_length=$(((col_width-title_width)/2))
  local title_suffix_length=$((col_width-title_width-title_prefix_length))

  printf "%0.s-" $(seq 1 $col_width)
  printf "\n"
  printf "%0.s " $(seq 1 $title_prefix_length)
  printf "$1"
  printf "%0.s " $(seq 1 $title_suffix_length)
  printf "\n"
  printf "%0.s-" $(seq 1 $col_width)
  printf "\n"
}

# Prints a section.
#
# Globals:
#   None
# Arguments:
#   $1 - the section
_print_section() {
  local title_width=${#1}

  printf "$1\n"
  printf "%0.s-" $(seq 1 $title_width)
  printf "\n" "$COL_RESET"
  printf "\n"
}

# Prints a comment.
#
# Globals:
#   None
# Arguments:
#   $1 - the comment
_print_comment() {
  printf "%b# %s " "$COL_CYAN" "$1"
  printf "%b\n" "$COL_RESET"
  printf "\n"
}

# Prints a new line.
#
# Globals:
#   None
# Arguments:
#   None
_print_new_line() {
  printf "\n"
}
