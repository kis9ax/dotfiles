" --- setting --- syntax on
set synmaxcol=200
filetype plugin on
let mapleader="\<Space>"
let maplocalleader="\,"
set number relativenumber
set encoding=UTF-8
set fileencodings=iso-2022-jp,euc-jp,sjis,utf-8
set fileformats=unix,dos,mac
set hidden
set cursorline
set autoindent
set autochdir
set tabstop=2
set shiftwidth=2
set timeoutlen=1000
set ttimeoutlen=0
set expandtab
set splitright
set clipboard=unnamed
set clipboard+=unnamedplus
set tags=./tags;$HOME
set background=dark
set noswapfile
set modifiable
set ignorecase

" --- color setting ---
colorscheme gruvbox
highlight Normal ctermbg=none
highlight NonText ctermbg=none
highlight LineNr ctermbg=none
highlight Folded ctermbg=none
highlight EndOfBuffer ctermbg=none
highlight StatusLine ctermbg=NONE cterm=NONE

" --- 0 keymapping ---
" nnoremap
nnoremap x "_x
nnoremap s "_s
nnoremap <S-e>   $
nnoremap <S-b>   ^
nnoremap <CR> A<CR><ESC>
nnoremap == gg=G''
nnoremap <C-]> g<C-]>zz
nnoremap <C-]> <ESC>g<C-]>
nnoremap <Leader>- :sp<CR>
nnoremap <Leader>\ :vsp<CR>
nnoremap <Leader>r :so %<CR>
nnoremap <C-c> :bd<cr>
nnoremap <C-q> :q!<cr>
nnoremap <C-s> :w<cr>
nnoremap z0 zt
nnoremap ; :
nnoremap : ;
nnoremap <C-j><C-k> <C-W>\| <C-W>_
nnoremap <C-j><C-j> <C-w>=
nnoremap <C-w>> 20<C-w>>
nnoremap <C-w>< 20<C-w><
nnoremap <C-w>+ 10<C-w>+
nnoremap <C-w>- 10<C-w>-
nnoremap <silent> <Space>h "zyiw:let @/ = '\<' . @z . '\>'<CR>:set hlsearch<CR>
nnoremap <C-Up> "zdd<Up>"zP
nnoremap <C-Down> "zdd"zp
"" vimtab
nnoremap t1 1gt
nnoremap t2 2gt
nnoremap t3 3gt
nnoremap t4 4gt
nnoremap t5 5gt
nnoremap th  :tabprevious<CR>
nnoremap tl  :tabnext<CR>
nnoremap td  :tabclose<CR>
nnoremap tn :tabnew<CR>
" imap
imap <C-q> <Esc>
imap <C-k> <Up>
imap <C-j> <Down>
imap <C-h> <Left>
imap <C-l> <Right>
imap <C-s> <Esc>:w<cr>
imap <C-x> <End><CR>
imap <C-o> <Home><CR><Up>
imap <C-b> <Esc>bi
imap <C-e> <Esc>ea
imap <C-c> <Del>
imap <C-d> <Esc><C-d>i
imap <C-u> <Esc><C-u>i
imap <C-f>b <Esc>I
imap <C-f>e <Esc>A
imap <C-f>s <Esc>se
imap <C-f>d <Esc>dd<BS>A
imap <C-f>h <Esc>HI
imap <C-f>l <Esc>LI
imap <C-f>m <Esc>MI
imap <C-f>p <Esc>pi
imap <C-f>y <Esc>yyi
imap <C-f>w <Esc>diwi
"vmap
vnoremap <C-k> "zx<Up>"zP`[V`]
vnoremap <C-j> "zx"zp`[V`]
"cnoremap
cnoremap <C-k> <Up>
cnoremap <C-j> <Down>
cnoremap <C-h> <Left>
cnoremap <C-l> <Right>
cnoremap <C-b> <Home>
cnoremap <C-e> <End>
cnoremap <C-d> <BS>
cnoremap <C-c> <Del>

