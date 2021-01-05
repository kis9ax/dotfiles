# # ostype returns the lowercase OS name
ostype() {
	# shellcheck disable=SC2119
	uname | lower
}

# os_detect export the PLATFORM variable as you see fit
os_detect() {
	export PLATFORM
	case "$(ostype)" in
	*'linux'*) PLATFORM='linux' ;;
	*'darwin'*) PLATFORM='osx' ;;
	*'bsd'*) PLATFORM='bsd' ;;
	*) PLATFORM='unknown' ;;
	esac
}

# is_osx returns true if running OS is Macintosh
is_osx() {
	os_detect
	if [ "$PLATFORM" = "osx" ]; then
		return 0
	else
		return 1
	fi
}
alias is_mac=is_osx

# is_linux returns true if running OS is GNU/Linux
is_linux() {
	os_detect
	if [ "$PLATFORM" = "linux" ]; then
		return 0
	else
		return 1
	fi
}

# is_bsd returns true if running OS is FreeBSD
is_bsd() {
	os_detect
	if [ "$PLATFORM" = "bsd" ]; then
		return 0
	else
		return 1
	fi
}

# lower returns a copy of the string with all letters mapped to their lower case.
# shellcheck disable=SC2120
lower() {
	if [ $# -eq 0 ]; then
		cat <&0
	elif [ $# -eq 1 ]; then
		if [ -f "$1" -a -r "$1" ]; then
			cat "$1"
		else
			echo "$1"
		fi
	else
		return 1
	fi | tr "[:upper:]" "[:lower:]"
}

# upper returns a copy of the string with all letters mapped to their upper case.
# shellcheck disable=SC2120
upper() {
	if [ $# -eq 0 ]; then
		cat <&0
	elif [ $# -eq 1 ]; then
		if [ -f "$1" -a -r "$1" ]; then
			cat "$1"
		else
			echo "$1"
		fi
	else
		return 1
	fi | tr "[:lower:]" "[:upper:]"
}
