# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoredups:ignorespace

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

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

if [ "$color_prompt" = yes ]; then
    #PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\[$(tput setaf 231)\]\$\[$(tput setaf 7)\] '
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
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

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
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

### My Stuff ###########################################################################

# Detect the OS:
case $OSTYPE in
  solaris*) OS=SOLARIS;;
  darwin*)  OS=OSX;; 
  linux*)   OS=LINUX;; 
  bsd*)     OS=BSD;; 
  *)        OS="Unknown: $OSTYPE";; 
esac
# Source: http://f00bar.com/


# OSX configuration
if [ "$OS" == "OSX" ]; then
  # Quick app aliases: 
  alias chrome="open /Applications/Google\ Chrome.app"
  alias cb="git branch | grep '^\*' | cut -d' ' -f2 | pbcopy" # cb = copy branch
  alias ll="ls -la"
fi

# Linux configuration:
if [ "$OS" == "LINUX" ]; then
  export TERM=xterm-256color
  alias open="xdg-open"
  alias cb="git branch | grep '^\*' | cut -d' ' -f2 | tr -d '\n' | xsel --clipboard --input" # cb = copy branch
  #alias irssi='TERM=screen-256color irssi'
  alias pbcopy='xsel --clipboard --input'
  alias pbpaste='xsel --clipboard --output'
  [ -f ~/.fzf.bash ] && source ~/.fzf.bash

  notify () {
    if [ -z "$1" ] || [ -z "$2" ]; then
      echo "Usage: notify <time-in-seconds> <message>"
    else
      sleep "$1"; zenity --info --no-wrap --text="${*:2}" 2>/dev/null
    fi
  }
fi

# Load .bin and bin into local paths
PATH="~/bin:$PATH" # Local stuff
PATH="~/config/.bin:$PATH"
# DO NOT COMMIT - temporary hack for python pip3
PATH="${HOME}/.local/bin:$PATH"
PATH="~/.local/bin/aws_completer:$PATH"
complete -C '~/.local/bin/aws_completer' aws

# My Alias'
alias vwipe='find . -iname ".*.un~" -delete'
alias notes='vim ~/notes'
alias vi='vim'

# Install Ruby Gems to ~/gems
export GEM_HOME="$HOME/gems"
export PATH="$HOME/gems/bin:$PATH"
