#!/usr/bin/env zsh

DOTFILES="${0:A:h}"

. "${DOTFILES}/helpers/echos.sh"
. "${DOTFILES}/helpers/config.sh"
. "${DOTFILES}/helpers/symlink.sh"

header "Configurations"

##
## dircolors
##
section "dircolors"
config dircolors/dircolors .dircolors

##
## git
##
section "git"
config git/gitconfig .gitconfig
config git/allowed_signers .git/allowed_signers

config git/includes/1password.inc .git/includes/1password.inc
config git/includes/intellij.inc .git/includes/intellij.inc

##
## maven
##
section "maven"
config mvn/settings.xml .m2/settings.xml

##
## ssh
##
section "ssh"
config ssh/config .ssh/config
config ssh/id_anuket.pub .ssh/id_anuket.pub
config ssh/id_github.pub .ssh/id_github.pub
config ssh/id_horus.pub .ssh/id_horus.pub
config ssh/id_luciad.pub .ssh/id_luciad.pub
config ssh/id_osiris.pub .ssh/id_osiris.pub
config ssh/id_unifi.pub .ssh/id_unifi.pub

##
## vim
##
section "vim"
config vim/vimrc .vimrc

##
## zsh
##
section "zsh"
config zsh/zshrc .zshrc
config zsh/zprofile .zprofile
config zsh/aliases .zsh/aliases
config zsh/exports .zsh/exports
config zsh/options .zsh/options
config zsh/plugins .zsh/plugins
config zsh/theme .zsh/theme