# go

export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

# nodebrew

export PATH=$HOME/.nodebrew/current/bin:$PATH

# zinit
source $HOME/.zinit/bin/zinit.zsh

autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit
zinit light zsh-users/zsh-autosuggestions
zinit light zdharma/fast-syntax-highlighting
zinit light zdharma/history-search-multi-word
zinit ice depth=1; zinit light romkatv/powerlevel10k
zinit load junegunn/fzf-bin

zinit wait lucid atload"zicompinit; zicdreplay" blockf for zsh-users/zsh-completions

<<<<<<< HEAD
=======

# gcloud

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/kaitomori/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/kaitomori/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/kaitomori/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/kaitomori/google-cloud-sdk/completion.zsh.inc'; fi


>>>>>>> '
# powerlevel10k

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# other

export HISTSIZE=100
export HISTFILE=${HOME}/.zsh_history
export LANG=ja_JP.UTF-8

autoload -Uz colors && colors
autoload -Uz compinit && compinit
