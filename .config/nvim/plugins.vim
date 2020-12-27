" --- vim-plug autoload ---
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source ~/.config/nvim/init.vim
endif

" --- vim-plug plugins ---
call plug#begin('~/.config/nvim/plugged')
  " Plug 'kis9a/coc-hello', {'do': 'yarn install --frozen-lockfile && yarn build'}
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim', { 'on': [ 'Files', 'GFiles', 'Commands', 'Commits', 'Rg', 'Buffers', 'Maps', 'Marks' ] }
  Plug 'neoclide/coc.nvim', { 'branch': 'release' }
  " git
  Plug 'lambdalisue/gina.vim'
  Plug 'tpope/vim-fugitive'
  Plug 'jreybert/vimagit', { 'on': 'Magit' }

  " window
  Plug 'simeji/winresizer', { 'on': [ 'WinResizerStartFocus', 'WinResizerStartResize'] }

  " move
  Plug 'unblevable/quick-scope'

  " edit
  Plug 'tpope/vim-repeat'
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-commentary', { 'on': 'Commentary' }
  Plug 'alvan/vim-closetag', { 'for': ['html', 'jsx', 'tsx', 'vue', 'markdown'] }
  Plug 'mhinz/vim-grepper', { 'on': ['Grepper', '<plug>(GrepperOperator)'] }

  " utiles
  Plug 'luochen1990/rainbow'
  Plug 'terryma/vim-expand-region'
  Plug 'kshenoy/vim-signature'
  Plug 'stefandtw/quickfix-reflector.vim', { 'for': 'qf' }
  Plug 'voldikss/vim-translator'
  Plug 'thinca/vim-quickrun'
  Plug 'tyru/open-browser.vim'
  " Plug 'SirVer/ultisnips'
  Plug 'airblade/vim-rooter'
  Plug 'dstein64/vim-startuptime', { 'on': 'StartupTime' }
  Plug 't9md/vim-quickhl'
  Plug 'mbbill/undotree', { 'on': 'UndotreeToggle' }
  Plug 'easymotion/vim-easymotion'

  " color
  Plug 'guns/xterm-color-table.vim', { 'on': 'XtermColorTable' }
  Plug 'cocopon/colorswatch.vim', { 'on': 'ColorSwatchGenerate' }

  " markdown/documentation
  Plug 'tpope/vim-markdown', { 'for': 'markdown' }
  Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
  Plug 'iamcco/mathjax-support-for-mkdp', { 'for': 'markdown' }
  Plug 'aklt/plantuml-syntax', { 'for': 'uml' }
  Plug 'scrooloose/vim-slumlord', { 'for': 'uml' }
  " Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }

  " javascript/typescript
  Plug 'yuezk/vim-js', { 'for': ['js', 'ts', 'jsx', 'tsx'] }
  Plug 'leafgarland/typescript-vim', { 'for': ['js', 'ts', 'jsx', 'tsx'] }
  Plug 'pangloss/vim-javascript', { 'for': ['js', 'jsx', 'ts', 'tsx'] }
  " Plug 'maxmellon/vim-jsx-pretty', { 'for': ['js', 'ts', 'jsx', 'tsx'] }
  " Plug 'posva/vim-vue', { 'for': 'vue' }
  " Plug 'othree/yajs.vim', { 'for': ['js', 'jsx', 'ts', 'tsx'] }
  " Plug 'HerringtonDarkholme/yats.vim', { 'for': ['js', 'ts', 'jsx', 'tsx'] }

  " golang
  Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries', 'for': 'go' }

  " rust
  Plug 'rust-lang/rust.vim', { 'for': 'rust'}

  " data
  Plug 'cespare/vim-toml', { 'for': 'toml' }
  Plug 'jparise/vim-graphql', { 'for': 'graphql' }
  Plug 'towolf/vim-helm', { 'for': 'helm' }

  " vim
  Plug 'tbastos/vim-lua', { 'for': 'lua' }

  " clang
  Plug 'justmao945/vim-clang', { 'for': 'c' }
  Plug 'idanarye/vim-smile', { 'on': 'Smile' }
  Plug 'junegunn/goyo.vim', { 'on': 'Goyo' }
call plug#end()

" --- function ---
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

function! Wait(mil)
    let timetowait = a:mil . " m"
    exe 'sleep '.timetowait
endfunction

