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
<<<<<<< HEAD
=======
=======
>>>>>>> '
=======
KEYTIMEOUT=1
>>>>>>> 2020-10 nerdtree > defx.vim and change faster vim keymap

function hello-world () {
  echo '\nHello World'
}

function fbr() {
  local branches branch
  branches=$(git branch --all | grep -v HEAD) &&
  branch=$(echo "$branches" |
           fzf-tmux -d $(( 2 + $(wc -l <<< "$branches") )) +m) &&
  git checkout $(echo "$branch" | sed "s/.* //" | sed "s#remotes/[^/]*/##")
}

zle -N fbr
bindkey '^g' fbr

function fd() {
  local dir
  dir=$(find ${1:-.} -path '*/\.*' -prune \
                  -o -type d -print 2> /dev/null | fzf +m) &&
  cd "$dir"
  zle -R -c
}

zle -N fd
bindkey '^f' fd

function ghq-fzf() {
  local src=$(ghq list | fzf --preview "ls -laTp $(ghq root)/{} | tail -n+4 | awk '{print \$9\"/\"\$6\"/\"\$7 \" \" \$10}'")
  if [ -n "$src" ]; then
    BUFFER="cd $(ghq root)/$src"
    zle accept-line
  fi
  zle -R -c
}
zle -N ghq-fzf
bindkey '^t' ghq-fzf

function nvim-dot() {
  nvim .
  zle -R -c
}
<<<<<<< HEAD
<<<<<<< HEAD
>>>>>>> '
=======
>>>>>>> '
=======
zle -N nvim-dot
bindkey '^v' nvim-dot
>>>>>>> modify more comfortable settings
