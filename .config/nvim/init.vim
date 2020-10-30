" --- setting ---
syntax on
filetype plugin on
let mapleader=" "
let maplocalleader=" "
set number
set number relativenumber
set encoding=UTF-8
set hidden
set cursorline
set autoindent
set tabstop=2
set shiftwidth=2
set timeoutlen=1000
set ttimeoutlen=0
set expandtab
set splitright
set clipboard=unnamed
set tags=./tags;$HOME
set background=dark
set nocompatible
set noswapfile

" --- color setting ---
colorscheme gruvbox
highlight Normal ctermbg=none
highlight NonText ctermbg=none
highlight LineNr ctermbg=none
highlight Folded ctermbg=none
highlight EndOfBuffer ctermbg=none
highlight StatusLine ctermbg=NONE cterm=NONE

" --- 0 keymapping ---
nnoremap x "_x
nnoremap s "_s
noremap <S-e>   $
noremap <S-b>   ^
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
nnoremap ; :
nnoremap : ;
nnoremap <C-j><C-j> <C-W>\| <C-W>_
nnoremap <C-j><C-k> <C-w>=
" vimtab
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
imap <C-k> <Up>
imap <C-j> <Down>
imap <C-h> <Left>
imap <C-l> <Right>
imap <C-s> <Esc>:w<cr>

" --- vimstatusbar ---
set noshowmode
set noruler
set laststatus=0
set noshowcmd

let s:hidden_all = 1
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

