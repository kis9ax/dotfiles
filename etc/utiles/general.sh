# is_exists returns true if executable $1 exists in $PATH
is_exists() {
	which "$1" >/dev/null 2>&1
	return $?
}

# has is wrapper function
has() {
	is_exists "$@"
}

# die returns exit code error and echo error message
die() {
	e_error "$1" 1>&2
	exit "${2:-1}"
}

# is_login_shell returns true if current shell is first shell
is_login_shell() {
	[ "$SHLVL" = 1 ]
}

# is_git_repo returns true if cwd is in git repository
is_git_repo() {
	git rev-parse --is-inside-work-tree &>/dev/null
	return $?
}

# is_screen_running returns true if GNU screen is running
is_screen_running() {
	[ ! -z "$STY" ]
}

# is_tmux_runnning returns true if tmux is running
is_tmux_runnning() {
	[ ! -z "$TMUX" ]
}

# is_screen_or_tmux_running returns true if GNU screen or tmux is running
is_screen_or_tmux_running() {
	is_screen_running || is_tmux_runnning
}

# shell_has_started_interactively returns true if the current shell is
# running from command line
shell_has_started_interactively() {
	[ ! -z "$PS1" ]
}

# is_ssh_running returns true if the ssh deamon is available
is_ssh_running() {
	[ ! -z "$SSH_CLIENT" ]
}

# is_debug returns true if $DEBUG is set
is_debug() {
	if [ "$DEBUG" = 1 ]; then
		return 0
	else
		return 1
	fi
}

# is_number returns true if $1 is int type
is_number() {
	if [ $# -eq 0 ]; then
		cat <&0
	else
		echo "$1"
	fi | grep -E '^[0-9]+$' >/dev/null 2>&1
	if [ $? -eq 0 ]; then
		return 0
	else
		return 1
	fi
}
alias is_int=is_number
alias is_num=is_number

# echon is a script to emulate the -n flag functionality with 'echo'
# for Unix systems that don't have that available.
echon() {
	echo "$*" | tr -d '\n'
}

