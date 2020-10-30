source ~/.alias

setopt hist_ignore_dups
setopt EXTENDED_HISTORY
setopt print_eight_bit
setopt auto_cd
setopt no_beep
setopt nolistbeep
setopt auto_pushd
setopt share_history
setopt hist_ignore_dups
setopt hist_ignore_all_dups
setopt hist_ignore_space
setopt hist_reduce_blanks
autoload -Uz colors && colors
autoload -Uz compinit && compinit
unsetopt PROMPT_SP
export HISTSIZE=100
export HISTFILE=${HOME}/.zsh_history
export LANG=ja_JP.UTF-n

<<<<<<< HEAD
<<<<<<< HEAD
=======
=======
>>>>>>> '

# fbr - checkout git branch (including remote branches)
fbr() {
  local branches branch
  branches=$(git branch --all | grep -v HEAD) &&
  branch=$(echo "$branches" |
           fzf-tmux -d $(( 2 + $(wc -l <<< "$branches") )) +m) &&
  git checkout $(echo "$branch" | sed "s/.* //" | sed "s#remotes/[^/]*/##")
}

fd() {
  local dir
  dir=$(find ${1:-.} -path '*/\.*' -prune \
                  -o -type d -print 2> /dev/null | fzf +m) &&
  cd "$dir"
}
<<<<<<< HEAD
>>>>>>> '
=======
>>>>>>> '