" --- commands ---
command! RmTrailing :%s/\s\+$//e
command! -bang Registers call s:registers('<bang>' ==# '!')

" --- plugins ---
" vim-plug install
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim  --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source ~/.config/nvim/init.vim
endif

" tmuxtmp install
if empty(glob('~/.tmux/plugins/tpm'))
  silent git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
endif

" vim-plug
call plug#begin('~/.local/share/nvim/plugged')
" plugin
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'dense-analysis/ale'
  Plug 'ryanoasis/vim-devicons'
  Plug 'preservim/nerdtree' |
        \ Plug 'Xuyuanp/nerdtree-git-plugin' |
        \ Plug 'ryanoasis/vim-devicons'
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  Plug 'junegunn/goyo.vim'
  Plug 'junegunn/vim-easy-align'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'tyru/open-browser.vim'
  Plug 'itchyny/calendar.vim'
  Plug 'easymotion/vim-easymotion'
  Plug 'terryma/vim-multiple-cursors'
  Plug 'alvan/vim-closetag'
  Plug 'ntpeters/vim-better-whitespace'
  Plug 'Yggdroot/indentLine'
  Plug 'SirVer/ultisnips'
  Plug 'rhysd/vim-grammarous'
  Plug 'junegunn/vim-easy-align'
  Plug 'leafgarland/typescript-vim'
  Plug 'cespare/vim-toml'
  Plug 'jiangmiao/auto-pairs'
  Plug 'tpope/vim-commentary'
  Plug 'tpope/vim-surround'
  Plug 'svermeulen/vim-easyclip'
  Plug 'tpope/vim-repeat'

" git
  Plug 'tpope/vim-fugitive'
  Plug 'airblade/vim-gitgutter'
  Plug 'tpope/vim-rhubarb'
  Plug 'junegunn/gv.vim'

" dorkpowers
  " Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }
  " Plug 'kristijanhusak/defx-git'
  " Plug 'Shougo/denite.nvim', { 'do': ':UpdateRemotePlugins' }
  " Plug 'Shougo/deol.nvim'

" golang
  Plug 'fatih/vim-go'

" documentation
  Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
  Plug 'iamcco/mathjax-support-for-mkdp'
  Plug 'aklt/plantuml-syntax'
  Plug 'weirongxu/plantuml-previewer.vim'
  Plug 'rhysd/vim-grammarous'

" javascript
  Plug 'yuezk/vim-js'
  Plug 'maxmellon/vim-jsx-pretty'
  Plug 'pangloss/vim-javascript', { 'for': ['javascript', 'javascript.jsx'] }
  Plug 'othree/yajs.vim', { 'for': ['javascript', 'javascript.jsx'] }
  Plug 'HerringtonDarkholme/yats.vim'
call plug#end()

" --- junegunn/fzf.vim ---
nnoremap <silent> <C-p> :GFiles<CR>
nnoremap <silent> <S-p> :GFiles?<CR>
nnoremap <silent> sp :Commands<CR>
nnoremap <silent> s: :Files<CR>
nnoremap <silent> sj :Buffers<CR>
nnoremap <silent> sh :History<CR>
nnoremap <silent> s; :History:<CR>
nnoremap <silent> sl :Lines<CR>
nnoremap <silent> st :Tags<CR>
nnoremap <silent> sc :Commits<CR>
nnoremap <silent> sm :Maps<CR>
nnoremap <silent> sa :Ag<CR>
nnoremap <silent> sr :Rg<CR>
nnoremap <silent> s<Tab> :Snippets<CR>

let $FZF_DEFAULT_OPTS="--color=dark --layout=reverse --margin=1,1 --color=fg:15,bg:-1,hl:1,fg+:#ffffff,bg+:0,hl+:1 --color=info:0,pointer:12,marker:4,spinner:11,header:-1"
let $FZF_DEFAULT_COMMAND="git ls-files --cached --others --exclude-standard || fd --type f --type l --hidden --follow"
let g:fzf_layout = {  'window': { 'yoffset': 0.05 ,'width': 1, 'height': 0.4 } }
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
let g:fzf_action = {
      \ 'ctrl-t': 'tab split',
      \ 'ctrl-x': 'split',
      \ 'ctrl-v': 'vsplit',
      \ 'ctrl-y': {lines -> setreg('*', join(lines, "\n"))}}

nnoremap <silent> <C-p> :Files<CR>
nnoremap <silent> <C-g> :GFiles<CR>
nnoremap <silent> <S-o> :Commands<CR>
nnoremap <silent> <C-p> :GFiles<CR>
nnoremap <silent> <S-p> :Commands<CR>
nnoremap <silent> <Leader><Enter> :Buffers<CR>
nnoremap <silent> <Leader>l :Lines<CR>

" --- preservim/nerdtree ---
nnoremap <C-n> :NERDTreeToggle<CR>
let g:NERDTreeWinSize = 40
let g:NERDTreeShowHidden=1
let g:NERDTreeGitStatusShowIgnored = 1

" --- terryma/vim-multiple-cursors ---
let g:multi_cursor_use_default_mapping=0
let g:multi_cursor_start_word_key      = '<C-m>'
let g:multi_cursor_select_all_word_key = '<A-n>'
let g:multi_cursor_start_key           = 'g<C-n>'
let g:multi_cursor_select_all_key      = 'g<A-n>'
let g:multi_cursor_next_key            = '<C-n>'
let g:multi_cursor_prev_key            = '<C-p>'
let g:multi_cursor_skip_key            = '<C-x>'
let g:multi_cursor_quit_key            = '<Esc>'

" --- easymotion/easymotion ---
nmap ss <Leader><Leader>s

" --- iamcco/markdown-preview.nvim ---
let g:mkdp_auto_close=0
let g:mkdp_refresh_slow=1
let g:mkdp_echo_preview_url = 1

" ---neoclide/coc ---
nnoremap <silent> <Leader>; :<C-u>CocList<cr>
nnoremap <silent> <space>h :<C-u>call CocAction('doHover')<cr>
nnoremap <silent> <space>df <Plug>(coc-definition)
nnoremap <silent> <space>rf <Plug>(coc-references)
nnoremap <silent> <space>rn <Plug>(coc-rename)
nnoremap <silent> <space>fmt <Plug>(coc-format)et hls
nnoremap <silent> <Leader>g :exe 'CocList -I --input='.expand('<cword>').' grep'<CR>
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
      \, 'coc-eslint'
      \, 'coc-prettier'
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
nnoremap <silent> <Leader>; :<C-u>CocList<cr>
nnoremap <silent> <space>h :<C-u>call CocAction('doHover')<cr>
nnoremap <silent> <space>df <Plug>(coc-definition)
nnoremap <silent> <space>rf <Plug>(coc-references)
nnoremap <silent> <space>rn <Plug>(coc-rename)
nnoremap <silent> <space>fmt <Plug>(coc-format)et hls
nnoremap <silent> <Leader>g :exe 'CocList -I --input='.expand('<cword>').' grep'<CR>

" --- analysis/ale ---
let g:ale_lint_on_text_changed = 0

" --- fatih/vim-go ---
let g:go_fmt_autosave = 1
let g:go_def_mapping_enabled = 0
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1

" vimwiki/vimwiki

let g:vimwiki_list = [{'path': '~/vimwiki/',
                      \ 'syntax': 'markdown', 'ext': '.md'}]

" --- airblade/vim-gitgutter ---
let g:gitgutter_highlight_lines = 0
set updatetime=250

" --- junegunn/goyo.vim ---
nnoremap <silent> <Leader>k gg:Goyo<CR>
let g:goyo_width = "90%"
let g:goyo_height = "90%"

" --- vim-airline/vim-airline ---
let g:airline_theme = 'base16_gruvbox_dark_hard'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 1
let g:airline_powerline_fonts = 1

" --- itchyny/calendar.vim ---
let g:calendar_google_calendar = 1
let g:calendar_google_task = 1
let g:calendar_view = "day"
let g:calendar_views = ['year', 'month', 'week', 'day', 'clock' ]
source ~/.cache/calendar.vim/credentials.vim

" --- maxmellon/vim-jsx-pretty ---
let g:vim_jsx_pretty_colorful_config = 1

" --- dorkpowers ---
" source ~/.config/nvim/plugins/defx.rc.vim
" source ~/.config/nvim/plugins/denite.rc.vim
" source ~/.config/nvim/plugins/deol.rc.vim

" --- Shougo/denite.nvim ---
" nnoremap <silent><Leader>a :<C-u>Denite file buffer -split=floating file:new<CR>
" nnoremap <silent><Leader>b :<C-u>Denite buffer -split=floating file:new<CR>
" nnoremap <silent><Leader>f :<C-u>Denite file -split=floating file:new<CR>
" nnoremap <silent><Leader>r :<C-u>Denite file/rec -split=floating file:new<CR>
" nnoremap <silent><Leader>gr :<C-u>Denite grep -buffer-name=search<CR>
" nnoremap <silent><Leader>, :<C-u>DeniteCursorWord grep -buffer-name=search line<CR>
" nnoremap <silent><Leader>gs :<C-u>Denite -resume -buffer-name=search<CR>
" nnoremap <silent><Leader>c :<C-u>Denite command_history -split=floating<CR>

" --- Shougo/defx.nvim ---
" autocmd VimEnter * execute 'Defx'
" nnoremap <silent><Leader>s :<C-u>Defx -listed -resume
"       \ -columns=git:indent:mark:icon:icons:filename:git:size
"       \ -buffer-name=tab`tabpagenr()`
"       \ `expand('%:p:h')` -search=`expand('%:p')`<CR>

" --- junegunn/vim-easyclip ---
nnoremap <silent> <Leader>y :Yanks<CR>
nnoremap <silent> sy :Registers<CR>
let g:EasyClipAutoFormat = 1
let g:EasyClipYankHistorySize = 20
let g:EasyClipShareYanks = 1

function! s:get_registers() abort
  redir => l:regs
  silent registers
  redir END

  return split(l:regs, '\n')[1:]
endfunction

function! s:registers(...) abort
  let l:opts = {
        \ 'source': s:get_registers(),
        \ 'sink': {x -> feedkeys(matchstr(x, '\v^\S+\ze.*') . (a:1 ? 'P' : 'p'), 'x')},
        \ 'options': '--prompt="Reg> "'
        \ }
  call fzf#run(fzf#wrap(l:opts))
endfunction

" --- rhysd/vim-grammarous ---
let g:grammarous#enable_spell_check=1
