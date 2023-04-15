#!/usr/bin/env zsh

DOTFILES="${0:A:h}"

. "${DOTFILES}/helpers/echos.sh"
. "${DOTFILES}/helpers/config.sh"

header "Configurations"

##
## dircolors
##
title "dircolors"
config dircolors/dircolors .dircolors

##
## git
##
title "git"
config git/gitconfig .gitconfig

##
## gpg
##
title "gpg"
config gpg/gpg.conf .gnupg/gpg.conf
config gpg/gpg-agent.conf .gnupg/gpg-agent.conf
config gpg/scdaemon.conf .gnupg/scdaemon.conf

##
## ssh
##
title "ssh"
config ssh/config .ssh/config
config ssh/id_anubis.pub .ssh/id_anubis.pub
config ssh/id_github.pub .ssh/id_github.pub
config ssh/id_horus.pub .ssh/id_horus.pub
config ssh/id_isis.pub .ssh/id_isis.pub
config ssh/id_osiris.pub .ssh/id_osiris.pub
config ssh/id_unifi.pub .ssh/id_unifi.pub

##
## vim
##
title "vim"
config vim/vimrc .vimrc
config vim/vimrc .config/nvim/init.vim

##
## zsh
##
title "zsh"
config zsh/zshrc .zshrc
config zsh/zprofile .zprofile

config zsh/aliases .zsh/aliases
config zsh/exports .zsh/exports
config zsh/options .zsh/options
conig zsh/theme .zsh/theme
