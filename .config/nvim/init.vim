let mapleader=" "
let maplocalleader=" "
set number
set number relativenumber
set encoding=utf-8
set hidden
set cursorline
set autoindent
set tabstop=2
set shiftwidth=2
set expandtab
set splitright
set clipboard=unnamed
set tags=./tags;$HOME
set background=dark
set nocompatible
set noswapfile

syntax on
filetype plugin on

nmap <Leader>- :sp<CR>
nmap <Leader>\ :vsp<CR>
nmap <Leader>r :so %<CR>

nnoremap x "_x
nnoremap s "_s

" color

colorscheme gruvbox 
noremap <S-e>   $
noremap <S-b>   ^
nnoremap <CR> A<CR><ESC>
nnoremap == gg=G''
nnoremap <C-]> g<C-]>zz
nnoremap <C-]> <ESC>g<C-]>
nnoremap <silent> <C-w>< :exe "vertical resize " . (winwidth(0) * 3/2)<CR>
nnoremap <silent> <C-w>> :exe "vertical resize " . (winwidth(0) * 2/3)<CR>

imap <C-k> <Up>
imap <C-j> <Down>
imap <C-h> <Left>
imap <C-l> <Right>

command! RmTrailing :%s/\s\+$//e

" color

colorscheme gruvbox
highlight Normal ctermbg=none
highlight LineNr ctermbg=none
highlight Folded ctermbg=none
highlight EndOfBuffer ctermbg=none 
highlight StatusLine ctermbg=NONE cterm=NONE

"" toggle statusline

" set noshowmode
" set noruler
" set laststatus=0
" set noshowcmd

let s:hidden_all = 0
function! ToggleHiddenAll()
    if s:hidden_all  == 0
        let s:hidden_all = 1
        set noshowmode
        set noruler
        set laststatus=0
        set noshowcmd
    else
        let s:hidden_all = 0
        set showmode
        set ruler
        set laststatus=2
        set showcmd
    endif
endfunction

nnoremap <S-q> :call ToggleHiddenAll()<CR>

"" tabpages

nnoremap t1 1gt
nnoremap t2 2gt
nnoremap t3 3gt
nnoremap t4 4gt
nnoremap t5 5gt

nnoremap tH  :tabfirst<CR>
nnoremap tl  :tabnext<CR>
nnoremap th  :tabprev<CR>
nnoremap tL  :tablast<CR>
nnoremap td  :tabclose<CR>
nnoremap tn :tabnew<CR>

" plugin

