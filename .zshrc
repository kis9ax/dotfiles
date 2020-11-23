setopt no_beep
setopt nolistbeep
setopt auto_cd
setopt auto_pushd
setopt hist_ignore_dups
setopt hist_ignore_all_dups
setopt hist_ignore_space
setopt hist_reduce_blanks
setopt share_history
setopt print_eight_bit
setopt EXTENDED_HISTORY
autoload -Uz colors && colors
autoload -Uz compinit && compinit
unsetopt PROMPT_SP
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export HISTSIZE=100
export HISTFILE=${HOME}/.zsh_history
export LANG=ja_JP.UTF-n
KEYTIMEOUT=1

source ~/.alias

nvim. () { nvim .; zle -R -c }
zle -N nvim.
bindkey '^v' nvim.
bindkey "^P" up-line-or-search
bindkey -s "^k" 'ls^M'
bindkey -s "^j" 'cd ..^M'
bindkey -s "^h" 'cd ~ ^M'
