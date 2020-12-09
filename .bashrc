source ~/.alias

case $- in
  *i*) ;;
  *) return ;;
esac

shopt -s histappend
shopt -s checkwinsize

[ -x /user/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

case "$TERM" in
  xterm-color|*-256color) color_prompt=yes;;
esac

# bin
export PATH=~/bin:"$PATH"

# direnv
export EDITOR=nvim

# go
export GOPATH=$HOME/go
export GOROOT=/usr/local/opt/go/libexec
export PATH=$PATH:$GOPATH/bin

# nodebrew
export PATH=$HOME/.nodebrew/current/bin:$PATH

export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export HISTSIZE=1000
export HISTCONTROL=ignoreboth
export HISTFILESIZE=2000
export HISTFILE=${HOME}/.zsh_history
export LANG=ja_JP.UTF-n
export FZF_DEFAULT_COMMAND='rg --files --hidden --glob "!.git"'
export FZF_DEFAULT_OPTS='--height 30% --reverse --color=info:#79740e,prompt:#79740e,spinner:#79740e,pointer:#cc241d,marker:#458588'
PS1="\n\[\e[32m\]\w\[\e[m\] $(git-ps) > "
