" --- setting ---
syntax on
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
set termguicolors
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
let g:gruvbox_contrast_dark='soft'
highlight CocErrorSign ctermfg=15 ctermbg=196
highlight CocWarningSign ctermfg=0 ctermbg=172
colorscheme gruvbox

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
inoremap <C-q> <Esc>
inoremap <C-k> <Up>
inoremap <C-j> <Down>
inoremap <C-h> <Left>
inoremap <C-l> <Right>
inoremap <C-s> <Esc>:w<cr>
inoremap <C-x> <End><CR>
inoremap <C-o> <Home><CR><Up>
inoremap <C-b> <Esc>bi
inoremap <C-e> <Esc>ea
inoremap <C-c> <Del>
inoremap <C-d> <Esc><C-d>i
inoremap <C-u> <Esc><C-u>i
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

" --- plugins ---
source ~/.config/nvim/plugins.vim