if empty(glob('~/.local/share/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source ~/.config/nvim/init.vim
endif

call plug#begin('~/.local/share/nvim/plugged')
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'dense-analysis/ale'
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  Plug 'scrooloose/nerdtree'
  Plug 'junegunn/goyo.vim'
  Plug 'easymotion/vim-easymotion'
  Plug 'terryma/vim-multiple-cursors'
  Plug 'tpope/vim-commentary'
  Plug 'tpope/vim-fugitive'
  Plug 'airblade/vim-gitgutter'
  Plug 'tpope/vim-surround'
  Plug 'alvan/vim-closetag'
  Plug 'ntpeters/vim-better-whitespace'
  Plug 'Yggdroot/indentLine'
  Plug 'SirVer/ultisnips'
  Plug 'svermeulen/vim-easyclip'
  Plug 'iamcco/mathjax-support-for-mkdp'
  Plug 'terryma/vim-multiple-cursors'
  Plug 'tpope/vim-commentary'
  Plug 'tpope/vim-fugitive'
  Plug 'airblade/vim-gitgutter'
  Plug 'tpope/vim-surround'
  Plug 'alvan/vim-closetag'
  Plug 'ntpeters/vim-better-whitespace'
  Plug 'Yggdroot/indentLine'
  Plug 'SirVer/ultisnips'
  Plug 'fatih/vim-go'
  Plug 'cespare/vim-toml'
  Plug 'rhysd/vim-grammarous'
  Plug 'junegunn/vim-easy-align'
  Plug 'pangloss/vim-javascript', { 'for': ['javascript', 'javascript.jsx'] }
  Plug 'othree/yajs.vim', { 'for': ['javascript', 'javascript.jsx'] }
  Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
  Plug 'leafgarland/typescript-vim'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'aklt/plantuml-syntax'
call plug#end()

" junegunn/fzf.vim

let $FZF_DEFAULT_OPTS = '--bind ctrl-a:select-all --no-border --no-margin'

let g:fzf_action = {
      \ 'ctrl-t': 'tab split',
      \ 'ctrl-x': 'split',
      \ 'ctrl-v': 'vsplit',
      \ 'ctrl-y': {lines -> setreg('*', join(lines, "\n"))}}

nnoremap <silent> <C-p> :Files<CR>
nnoremap <silent> <C-g> :GFiles<CR>
nnoremap <silent> <S-o> :Commands<CR>
" nnoremap <silent> <C-p> :Files<CR>
nnoremap <silent> <C-p> :GFiles<CR>
nnoremap <silent> <S-p> :Commands<CR>
nnoremap <silent> <Leader><Enter> :Buffers<CR>
nnoremap <silent> <Leader>l :Lines<CR>

" vim-multiple-cursors
let g:multi_cursor_use_default_mapping=0
let g:multi_cursor_start_word_key      = '<C-n>'
let g:multi_cursor_select_all_word_key = '<A-n>'
let g:multi_cursor_start_key           = 'g<C-n>'
let g:multi_cursor_select_all_key      = 'g<A-n>'
let g:multi_cursor_next_key            = '<C-n>'
let g:multi_cursor_prev_key            = '<C-p>'
let g:multi_cursor_skip_key            = '<C-x>'
let g:multi_cursor_quit_key            = '<Esc>'

" easymotion/easymotion

nmap s <Leader><Leader>s

" iamcco/markdown-preview.nvim

let g:mkdp_auto_close=0
let g:mkdp_refresh_slow=1

" scrooloose/nerdtree

let g:NERDTreeShowHidden=1
let g:NERDTreeAutoDeleteBuffer=1
let g:NERDTreeQuitOnOpen=0

nnoremap <silent> <expr> <C-C> g:NERDTree.IsOpen() ? "\:NERDTreeClose<CR>" : bufexists(expand('%')) ? "\:NERDTreeFind<CR>" : "\:NERDTree<CR>"

" neoclide/coc
highlight CocErrorSign ctermfg=15 ctermbg=196
highlight CocWarningSign ctermfg=0 ctermbg=172

let g:coc_global_extensions = [
      \  'coc-lists'
      \, 'coc-json'
      \, 'coc-go'
      \, 'coc-rls'
      \, 'coc-python'
      \, 'coc-html'
      \, 'coc-css'
      \, 'coc-tsserver'
      \, 'coc-snippets'
      \, 'coc-vetur'
      \, 'coc-toml'
      \ ]

nmap <silent> <Leader>; :<C-u>CocList<cr>
nmap <silent> <space>h :<C-u>call CocAction('doHover')<cr>
nmap <silent> <space>df <Plug>(coc-definition)
nmap <silent> <space>rf <Plug>(coc-references)
nmap <silent> <space>rn <Plug>(coc-rename)
nmap <silent> <space>fmt <Plug>(coc-format)et hls

" grep word under cursor
command! -nargs=+ -complete=custom,s:GrepArgs Rg exe 'CocList grep '.<q-args>

function! s:GrepArgs(...)
  let list = ['-S', '-smartcase', '-i', '-ignorecase', '-w', '-word',
        \ '-e', '-regex', '-u', '-skip-vcs-ignores', '-t', '-extension']
  return join(list, "\n")
endfunction

" Keymapping for grep word under cursor with interactive mode
nnoremap <silent> <Leader>gf :exe 'CocList -I --input='.expand('<cword>').' grep'<CR>


" analysis/ale
let g:ale_lint_on_text_changed = 0

" fatih/vim-go
let g:go_fmt_autosave = 1
let g:go_def_mapping_enabled = 0
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1

" vimwiki/vimwiki

let g:vimwiki_list = [{'path': '~/vimwiki/',
                      \ 'syntax': 'markdown', 'ext': '.md'}]

" airblade/vim-gitgutter

let g:gitgutter_highlight_lines = 0
set updatetime=250

"junegunn/goyo.vim
nnoremap <silent> <Leader>j gg:Goyo<CR>

nnoremap <C-Y><C-Y> :<C-U>FZFYank<CR>
inoremap <C-Y><C-Y> <C-O>:<C-U>FZFYank<CR>
inoremap <C-Y><C-Y> <C-O>:<C-U>FZFYank<CR>

" vim-airline/vim-airline
let g:airline_theme = 'base16_gruvbox_dark_hard'
let g:airline#extensions#tabline#enabled = 1