e_newline() {
	printf "\n"
}

e_header() {
	printf " \033[37;1m%s\033[m\n" "$*"
}

e_error() {
	printf " \033[31m%s\033[m\n" "✖ $*" 1>&2
}

e_warning() {
	printf " \033[31m%s\033[m\n" "$*"
}

e_done() {
	printf " \033[37;1m%s\033[m...\033[32mOK\033[m\n" "✔ $*"
}

e_arrow() {
	printf " \033[37;1m%s\033[m\n" "➜ $*"
}

e_indent() {
	for ((i = 0; i < ${1:-4}; i++)); do
		echon " "
	done
	if [ -n "$2" ]; then
		echo "$2"
	else
		cat <&0
	fi
}

e_success() {
	printf " \033[37;1m%s\033[m%s...\033[32mOK\033[m\n" "✔ " "$*"
}

e_failure() {
	die "${1:-$FUNCNAME}"
}

