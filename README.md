#

**!! Simple but Powerful !!**

## Pre Installation

### tmux, neovim

```sh

# tmux
brew install tmux
brew install reattach-to-user-namespace
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# neovim
brew install neovim --HEAD
brew install node
brew install lua
brew install python
brew install python@3.8
brew install ruby@2.4
npm install -g neovim
pip install neovim
gem install neovim
# execute :checkhealth in nvim

```

#

### I use this tools

Importance, priority. (ip)  
[low] 1 =< ip =< 10 [high], this is just my sense.

```sh
# (ip: 8)
# fast terminal
# settings in .config/alacritty/alacritty.yml
# https://github.com/alacritty/alacritty
brew install alaclitty
brew install gh
brew install fd
brew install ripgrep
brew install bat

# (ip: 5)
brew install tig
brew install amethyst
brew install git-delta
brew install translate-shell
brew install watchman

# (ip: 3)
brew install mpv
brew install archey
brew install cowsay
brew install figlet
brew install lolcat
brew install youtube-dl

## parser (ip: 6)
brew install jq
brew install yq
brew install pup

# formatter, linter (ip: 6)
# used with https://github.com/iamcco/coc-diagnostic
# settings in .config/nvim/coc-settings.json
brew install lua-format
brew install shfmt
brew install gofmt
brew install clang-format
brew install psalm
brew install vint
brew install shellcheck
...
```

## Installation

```sh
mkdir dotbackup
cp -r .zshrc .zshenv .tmux.conf .gitconfig .config/ bin/ ./dotbackup
ls -la ./dotbackup
```

```sh
cd ~/
git clone https://github.com/kis9a/dotfiles
git checkout ev
cd dotfiles/

```

vim ./.gitconfig

```toml
[user]
	name = kis9a # change your name
	email = kis9ax@gmail.com # change to your email
[github]
	user = kis9a #change to your userId

 ...
```

```
cd ~/
rm -rf .config/ bin/
make deploy
zsh
nvim
```

<img width="937" alt="Screen Shot 2021-03-18 at 1 12 04" src="https://user-images.githubusercontent.com/65019715/111500182-0d652800-8787-11eb-9f30-1db41472aa7b.png">
