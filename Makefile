current_dir := $(shell pwd)

.PHONY: all
all: dotfiles

.PHONY: dotfiles
dotfiles: # Do the installation
	ln -sf $(current_dir)/.vimrc ${HOME}/.vimrc
	ln -sf $(current_dir)/.bashrc ${HOME}/.bashrc
	ln -sf $(current_dir)/.bash_aliases ${HOME}/.bash_aliases
	ln -sf $(current_dir)/.dircolors ${HOME}/.dircolors
	ln -sf $(current_dir)/.gitconfig ${HOME}/.gitconfig
	ln -sf $(current_dir)/.gitignore ${HOME}/.gitignore
	ln -sf $(current_dir)/.tmux.conf ${HOME}/.tmux.conf
	ln -sf $(current_dir)/.Xresources ${HOME}/.Xresources
	ln -sf $(current_dir)/.config ${HOME}/.config
	ln -sf $(current_dir)/.fonts ${HOME}/.fonts
	ln -sf $(current_dir)/fonts ${HOME}/fonts

.PHONY: help
help:
