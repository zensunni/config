export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad

source ~/.bashrc
source ~/.git-completion.bash

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
. ~/.bashrc
eval "$(/Users/kwerklund/dev/ESP/scripts/bin/esp init -)"
