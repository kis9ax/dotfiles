# general
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export EDITOR=nvim
export KEYTIMEOUT=1
export HISTSIZE=1000
export HISTFILE=${HOME}/.zsh_history
export LANG=ja_JP.UTF-n
export FZF_DEFAULT_COMMAND='rg --files --hidden --glob "!.git"'
export FZF_DEFAULT_OPTS='--height 30% --reverse --color=info:#79740e,prompt:#79740e,spinner:#79740e,pointer:#cc241d,marker:#458588'

# bin
export PATH=~/bin:"$PATH"

# go
export GOPATH=$HOME/go
export GOROOT=/usr/local/opt/go/libexec
export PATH=$PATH:$GOPATH/bin

# nodebrew
export PATH=$HOME/.nodebrew/current/bin:$PATH
source "$HOME/.cargo/env"
