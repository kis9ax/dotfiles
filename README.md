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
# nvim -v
# expected: NVIM v0.5.0-dev+... Build type: Debug LuaJIT 2.1.0-beta3 ...
# execute :checkhealth in nvim

```

#

### I use this tools

Importance, priority. (ip)  
[low] 1 =< ip =< 10 [high], this is just my sense.

```sh
# (ip: 8)
# fast terminal # https://github.com/alacritty/alacritty
# If use alacritty, install nerd-font* and overwrite setting your favorite fonts.
# https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts
# settings in .config/alacritty/alacritty.yml
brew tap homebrew/cask-fonts
brew install --cask font-hack-nerd-font
brew install alaclitty
brew install fzf
brew install fd
brew install ripgrep
brew install bat
brew install gh

# (ip: 5)
brew install tig
brew install amethyst
brew install git-delta
brew install translate-shell
brew install watchman

# (ip: 3)
brew install archey
brew install cowsay
brew install figlet
brew install lolcat
brew install boxes
brew install mpv
brew install youtube-dl
brew install tmux-xpanes

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
# backup
mkdir dotbackup
cp -r .zshrc .zshenv .tmux.conf .gitconfig .config/ bin/ ./dotbackup
ls -la ./dotbackup

# clone
cd ~/
git clone https://github.com/kis9a/dotfiles
cd dotfiles/

```

- vim .gitconfig

```toml
[user]
	name = kis9a # change your name
	email = kis9ax@gmail.com # change to your email
[github]
	user = kis9a #change to your userId

 ...
```

- vim .zshenv

```sh
export PROFILE=$HOME/kis9a # change to your gihtub id.
# To PATH profiles repository https://github.com/kis9a/kis9a

```

```
cd ~/
rm -rf .config/ bin/
make deploy
zsh
nvim
```

- vim .git/config

```sh
[remote "origin"]
	url = https://github.com/kis9a/dotfiles # change to your remote
	fetch = +refs/heads/*:refs/remotes/origin/*
...

gh auth login
gh create repo dotfiles
git add . && git commit -m "init"
git push -u origin master

```

<img width="900" alt="Screen Shot 2021-03-18 at 1 12 04" src="https://user-images.githubusercontent.com/65019715/111500182-0d652800-8787-11eb-9f30-1db41472aa7b.png">

### Usage

### QA · FQA

##### o What is Tmux ?

Tmux is a terminal multiplexer.  
<https://github.com/tmux/tmux>

##### o What is Neovim ?

Vim extended functions and comunity.  
<https://github.com/neovim/neovim>

##### o What is the COC ?

Language-Server-Protocol(LSP) client for neovim.  
<https://github.com/neoclide/coc.nvim>

<details><summary>What is the LSP ?</summary><div>{{{

· [Official page for Language Server Protocol](https://microsoft.github.io/language-server-protocol/)  
· [language server protocol について (前編) - Qiita](https://qiita.com/atsushieno/items/ce31df9bd88e98eec5c4)  
· [プロトコルとは？初心者でもわかる IT 用語解説！ | ColorfulBoxMedia](https://www.colorfulbox.jp/media/protocol/)

**Functions**

| リクエスト                     | 説明                                                     |
| ------------------------------ | -------------------------------------------------------- |
| textDocument/completion        | 自動補完                                                 |
| completionItem/resolve         | 自動補完候補の選択                                       |
| textDocument/hover             | ヒント（ホバー）の表示                                   |
| textDocument/signatureHelp     | メンバー定義(signature)候補の表示                        |
| textDocument/definition        | シンボルの定義の位置を取得                               |
| textDocument/references        | シンボルの利用（参照）位置のリスト取得                   |
| textDocument/documentHighlight | ハイライト対象シンボルの利用（参照）のリスト取得         |
| textDocument/documentSymbol    | ドキュメント中で定義されている全シンボルの取得           |
| workspace/symbol               | ワークスペース全体からクエリ条件に合致するシンボルの取得 |
| textDocument/codeAction        | コード アクションのリストの取得                          |
| textDocument/codeLens          | code lens のリストの取得                                 |
| codeLens/resolve               | code lens の処理の実行                                   |
| textDocument/formatting        | ドキュメントの整形                                       |
| textDocument/rangeFormatting   | 選択範囲の整形                                           |
| textDocument/onTypeFormatting  | タイプ時の整形                                           |
| textDocument/rename            | 識別子の変更                                             |

| リクエスト                       | 説明                                             |
| -------------------------------- | ------------------------------------------------ |
| workspace/didChangeConfiguration | ワークスペースの設定変更                         |
| textDocument/didOpen             | ドキュメントを開いたという通知                   |
| textDocument/didChange           | ドキュメントの内容を変更したという通知           |
| textDocument/didClose            | ドキュメントを閉じたという通知                   |
| textDocument/didSave             | ドキュメントを保存したという通知                 |
| workspace/didChangeWatchedFiles  | 監視していたファイルへの変更を検出したという通知 |
| textDocument/publishDiagnostics  | ドキュメントに対する検証処理の結果通知           |

| リクエスト                | 説明                               |
| ------------------------- | ---------------------------------- |
| $/cancelRequest           | リクエストのキャンセル             |
| exit                      | 終了                               |
| window/showMessage        | メッセージ表示の要求               |
| window/showMessageRequest | 応答要求を含むメッセージ表示の要求 |
| window/logMessage         | メッセージのログ記録要求           |
| telemetry/event           | 各種 telemetry イベントの発生      |

</div></details>}}}