" netrw
let g:loaded_netrw  = 1
let g:loaded_netrwPlugin = 1
let g:loaded_netrwSettings = 1
let g:loaded_netrwFileHandlers = 1


" vimquickfix
function! ToggleQuickfix()
  let l:nr = winnr('$')
  cwindow
  let l:nr2 = winnr('$')
  if l:nr == l:nr2
    cclose
  endif
endfunction
nnoremap <script> <silent> <Leader>q :call ToggleQuickfix()<CR>

" --- commands ---
command! RemoveTrairing :%s/\s\+$//e

" --- plugin manager ---
" vim-plug install
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim  --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source ~/.config/nvim/init.vim
endif

" vim-plug
call plug#begin('~/.local/share/nvim/plugged')
" plugin
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  Plug 'dense-analysis/ale'
  Plug 'airblade/vim-rooter'
  Plug 'junegunn/vim-easy-align'
  Plug 'itchyny/calendar.vim'
  Plug 'cespare/vim-toml'
  Plug 'norcalli/nvim-colorizer.lua'
  Plug 'Yggdroot/indentLine'
  Plug 'morhetz/gruvbox'
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-commentary'
  Plug 'tpope/vim-repeat'
  Plug 'alvan/vim-closetag'
  Plug 'ntpeters/vim-better-whitespace'
  Plug 'unblevable/quick-scope'
  Plug 'mhinz/vim-grepper'
  Plug 'romainl/vim-qf'
  Plug 'stefandtw/quickfix-reflector.vim'
  Plug 'SirVer/ultisnips'
  Plug 'tpope/vim-fugitive'
  Plug 'airblade/vim-gitgutter'
  Plug 'tpope/vim-rhubarb'
  Plug 'iberianpig/tig-explorer.vim'
  Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
  Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
  Plug 'iamcco/mathjax-support-for-mkdp'
  Plug 'tyru/open-browser.vim'
  Plug 'aklt/plantuml-syntax'
  Plug 'weirongxu/plantuml-previewer.vim'
  Plug 'tpope/vim-markdown'
  Plug 'yuezk/vim-js'
  Plug 'maxmellon/vim-jsx-pretty'
  Plug 'pangloss/vim-javascript', { 'for': ['javascript', 'javascript.jsx'] }
  Plug 'othree/yajs.vim', { 'for': ['javascript', 'javascript.jsx'] }
  Plug 'HerringtonDarkholme/yats.vim'
  Plug 'leafgarland/typescript-vim'
call plug#end()

" --- iamcco/markdown-preview.nvim ---
let g:mkdp_auto_close=0
let g:mkdp_refresh_slow=1
let g:mkdp_echo_preview_url = 1

" --- analysis/ale ---
let g:ale_lint_on_text_changed = 0

" --- fatih/vim-go ---
let g:go_fmt_autosave = 1
let g:go_def_mapping_enabled = 0
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1

" --- airblade/vim-gitgutter ---
let g:gitgutter_highlight_lines = 0
set updatetime=250

" --- itchyny/calendar.vim ---
let g:calendar_google_calendar = 1
let g:calendar_google_task = 1
let g:calendar_view = "day_4"
let g:calendar_views = ['year', 'month', 'week', 'day_4','day' ]
source ~/.cache/calendar.vim/credentials.vim

" --- maxmellon/vim-jsx-pretty ---
let g:vim_jsx_pretty_colorful_config = 1

" ---  alvan/vim-closetag ---
let g:closetag_filenames = "*.html,*.xhtml,*.phtml,*.php,*.jsx,*.svelte,*.vue,*,tsx"

" --- vim-markdown ---
let g:markdown_syntax_conceal = 0

" unblevable/quick-scope
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']

" stefandtw/quickfix-reflector.vim
let g:qf_modifiable = 1
let g:qf_write_changes = 1

