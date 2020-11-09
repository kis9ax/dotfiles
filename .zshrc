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

bindkey -s "^k" 'ls^M'

function search() {
  local open_cmd
  local url
  url="https://www.$1.com"

  [[ "$OSTYPE" = linux* ]] && open_cmd='xdg-open'
  [[ "$OSTYPE" = darwin* ]] && open_cmd='open'

  if [[ $# -le 1 ]]; then
    $open_cmd "$url"
    return
  fi

  typeset -A search_syntax=(
    google     "/search?q="
    github     "/search?q="
    duckduckgo "/?q="
    youtube    "/results?search_query="
    qiita      "/search?q="
    devto      "/search?q="
  )

  url="${url}${search_syntax[$1]}"
  shift

  while [[ $# -gt 0 ]]; do
    url="${url}$1+"
    shift
  done

  url="${url%?}"
  nohup $open_cmd "$url" &> /dev/null
}
