# genera
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export EDITOR=nvim
export TERM='screen-256color'
export TARGET_LANG=ja
export KEYTIMEOUT=1
export HISTSIZE=1000000
export SAVEHIST=1000000
export FZF_DEFAULT_COMMAND='rg --files --hidden --glob "!.git"'
export FZF_DEFAULT_OPTS='--height 100% --reverse'
export LESS_TERMCAP_so=$'\E[30;43m'

# dir
export PROFILE=$HOME/kis9a
export MEMOS=$PROFILE/memos
export TASKS=$PROFILE/tasks
export TASK=$PROFILE/tasks/$(date +%Y)/$(date +%m).md
export HISTORY=$HOME/.zsh_history
export MYVIMRC=$HOME/dotfiles/.config/nvim/init.vim
export DOTFILES=$HOME/dotfiles
export DEV=$HOME/dev

# bin
export PATH=$HOME/bin:"$PATH"

# envs
export PATH="/usr/local/opt/php@7.2/bin:$PATH"
export PATH="/usr/local/opt/php@7.2/sbin:$PATH"
export PATH="/usr/local/Cellar/php@7.2/7.2.34_2/bin:$PATH"

php_log_path="~/Logs/php_error.log"

function plog() {
	if $1 = 'clear'
	then
		: > $php_log_path && echo "$php_log_path has been cleared!"
	else
		printf "\033c" && tail -n 1000 -f $php_log_path
	fi
}

export HTTP_ROOT_DIR=~/dev
export PATH=/usr/local/openresty/bin:/usr/local/openresty/nginx/sbin:$PATH
export LUA_PATH='/Users/evolany16/.luarocks/share/lua/5.1/?.lua;/Users/evolany16/.luarocks/share/lua/5.1/?/init.lua;/usr/local/share/lua/5.1/?.lua;/usr/local/share/lua/5.1/?/init.lua;./?.lua;/usr/local/lib/lua/5.1/?.lua;/usr/local/lib/lua/5.1/?/init.lua'
export LUA_CPATH='/Users/evolany16/.luarocks/lib/lua/5.1/?.so;/usr/local/lib/lua/5.1/?.so;./?.so;/usr/local/lib/lua/5.1/loadall.so'