" mhinz/vim-grepper
nnoremap <Leader>g :Grepper<CR>

" SirVer/ultisnips
let g:UltiSnipsExpandTrigger="<tab>"

" indentLine
let g:indentLine_faster = 1
nnoremap <silent><Leader>i :<C-u>IndentLinesToggle<CR>

" --- junegunn/fzf.vim ---
nnoremap <silent> <C-p> :GFiles<CR>
nnoremap <silent> <S-p> :GFiles?<CR>
nnoremap <silent> sp :Commands<CR>
nnoremap <silent> sf :Files<CR>
nnoremap <silent> sj :Buffers<CR>
nnoremap <silent> sh :History<CR>
nnoremap <silent> s; :History:<CR>
nnoremap <silent> sl :Lines<CR>
nnoremap <silent> st :Tags<CR>
nnoremap <silent> sc :Commits<CR>
nnoremap <silent> sm :Maps<CR>
nnoremap <silent> sa :Ag<CR>
nnoremap <silent> sg :Rg<CR>
nnoremap <silent> ss :Snippets<CR>

let $FZF_DEFAULT_OPTS="--color=dark --layout=reverse --margin=1,1 --color=fg:15,bg:-1,hl:1,fg+:#ffffff,bg+:0,hl+:1 --color=info:0,pointer:12,marker:4,spinner:11,header:-1"
let $FZF_DEFAULT_COMMAND="git ls-files --cached --others --exclude-standard || fd --type f --type l --hidden --follow"
let g:fzf_layout = {  'window': { 'yoffset': 0 ,'width': 1, 'height': 0.45 } }
let g:fzf_preview_window = ''
let g:fzf_buffers_jump = 1
let g:fzf_colors =
      \ { 'fg':      ['fg', 'Normal'],
      \ 'bg':      ['bg', 'Normal'],
      \ 'hl':      ['fg', 'Comment'],
      \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
      \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
      \ 'hl+':     ['fg', 'Statement'],
      \ 'info':    ['fg', 'PreProc'],
      \ 'border':  ['fg', 'Ignore'],
      \ 'prompt':  ['fg', 'Conditional'],
      \ 'pointer': ['fg', 'Exception'],
      \ 'marker':  ['fg', 'Keyword'],
      \ 'spinner': ['fg', 'Label'],
      \ 'header':  ['fg', 'Comment'] }

" ---neoclide/coc ---
nnoremap <silent> c; :<C-u>CocList<cr>
nnoremap <silent> c: :CocCommand<CR>
nmap <silent> ca :<C-u>call CocAction('doHover')<cr>
nmap <silent> cd <Plug>(coc-definition)
nmap <silent> cq  <Plug>(coc-fix-current)
nmap <silent> ct <Plug>(coc-type-definition)
nmap <silent> ch <Plug>(coc-references)
nmap <silent> cr <Plug>(coc-rename)
nmap <silent> cf <Plug>(coc-format)
nnoremap <silent> cg :exe 'CocList -I --input='.expand('<cword>').' grep'<CR>
nnoremap <silent> cy  :<C-u>CocList -A --normal yank<cr>
nnoremap <silent> <C-n> :CocCommand explorer<CR>
tnoremap <expr> <Esc> (&filetype == "fzf") ? "<Esc>" : "<c-\><c-n>"

highlight CocErrorSign ctermfg=15 ctermbg=196
highlight CocWarningSign ctermfg=0 ctermbg=172

let g:coc_global_extensions = [
      \  'coc-lists'
      \, 'coc-pairs'
      \, 'coc-json'
      \, 'coc-emoji'
      \, 'coc-word'
      \, 'coc-go'
      \, 'coc-tsserver'
      \, 'coc-snippets'
      \, 'coc-toml'
      \, 'coc-eslint'
      \, 'coc-prettier'
      \, 'coc-explorer'
      \ ]

