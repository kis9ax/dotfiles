" --- vim-plug install --- {{{
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source ~/.config/nvim/init.vim
endif
"}}}

" PlugSnapshot{{{
" If you wan't version fix
" silent! let g:plugs['coc.nvim'].commit = '70e5a383cd1c5e39505ef016e8507e7daa4bc7dc'
" silent! let g:plugs['fzf'].commit = '1137404190be7cf51ba647b76f4be2a11cc7d85f'
" silent! let g:plugs['fzf.vim'].commit = '02a192ea0bed22a015e005b281e55e0da2a8e496'
" silent! let g:plugs['indentLine'].commit = '5617a1cf7d315e6e6f84d825c85e3b669d220bfa'
" silent! let g:plugs['markdown-preview.nvim'].commit = '9e11912fd1edb48c95865c817d2841972b6722c2'
" silent! let g:plugs['nvim-treesitter'].commit = '9d57216c0d94c9823c0d971caeaffb3b261e527e'
" silent! let g:plugs['quick-scope'].commit = 'd4c02b85ff168f7749833607536cb02281464c26'
" silent! let g:plugs['quickfix-reflector.vim'].commit = '8e9c05a110b80ab66fc8bc3d5fe9e6fa168aada6'
" silent! let g:plugs['vim-commentary'].commit = 'f8238d70f873969fb41bf6a6b07ca63a4c0b82b1'
" silent! let g:plugs['vim-fugitive'].commit = '601bf2e225af61bd64440f841f6d64dbb3d95be5'
" silent! let g:plugs['vim-grepper'].commit = 'e9004ce564891412cfe433cfbb97295cccd06b39'
" silent! let g:plugs['vim-rooter'].commit = '45ea40da3f223fff83fce0a643875e560ed20aae'
" silent! let g:plugs['vim-surround'].commit = 'f51a26d3710629d031806305b6c8727189cd1935'
" silent! let g:plugs['vista.vim'].commit = '9c97b935cb941a9fddcbbdc0eaf3e5e190f4847e'
" silent! let g:plugs['winresizer'].commit = 'e914728083536102c81281a2b2d0b81eec1e6bfb'
" PlugUpdate!
"}}}

call plug#begin('~/.config/nvim/plugged')
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim', { 'on': [ 'Files', 'GFiles', 'Commands', 'Commits', 'Buffers', 'Rg' ] }
" junegunn/fzf {{{
nnoremap <silent><C-p> :GFiles<CR>
nnoremap <silent>sp :Commands<CR>
nnoremap <silent>sf :Files<CR>
nnoremap <silent>sm :Marks<CR>
nnoremap <silent>sg :Rg!<CR>
nnoremap <silent>sj :Buffers<CR>
nnoremap <silent>sl :Lines<CR>
nnoremap <silent>sc :Commits<CR>
nnoremap <silent>s' :History:<CR>
let g:fzf_preview_window = []
let g:fzf_layout = {  'window': { 'yoffset': 0.05 , 'width': 1, 'height': 0.4, 'border': 'rounded' } }
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

"}}}
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
" neoclide/coc.nvim {{{
let g:coc_global_extensions = [
      \  'coc-git'
      \, 'coc-pairs'
      \, 'coc-prettier'
      \, 'coc-eslint'
      \, 'coc-explorer'
      \, 'coc-emmet'
      \, 'coc-highlight'
      \, 'coc-tabnine'
      \, 'coc-json'
      \, 'coc-toml'
      \, 'coc-yaml'
      \, 'coc-go'
      \, 'coc-diagnostic'
      \, 'coc-vimlsp'
      \, 'coc-word'
      \, 'coc-tsserver'
      \, 'coc-lua'
      \, 'coc-sh'
      \, 'coc-clangd'
      \, 'coc-phpls'
      \, 'coc-markdownlint'
      \, 'coc-html'
      \, 'coc-css'
      \, ]

nnoremap <silent><C-n> :CocCommand explorer --sources=file+ --width=45<CR>
nnoremap <silent><C-w>n :CocCommand explorer --sources=buffer+,file+ --position=floating --floating-width=10000 --floating-height=10000<CR>
nnoremap <silent>s: :CocCommand<CR>
nnoremap <silent>s; :<C-u>CocList<cr>
nnoremap <silent>K :call <SID>show_documentation()<CR>
nnoremap <silent>dg :CocCommand git.diffCached<CR>
nnoremap <silent>sk :CocCommand prettier.formatFile<CR>
command! -nargs=0 Prettier :CocCommand prettier.formatFile
nmap sd <Plug>(coc-definition)
nmap sq <Plug>(coc-fix-current)
nmap st <Plug>(coc-type-definition)
nmap sh <Plug>(coc-references)
nmap sr <Plug>(coc-rename)
nmap sk <Plug>(coc-format)

