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
autoload -Uz _zinit
autoload -Uz colors && colors
autoload -Uz compinit && compinit
unsetopt PROMPT_SP
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export HISTSIZE=100
export HISTFILE=${HOME}/.zsh_history
export LANG=ja_JP.UTF-n
export FZF_DEFAULT_COMMAND='rg --files --hidden --glob "!.git"'
export FZF_DEFAULT_OPTS='--height 30% --reverse --color=info:#79740e,prompt:#79740e,spinner:#79740e,pointer:#cc241d,marker:#458588'
KEYTIMEOUT=1

source ~/.alias

nvim. () { nvim .; zle -R -c }
zle -N nvim.
bindkey '^v' nvim.
bindkey "^P" up-line-or-search
bindkey -s "^k" 'ls -la^M'
bindkey -s "^j" 'cd ..^M'

function fzf-history() {
  BUFFER=$(history -n -r 1 | fzf --no-sort +m --query "$LBUFFER" --prompt="History > ")
  CURSOR=$#BUFFER
}
zle -N fzf-history
bindkey '^r' fzf-history

# fbr - checkout git branch
fbr() {
  local branches branch
  branches=$(git branch -vv) &&
  branch=$(echo "$branches" | fzf +m) &&
  git checkout $(echo "$branch" | awk '{print $1}' | sed "s/.* //")
}

# fshow - git commit browser
fshow() {
  git log --graph --color=always \
      --format="%C(auto)%h%d %s %C(black)%C(bold)%cr" "$@" |
  fzf --ansi --no-sort --reverse --tiebreak=index --bind=ctrl-s:toggle-sort \
      --bind "ctrl-m:execute:
                (grep -o '[a-f0-9]\{7\}' | head -1 |
                xargs -I % sh -c 'git show --color=always % | less -R') << 'FZF-EOF'
                {}
FZF-EOF"
}

ff() {
  local dir
  dir=$(fd -p ~/dev -t d | fzf)
  echo $dir
  cd ~/dev/$dir
}

f() {
  local dir
  dir=$(fd -t d | fzf)
  cd $dir
}
