" --- plugins ---
call plug#begin('~/.config/nvim/plugged')
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'dense-analysis/ale'
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-commentary'
  Plug 'alvan/vim-closetag'
  Plug 'simeji/winresizer'
  Plug 'romainl/vim-qf'
  Plug 'stefandtw/quickfix-reflector.vim'
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-rhubarb'
  Plug 'tpope/vim-markdown'
  Plug 'airblade/vim-rooter'
  Plug 'SirVer/ultisnips'
  Plug 'unblevable/quick-scope'
  Plug 'ryanoasis/vim-devicons'
  Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
  Plug 'iamcco/mathjax-support-for-mkdp'
  Plug 'tyru/open-browser.vim'
  Plug 'yuezk/vim-js'
  Plug 'maxmellon/vim-jsx-pretty'
  Plug 'pangloss/vim-javascript', { 'for': ['javascript', 'javascript.jsx'] }
  Plug 'othree/yajs.vim', { 'for': ['javascript', 'javascript.jsx'] }
  Plug 'HerringtonDarkholme/yats.vim'
  Plug 'leafgarland/typescript-vim'
  Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
  Plug 'dstein64/vim-startuptime'
  Plug 'kshenoy/vim-signature'
  Plug 'mhinz/vim-grepper', { 'on': ['Grepper', '<plug>(GrepperOperator)'] }
  " Plug 'p00f/nvim-ts-rainbow'
call plug#end()

" --- iamcco/markdown-preview.nvim ---
let g:mkdp_auto_close=0
let g:mkdp_refresh_slow=1
let g:mkdp_echo_preview_url = 1

" " --- vim-markdown ---
" let g:markdown_syntax_conceal = 0

" --- analysis/ale ---
let g:ale_lint_on_text_changed = 0

" --- fatih/vim-go ---
let g:go_fmt_autosave = 1
let g:go_def_mapping_enabled = 0
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1

" --- maxmellon/vim-jsx-pretty ---
let g:vim_jsx_pretty_colorful_config = 1

" ---  alvan/vim-closetag ---
let g:closetag_filenames = "*.html,*.xhtml,*.phtml,*.php,*.jsx,*.svelte,*.vue,*,tsx"

" unblevable/quick-scope
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']

" stefandtw/quickfix-reflector.vim
let g:qf_modifiable = 1
let g:qf_write_changes = 1

" SirVer/ultisnips
let g:UltiSnipsExpandTrigger="<tab>"

" --- junegunn/fzf.vim ---
nnoremap <silent> <C-p> :GFiles<CR>
nnoremap <silent> sp :Commands<CR>
nnoremap <silent> sf :Files<CR>
nnoremap <silent> sj :Buffers<CR>
nnoremap <silent> sh :History<CR>
nnoremap <silent> s; :History:<CR>
nnoremap <silent> sl :Lines<CR>
nnoremap <silent> sc :Commits<CR>
nnoremap <silent> sm :Marks<CR>
nnoremap <silent> sg :Rg<CR>
nnoremap <silent> ss :Snippets<CR>

let $FZF_DEFAULT_OPTS="--color=dark --layout=reverse --color=border:#706859,fg:15,bg:-1,hl:1,fg+:#706859,bg+:0,hl+:1 --color=info:0,pointer:12,marker:4,spinner:11,header:-1"
let g:fzf_layout = {  'window': { 'yoffset': 0 ,'width': 1, 'height': 0.45 } }
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
nnoremap <silent> c: :CocCommand<CR>
nnoremap <silent> <C-n> :CocCommand explorer --sources=buffer+,file+ --width=55<CR>
nnoremap <silent> K :call <SID>show_documentation()<CR>
nnoremap <silent> c; :<C-u>CocList<cr>
nmap <silent> cd <Plug>(coc-definition)
nmap <silent> cq <Plug>(coc-fix-current)
nmap <silent> ct <Plug>(coc-type-definition)
nmap <silent> ch <Plug>(coc-references)
nmap <silent> cr <Plug>(coc-rename)
nmap <silent> cf <Plug>(coc-format)
tnoremap <expr> <Esc> (&filetype == "fzf") ? "<Esc>" : "<c-\><c-n>"

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

let g:coc_global_extensions = [
      \  'coc-pairs'
      \, 'coc-explorer'
      \, 'coc-prettier'
      \, 'coc-snippets'
      \, 'coc-tabnine'
      \, 'coc-word'
      \, 'coc-go'
      \, 'coc-tsserver'
      \, 'coc-json'
      \, 'coc-highlight'
      \, 'coc-git'
      \, 'coc-neosnippet'
      \, 'coc-yaml'
      \, 'coc-dictionary'
      \, 'coc-markdownlint'
      \, 'coc-fzf-preview'
      \, 'coc-vimtex'
      \, 'coc-vimlsp'
      \, ]

nnoremap <Leader>g :Grepper<CR>
