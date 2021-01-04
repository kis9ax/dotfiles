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
  " Plug 'lambdalisue/gina.vim'
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
  " Plug 'vimwiki/vimwiki'

  " utiles
  Plug 'junegunn/limelight.vim', { 'on': [ 'Limelight', 'Limelight!', 'Limelight!!' ] }
  " Plug 'luochen1990/rainbowl'
  " Plug 'terryma/vim-expand-region'
  " Plug 'kshenoy/vim-signature'
  Plug 'stefandtw/quickfix-reflector.vim', { 'for': 'qf' }
  " Plug 'voldikss/vim-translator'
  Plug 'dense-analysis/ale'
  " Plug 'dhruvasagar/vim-table-mode', { 'for': 'markdown' }
  Plug 'dhruvasagar/vim-table-mode'
  " Plug 'rhysd/vim-grammarous', { 'for': ['markdown', 'txt'] }
  " Plug 'reedes/vim-wordy'

  " Plug 'thinca/vim-quickrun'
  " Plug 'tyru/open-browser.vim'
  " Plug 'SirVer/ultisnips'
  " Plug 'embear/vim-localvimrc'
  Plug 'airblade/vim-rooter'
  Plug 'dstein64/vim-startuptime', { 'on': 'StartupTime' }
  Plug 't9md/vim-quickhl'
  " Plug 'mbbill/undotree', { 'on': 'UndotreeToggle' }
  " Plug 'easymotion/vim-easymotion'

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

  " Plug 'vim-scripts/dbext.vim'
  " Plug 'tpope/vim-dadbod'
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
nnoremap <silent><C-p> :GFiles<CR>
nnoremap <silent>gdi :Gdiffsplit@<CR>
nnoremap <silent>sp :Commands<CR>
nnoremap <silent>sf :Files<CR>
nnoremap <silent>sm :Marks<CR>
nnoremap <silent>sg :Rg!<CR>
nnoremap <silent>sj :Buffers<CR>
nnoremap <silent>sl :Lines<CR>
nnoremap <silent>sc :Commits<CR>
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
" let g:netrw_nogx = 1
" nmap gx <Plug>(openbrowser-smart-search)
" vmap gx <Plug>(openbrowser-smart-search)
vnoremap gc :Commentary<CR>
nnoremap <Leader>gn :Gina 
nmap <Leader>h <Plug>(quickhl-manual-this)
xmap <Leader>h <Plug>(quickhl-manual-this)
nmap <Leader>H <Plug>(quickhl-manual-reset)
xmap <Leader>H <Plug>(quickhl-manual-reset)
" nmap <silent> <Leader>t <Plug>Translate
" vmap <silent> <Leader>t <Plug>TranslateV
" nmap <silent> <Leader>w <Plug>TranslateW
" vmap <silent> <Leader>w <Plug>TranslateWV
" nmap <silent> <Leader>l <Plug>TranslateR
" vmap <silent> <Leader>l <Plug>TranslateRV
nnoremap <silent> <Leader>l :Limelight!!<CR>
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
" let g:translator_target_lang='ja'
let g:table_mode_corner = '|'
let g:vim_jsx_pretty_colorful_config = 1
let g:mkdp_auto_close=0
let g:mkdp_refresh_slow=1
let g:fzf_layout = {  'window': { 'yoffset': 0.05 , 'width': 1, 'height': 0.6 } }
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

" call ale#linter#Define('text', {
" \   'name': 'proselint',
" \   'executable': 'proselint',
" \   'command': 'proselint %t',
" \   'callback': 'ale#handlers#unix#HandleAsWarning',
" \})

" call ale#linter#Define('markdown', {
" \   'name': 'proselint',
" \   'executable': 'proselint',
" \   'command': 'proselint %t',
" \   'callback': 'ale#handlers#unix#HandleAsWarning',
" \})


" " 保存時のみ実行する
" let g:ale_lint_on_text_changed = 0
" " 表示に関する設定
" let g:ale_sign_error = ''
" let g:ale_sign_warning = ''
" let g:airline#extensions#ale#open_lnum_symbol = '('
" let g:airline#extensions#ale#close_lnum_symbol = ')'
" let g:ale_echo_msg_format = '[%linter%]%code: %%s'
" highlight link ALEErrorSign Tag
" highlight link ALEWarningSign StorageClass
" " Ctrl + kで次の指摘へ、Ctrl + jで前の指摘へ移動
" nmap <silent> <C-k> <Plug>(ale_previous_wrap)
" nmap <silent> <C-j> <Plug>(ale_next_wrap)
"   autocmd User ALELintPre  hi Statusline ctermfg=darkgrey
"   autocmd User ALELintPost hi Statusline ctermfg=NONE


  " ALE Plugin
