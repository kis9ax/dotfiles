" --- vim-plug install --- {{{
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source ~/.config/nvim/init.vim
endif
"}}}

call plug#begin('~/.config/nvim/plugged')
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim', { 'on': [ 'Files', 'GFiles', 'Commands', 'Commits', 'Buffers' ] }
" junegunn/fzf {{{
nnoremap <silent><C-p> :GFiles<CR>
nnoremap <silent>gdi :Gdiffsplit@<CR>
nnoremap <silent>sp :Commands<CR>
nnoremap <silent>sf :Files<CR>
nnoremap <silent>sm :Marks<CR>
nnoremap <silent>sg :Rg!<CR>
nnoremap <silent>sj :Buffers<CR>
nnoremap <silent>sl :Lines<CR>
nnoremap <silent>sc :Commits<CR>
tnoremap <expr> <Esc> (&filetype == "fzf") ? "<Esc>" : "<c-\><c-n>"
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
      \, ]

nnoremap <silent><C-n> :CocCommand explorer --sources=file+ --width=45<CR>
nnoremap <silent><C-w>n :CocCommand explorer --sources=buffer+,file+ --position=floating --floating-width=10000 --floating-height=10000<CR>
nnoremap <silent>s: :CocCommand<CR>
nnoremap <silent>s; :<C-u>CocList<cr>
nnoremap <silent>K :call <SID>show_documentation()<CR>
nnoremap <silent>su :UndotreeToggle<CR>
command! -nargs=0 Prettier :CocCommand prettier.formatFile
nnoremap <silent>sk :CocCommand prettier.formatFile<CR>
nnoremap <silent>dg :CocCommand git.diffCached<CR>
nmap sd <Plug>(coc-definition)
nmap sq <Plug>(coc-fix-current)
nmap st <Plug>(coc-type-definition)
nmap sh <Plug>(coc-references)
nmap sr <Plug>(coc-rename)
nmap sk <Plug>(coc-format)

autocmd CursorHold * silent call CocActionAsync('highlight')
command! -nargs=0 Format :call CocAction('format')
command! -nargs=? Fold :call CocAction('fold', <f-args>)
command! -nargs=0 OR   :call CocAction('runCommand', 'editor.action.organizeImport')

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
vnoremap <silent> gc :Commentary<CR>
nnoremap <silent> gc :Commentary<CR>
"}}}
Plug 'mhinz/vim-grepper', { 'on': 'Grepper' }
" mhinz/vim-grepper {{{
nnoremap <silent>gr :Grepper<CR>
nnoremap gp :Grepper-
nnoremap gk :Grepper-cd<CR>
nnoremap gb :Grepper-buffer<CR>
"}}}
Plug 'tpope/vim-fugitive', { 'on': 'G' }
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
Plug 'wakatime/vim-wakatime'
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
