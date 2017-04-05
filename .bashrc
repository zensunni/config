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

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
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
fi

# Linux configuration:
if [ "$OS" == "LINUX" ]; then
  export TERM=xterm-256color
  alias open="xdg-open"
  alias ack='ack-grep'
fi

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

# If "t" is installed
if [ -f ~/dev/tasks/lib/t.py ]; then
  alias t='python ~/dev/tasks/lib/t.py --task-dir ~/dev/tasks --list work_todo.txt --delete-if-empty'
  alias c='python ~/dev/tasks/lib/t.py --task-dir ~/dev/tasks --list code_todo.txt --delete-if-empty'
  export PS1="[\[$(tput setaf 231)\]t\$(t | wc -l | sed -e's/ *//')\[$(tput setaf 7)\]|\[$(tput setaf 231)\]c\$(c | wc -l | sed -e's/ *//')\[$(tput setaf 7)\]]$PS1"
fi

# If neovim is installed
if type nvim > /dev/null 2>&1; then
  alias vim='nvim'
  alias vi='nvim'
  export VISUAL=nvim
  export EDITOR="$VISUAL"
fi

# Load .bin and bin into local paths
PATH="~/bin:$PATH" # Local stuff
PATH="~/config/.bin:$PATH"

# Set svn editor
export SVN_EDITOR=vim

# Add indicator in prompt, depending on .server file page
if [ -n "$SSH_CLIENT" ] || [ -n "$SSH_TTY" ]; then
  export PS1="[\[$(tput setaf 1)\]server\[$(tput setaf 7)\]]$PS1"
else
  export PS1="[\[$(tput setaf 6)\]local\[$(tput setaf 7)\]]$PS1"
fi
# Source: http://serverfault.com/questions/187712/how-to-determine-if-im-logged-in-via-ssh

# My Alias'
alias vwipe='find . -iname ".*.un~" -delete'
alias notes='vim ~/notes'
