# go

export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

# nodebrew

export PATH=$HOME/.nodebrew/current/bin:$PATH

# zinit

if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing %F{33}DHARMA%F{220} Initiative Plugin Manager (%F{33}zdharma/zinit%F{220})…%f"
    command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
    command git clone https://github.com/zdharma/zinit "$HOME/.zinit/bin" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
        print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi

source "$HOME/.zinit/bin/zinit.zsh"

autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit
zinit light zsh-users/zsh-autosuggestions
zinit light zdharma/history-search-multi-word
zinit ice wait'!0'; zinit load zsh-users/zsh-syntax-highlighting
zinit ice wait'!0'; zinit load zsh-users/zsh-completions
zinit ice depth=1; zinit light romkatv/powerlevel10k
zinit load junegunn/fzf-bin

zinit wait lucid atload"zicompinit; zicdreplay" blockf for zsh-users/zsh-completions

autoload bashcompinit && bashcompinit

# gcloud

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/kaitomori/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/kaitomori/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/kaitomori/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/kaitomori/google-cloud-sdk/completion.zsh.inc'; fi

# powerlevel10k

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
