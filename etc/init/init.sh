#!/bin/bash

# Set DOTPATH as default variable
if [ -z "${DOTPATH:-}" ]; then
  DOTPATH=~/dotfiles; export DOTPATH
fi

echo $DOTPATH

source ${DOTPATH}/etc/utiles/general.sh
source ${DOTPATH}/etc/utiles/ostype.sh
source ${DOTPATH}/etc/utiles/message.sh

init() {
  if is_osx; then
    if ! has "brew"; then
      e_header "Install Homebrew"
      /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
    else
      cd $DOTPATH
      make init-osx
    fi
  fi

  if is_linux; then
    if has "apt"; then
      e_header "Upgrade apt"
      apt update && apt upgrade -y
    elif has "yum"; then
      e_header "Update yum"
      yum update -y
    fi
  fi
}

install() {
  if has "brew"; then
    e_arrow "brew install $*"
    brew install $*
  elif has "apt"; then
    e_arrow "apt install $*"
    apt install -y $*
  elif has "yum"; then
    e_arrow "yum install $*"
    yum install -y $*
  fi
}

init