" --- plugin mapping
nnoremap <silent> ge :WinResizerStartResize<CR>
nnoremap <silent>gm :SignatureListGlobalMarks<CR>
nnoremap <silent>ga :Magit<CR>
nnoremap <silent>gr :Grepper<CR>
nnoremap gc :Grepper-cd 
nnoremap <silent><C-p> :GFiles!<CR>
nnoremap <silent>sp :Commands!<CR>
nnoremap <silent>sf :Files!<CR>
nnoremap <silent>sm :Marks!<CR>
nnoremap <silent>sg :Rg!<CR>
nnoremap <silent>sj :Buffers!<CR>
nnoremap <silent>sl :Lines!<CR>
nnoremap <silent>sc :Commits!<CR>
nnoremap <silent>s: :CocCommand<CR>
nnoremap <silent>sn :CocCommand explorer --sources=buffer+,file+ --width=60<CR>
nnoremap <silent><C-n> :CocCommand explorer --sources=buffer+,file+ --position=floating --floating-width=1000 --floating-height=1000<CR>
nnoremap <silent>s; :<C-u>CocList<cr>
nnoremap <silent>K :call <SID>show_documentation()<CR>
nnoremap <silent>su :UndotreeToggle<CR>
command! -nargs=0 Prettier :CocCommand prettier.formatFile
nnoremap <silent>sk :CocCommand prettier.formatFile<CR>
nmap sd <Plug>(coc-definition)
nmap sq <Plug>(coc-fix-current)
nmap st <Plug>(coc-type-definition)
nmap sh <Plug>(coc-references)
nmap sr <Plug>(coc-rename)
nmap sk <Plug>(coc-format)
let g:netrw_nogx = 1
nmap gx <Plug>(openbrowser-smart-search)
vmap gx <Plug>(openbrowser-smart-search)
vnoremap gc :Commentary<CR>
nnoremap <Leader>gn :Gina 
nmap <Leader>h <Plug>(quickhl-manual-this)
xmap <Leader>h <Plug>(quickhl-manual-this)
nmap <Leader>H <Plug>(quickhl-manual-reset)
xmap <Leader>H <Plug>(quickhl-manual-reset)
nmap <silent> <Leader>t <Plug>Translate
vmap <silent> <Leader>t <Plug>TranslateV
nmap <silent> <Leader>w <Plug>TranslateW
vmap <silent> <Leader>w <Plug>TranslateWV
nmap <silent> <Leader>l <Plug>TranslateR
vmap <silent> <Leader>l <Plug>TranslateRV
tnoremap <expr> <Esc> (&filetype == "fzf") ? "<Esc>" : "<c-\><c-n>"
nmap , <Leader><Leader>
nmap ,, <ESC><Plug>(easymotion-overwin-f)
nmap ,/ <ESC><Plug>(easymotion-overwin-f2)
autocmd CursorHold * silent call CocActionAsync('highlight')
command! -nargs=0 Format :call CocAction('format')
command! -nargs=? Fold :call CocAction('fold', <f-args>)
command! -nargs=0 OR   :call CocAction('runCommand', 'editor.action.organizeImport')

" ---- plugin valiables
let g:undotree_WindowLayout = 2
let g:undotree_SplitWidth = 50
let g:undotree_DiffpanelHeight = 10
let g:winresizer_start_key = '<Leader>e'
let g:closetag_filenames = "*.html,*.xhtml,*.phtml,*.php,*.jsx,*.vue,*,tsx"
let g:mkdp_echo_preview_url = 1
let g:go_fmt_command = "gofmt"
let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck']
let g:go_fmt_autosave = 1
let g:go_def_mapping_enabled = 0
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:qf_modifiable = 1
let g:qf_write_changes = 1
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']
let g:translator_target_lang='ja'
let g:vim_jsx_pretty_colorful_config = 1
let g:mkdp_auto_close=0
let g:mkdp_refresh_slow=1
let g:fzf_layout = {  'window': { 'yoffset': 0.05 , 'width': 1, 'height': 0.4 } }
let g:fzf_buffers_jump = 1
let g:coc_global_extensions = [
      \  'coc-git'
      \, 'coc-pairs'
      \, 'coc-explorer'
      \, 'coc-highlight'
      \, 'coc-snippets'
      \, 'coc-tabnine'
      \, 'coc-word'
      \, 'coc-json'
      \, 'coc-toml'
      \, 'coc-yaml'
      \, 'coc-go'
      \, 'coc-tsserver'
      \, 'coc-vetur'
      \, 'coc-react-refactor'
      \, ]

" treesitter
" lua <<EOF
" require'nvim-treesitter.configs'.setup {
"   ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
"   highlight = {
"     enable = true
"   },
" }
" EOF
