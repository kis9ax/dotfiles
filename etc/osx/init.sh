# Set DOTPATH as default variable
if [ -z "${DOTPATH:-}" ]; then
  DOTPATH=~/dotfiles; export DOTPATH
fi

e_header() {
	printf " \033[37;1m%s\033[m\n" "$*"
}

init() {
  cd $DOTPATH/etc/osx
  # TODO paralel install with brew bundle
  e_header "Install necessary packages..."
  brew upgrade
  find Brewfile* | xargs -t -I FILENAME brew bundle -f --no-upgrade --no-lock --file FILENAME
}

init