"
let g:ale_sign_info = ''
let g:ale_sign_error = ''
let g:ale_sign_warning = ''
let g:ale_sign_priority = 4
let g:ale_open_list = 0
let g:ale_echo_msg_format = '%severity% [%linter%] (%code%) - %s'
let g:ale_echo_msg_info_str = ''
let g:ale_echo_msg_error_str = ''
let g:ale_echo_msg_warning_str = ''
let g:ale_writegood_options = '--no-passive'
let g:ale_virtualtext_cursor = 1
let g:ale_virtualtext_prefix = ' '

let g:ale_fixers = {
  \   '*': ['remove_trailing_lines', 'trim_whitespace'],
  \   'bib': ['bibclean'],
  \   'python': ['yapf'],
  \   'openapi': ['prettier'],
  \   'yaml': ['prettier'],
  \   'ruby': ['rubocop'],
  \   'kotlin': ['ktlint']
\}
  " \   'markdown': ['proselint'],

let g:ale_linters = {
  \   'asciidoc': ['vale'],
  \   'markdown': ['markdownlint', 'vale'],
  \   'dockerfile': ['dockerfile_lint'],
  \   'bib': ['bibclean'],
  \   'go': ['gofmt', 'golint', 'go vet', 'golangserver'],
  \   'latex': ['proselint', 'chktex', 'lacheck'],
  \   'tex': ['proselint', 'chktex', 'lacheck'],
  \   'plaintex': ['proselint', 'chktex', 'lacheck'],
  \   'help': [],
  \   'python': ['flake8', 'pylint', 'pyright'],
  \   'ruby': ['solargraph', 'rubocop', 'ruby'],
  \   'groovy': ['android'],
  \   'xml': ['android'],
  \   'java': ['android', 'checkstyle', 'javalsp'],
  \   'kotlin': ['ktlint', 'languageserver'],
  \   'javascript': ['eslint'],
  \   'text': ['proselint', 'write-good'],
  \   'vim': ['vint'],
  \   'yaml': ['yamllint'],
  \   'openapi': ['yamllint', 'ibm-validator'],
  \   'mail': ['proselint', 'write-good']
\}

let g:ale_pattern_options = {
\   '.gitlab-ci\.yml$': {
\       'ale_linters': ['gitlablint', 'yamllint'],
\   },
\}

let g:ale_linter_aliases = {
      \ 'asciidoctor': 'asciidoc'
      \}

let g:ale_kotlin_languageserver_executable = '/home/ryujin/Apps/KotlinLanguageServer/server/build/install/server/bin/kotlin-language-server'
let g:ale_java_javalsp_executable = '/home/ryujin/Apps/java-language-server/dist/lang_server_linux.sh'
let g:ale_sh_bashate_options = '-i E003 --max-lin-length 100'
let g:ale_reason_ls_executable = '/home/ryujin/Apps/rls-linux/reason-language-server'

let g:ale_java_eclipselsp_path = '/home/ryujin/Apps/eclipse.jdt.ls'

function ALELSPMappings()
  for linter in ale#linter#Get(&filetype)
    if !empty(linter.lsp) && ale#lsp_linter#CheckWithLSP(bufnr(''), linter)
      nnoremap <buffer> gk :ALEDocumentation<cr>
      nnoremap <buffer> gr :ALEFindReferences<cr>
      nnoremap <buffer> gd :ALEGoToDefinition<cr>
      nnoremap <buffer> gy :ALEGoToTypeDefinition<cr>
      nnoremap <buffer> gh :ALEHover<cr>
      setlocal omnifunc=ale#completion#OmniFunc
    endif
  endfor
endfunction

augroup ALEMappings
  autocmd BufRead,FileType * call ALELSPMappings()
augroup END

" let g:wordy#ring = [
"   \ 'weak',
"   \ ['being', 'passive-voice', ],
"   \ 'business-jargon',
"   \ 'weasel',
"   \ 'puffery',
"   \ ['problematic', 'redundant', ],
"   \ ['colloquial', 'idiomatic', 'similies', ],
"   \ 'art-jargon',
"   \ ['contractions', 'opinion', 'vague-time', 'said-synonyms', ],
"   \ 'adjectives',
"   \ 'adverbs',
"   \ ]
