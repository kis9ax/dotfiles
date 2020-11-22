export EDITOR="vi"

# go
export GOPATH=$HOME/go

if [ -d "$GOPATH" ]; then
  export PATH="$GOPATH/bin:$PATH"
elif [[ $commands[go] ]]; then
  export PATH="$(go env GOPATH)/bin:$PATH"
fi

# nodebrew
NODEBREW=$HOME/.nodebrew
if [ -d $NODEBREW ]; then
    export PATH=$NODEBREW/current/bin:$PATH
fi

# zinit
source "$HOME/.zinit/bin/zinit.zsh"

autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit
zinit light zsh-users/zsh-autosuggestions
zinit light zdharma/history-search-multi-word
zinit ice wait'!0'; zinit load zsh-users/zsh-syntax-highlighting
zinit ice wait'!0'; zinit load zsh-users/zsh-completions
zinit ice depth=2; zinit light romkatv/powerlevel10k

autoload bashcompinit && bashcompinit

# powerlevel10k

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
