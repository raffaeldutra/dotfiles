CFLAGS=-s

current_dir := $(shell pwd)
SHELL := /bin/bash

.PHONY: all
all: install test

.ONESHELL:
clone:
	if [ "${SHELL}" != "/bin/bash" ]; then
	    echo "ERROR: This is not a BASH environment"
	    exit 0
	fi

	if [ ! -d ${HOME}/dotfiles ]; then
	    git clone https://github.com/raffaeldutra/dotfiles.git
	else
	    echo "dotfiles exists, pulling new files"
	    cd ${HOME}/dotfiles && git pull origin master
	fi

.PHONY: install
install: # Do the installation
	find $(current_dir)/.functions -name "*.sh" | \
	while read funcs; do
	    (
	      cd ${HOME}
	      ln -sf $$funcs
	    )
	done

	ln -sf $(current_dir)/.vimrc ${HOME}/.vimrc
	ln -sf $(current_dir)/.bashrc ${HOME}/.bashrc
	ln -sf $(current_dir)/.bash_aliases ${HOME}/.bash_aliases
	ln -sf $(current_dir)/.bash_profile ${HOME}/.bash_profile
	ln -sf $(current_dir)/.dircolors ${HOME}/.dircolors
	ln -sf $(current_dir)/.gitconfig ${HOME}/.gitconfig
	ln -sf $(current_dir)/.gitignore ${HOME}/.gitignore
	ln -sf $(current_dir)/.tmux.conf ${HOME}/.tmux.conf
	ln -sf $(current_dir)/.Xresources ${HOME}/.Xresources
	ln -sf $(current_dir)/.config ${HOME}/.config
	ln -sf $(current_dir)/.fonts ${HOME}/.fonts
	ln -sf $(current_dir)/fonts ${HOME}/fonts

.PHONY: test
test:
	# expand_aliases on the container is not enabled
	shopt -s expand_aliases
	source ${HOME}/.bashrc
	source ${HOME}/.bash_aliases
	source ${HOME}/.bash_profile

	l

.PHONY: help
help:
