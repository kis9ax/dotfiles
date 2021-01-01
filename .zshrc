setopt no_beep
setopt nolistbeep
setopt auto_cd
setopt auto_pushd
setopt hist_ignore_dups
setopt hist_ignore_all_dups
setopt hist_ignore_space
setopt hist_reduce_blanks
setopt share_history
unsetopt PROMPT_SP
disable r

# zinit
if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
    command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
    command git clone https://github.com/zdharma/zinit "$HOME/.zinit/bin" && print -P "success" || print -P "fail"
fi

source "$HOME/.shellenv"
source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
autoload -Uz run-help
autoload -Uz add-zsh-hook
autoload -Uz colors && colors
autoload -Uz compinit && compinit -u
autoload -Uz is-at-least
autoload zsh/complist

(( ${+_comps} )) && _comps[zinit]=_zinit
zinit light zsh-users/zsh-autosuggestions
zinit ice wait'!0'; zinit load zsh-users/zsh-syntax-highlighting
zinit ice wait'!0'; zinit load zsh-users/zsh-completions

# prompt
autoload -Uz vcs_info
autoload -Uz add-zsh-hook
setopt prompt_subst
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr "%F{yellow}!"
zstyle ':vcs_info:git:*' unstagedstr "%F{red}+"
zstyle ':vcs_info:*' formats "%F{green} %c%u%b%f"
zstyle ':vcs_info:*' actionformats '%b|%a'
precmd () { vcs_info; precmd() { echo } }
_vcs_precmd () { vcs_info }
add-zsh-hook precmd _vcs_precmd
PROMPT='%F{142}< %~%f${vcs_info_msg_0_} %F{142}>%f '

# functions
bindkey -s '^v' 'nvim^M'
bindkey "^P" up-line-or-search
bindkey "^N" down-line-or-search
bindkey "^P" up-line-or-search
bindkey '^i'	menu-expand-or-complete
bindkey -v '^a' beginning-of-line
bindkey -v '^b' backward-char
bindkey -v '^e' end-of-line
bindkey -v '^f' forward-char
bindkey -v '^h' backward-delete-char
bindkey -v '^i' expand-or-complete

function fzf-history() {
  BUFFER=$(history -n -r 1 | fzf --no-sort +m --query "$LBUFFER" --prompt="History > ")
  CURSOR=$#BUFFER
}
zle -N fzf-history
bindkey '^r' fzf-history

# alias
setopt aliases
source ~/.alias;