autocmd CursorHold * silent call CocActionAsync('highlight')

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction
"}}}
Plug 'liuchengxu/vista.vim', { 'on': 'Vista' }
" liuchengxu/vista.vim {{{
nnoremap <Leader>v :Vista!!<CR>
let g:vista_sidebar_width = 40
let g:vista_default_executive = 'coc'
"}}}
Plug 'simeji/winresizer', { 'on': [ 'WinResizerStartFocus', 'WinResizerStartResize'] }
" simeji/winresizer {{{
let g:winresizer_start_key = 'ge'
nnoremap <silent> ge :WinResizerStartResize<CR>
"}}}
Plug 'stefandtw/quickfix-reflector.vim', { 'for': 'qf' }
" stefandtw/quickfix-reflector.vim {{{
let g:qf_modifiable = 1
let g:qf_write_changes = 1
"}}}
Plug 'tpope/vim-commentary', { 'on': 'Commentary' }
" tpope/vim-commentary {{{
xnoremap <silent> gc :Commentary<CR>
nnoremap <silent> gc :Commentary<CR>
"}}}
Plug 'mhinz/vim-grepper', { 'on': 'Grepper' }
" mhinz/vim-grepper {{{
nnoremap <silent>gr :Grepper<CR>
nnoremap gp :Grepper-
nnoremap gk :Grepper-cd<CR>
nnoremap gb :Grepper-buffer<CR>
"}}}
Plug 'tpope/vim-fugitive'
Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }
Plug 'iamcco/markdown-preview.nvim', { 'for': 'markdown', 'on': 'MarkdownPreview' }
Plug 'unblevable/quick-scope'
" unblevable/quick-scope {{{
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']
let g:qs_lazy_highlight = 1
"}}}
Plug 'Yggdroot/indentLine'
" Yggdroot/indentLine {{{
let g:indentLine_faster = 1
let g:indentLine_char_list = ['¦', '┆', '┊']
"}}}
Plug 'airblade/vim-rooter'
Plug 'tpope/vim-surround'
" -- not usually {{{
" Plug 'gruvbox/gruvbox.vim'
" Plug 'vimwiki/vimwiki'
" Plug 'wakatime/vim-wakatime'
" Plug 'easymotion/vim-easymotion'
" Plug 'chr4/nginx.vim'
" Plug 'SirVer/ultisnips'
" Plug 'luochen1990/rainbow'
" Plug 'dstein64/nvim-scrollview'
" Plug 'dstein64/vim-startuptime', { 'on': 'StartupTime' }
" Plug 'thinca/vim-quickrun', { 'on': 'QuickRun' }
" Plug 'guns/xterm-color-table.vim', { 'on': 'XtermColorTable' }
" Plug 'cocopon/colorswatch.vim', { 'on': 'ColorSwatchGenerate' }
" Plug 'dhruvasagar/vim-table-mode', { 'for': 'markdown' }
" Plug 'lambdalisue/gina.vim', { 'on': 'Gina' }
" Plug 't9md/vim-quickhl', { 'on': 'QuickhlCwordToggle' }
" t9md/vim-quickhl {{{
" nnoremap <Leader>k :QuickhlCwordToggle<CR>
" nmap <Leader>h <plug>(quickhl-manual-this)
" xmap <Leader>h <plug>(quickhl-manual-this)
" nmap <Leader>H <plug>(quickhl-manual-reset)
" xmap <Leader>H <plug>(quickhl-manual-reset)
"}}}
" Plug 'kshenoy/vim-signature', { 'on': 'SignatureListGlobalMarks' }
" kshenoy/vim-signature {{{
" nnoremap <silent>gm :SignatureListGlobalMarks<CR>
"}}}
" Plug 'junegunn/vim-easy-align', { 'on': 'EasyAlign' }
" junegunn/vim-easy-align {{{
" =の代わりに使えるその他
" コマンド	説明
" =	一致した一つ目の=を基準に整列させる
" 2=	一致した二つ目の=を基準に整列させる
" *=	一致した全ての=を基準に整列させる
" **=	一致した全ての=を基準に左右交互に整列させる
" Enter	整列させる位置を（左/ 右/ 中央）で切り替える
" xmap ga <Plug>(EasyAlign)
" nmap ga <Plug>(EasyAlign)
"}}}
" Plug 'voldikss/vim-translator'
"" voldikss/vim-translator {{{
"let g:translator_target_lang='ja'
"nmap <silent> <Leader>t <Plug>Translate
"vmap <silent> <Leader>t <Plug>TranslateV
"nmap <silent> <Leader>w <Plug>TranslateW
"vmap <silent> <Leader>w <Plug>TranslateWV
"nmap <silent> <Leader>l <Plug>TranslateR
"vmap <silent> <Leader>l <Plug>TranslateRV
""}}}
" Plug 'mbbill/undotree', { 'on': 'UndotreeToggle' }
" -- mbbill/undotree -- {{{
" let g:undotree_WindowLayout = 2
" let g:undotree_SplitWidth = 50
" let g:undotree_DiffpanelHeight = 10
"}}}
" Plug 'junegunn/limelight.vim', { 'on': [ 'Limelight', 'Limelight!', 'Limelight!!' ] }
" junegunn/limelight.vim {{{
" autocmd! User GoyoEnter Limelight
" nnoremap <silent> <Leader>m :Limelight!!<CR>
" let g:limelight_default_coefficient = 0.4
"}}}
"}}}
call plug#end()

" treesitter{{{
lua <<EOF
require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
    indent = {
      enable = true
    }
  },
  ensure_installed = 'all'
}
EOF
"}}}
