# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

PATH=$PATH:bin

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

# [prompt]
       black="\[\e[1;30m\]"
         red="\[\e[1;31m\]"
       green="\[\e[1;32m\]"
      yellow="\[\e[1;33m\]"
        blue="\[\e[1;34m\]"
     magenta="\[\e[1;35m\]"
        cyan="\[\e[1;36m\]"
        grey="\[\e[1;37m\]"
   dark_grey="\[\e[1;90m\]"
   light_red="\[\e[1;91m\]"
 light_green="\[\e[1;92m\]"
 dark_yellow="\[\e[1;93m\]"
  light_blue="\[\e[1;94m\]"
light_purple="\[\e[1;95m\]"
   turquoise="\[\e[1;96m\]"
       white="\[\e[1;97m\]"
         off="\[\e[0m\]"

if [ $(id -u) -eq 0 ]; then
  c__def=$red
  c_numb=$red
  c_user=$red
  c_host=$red
  c__tty=$cyan
  c_path=$white
else
  c__def=$white
  c_numb=$yellow
  c_user=$white
  c_host=$white
  c__tty=$cyan
  c_path=$light_blue
fi

  ab='['
  fe=']'
  tty="shell:$(tty | cut -d/ -f4)"

  char="$"
  at="$c_user\u$c__def@"
  tat="\u@"

if [ "$color_prompt" = yes ]; then
    git="$red\$(__git_ps1)$off "
    title="\[\e]0;$tat\h$ab$tty$fe\w\a\]"
    prompt="$c_numb\! $at$c_host\h$c__def$ab$c__tty$tty$c__def$fe[$c_path\w$c__def]$off"
    PS1="$title$prompt$git"
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt


# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# enable kubectl
if ! shopt -oq posix; then
  source <(kubectl completion bash)
fi

# load all functions in .function directory
source $(find ${HOME}/.functions/ -type f)
