" --- vim-plug autoload ---
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source ~/.config/nvim/init.vim
endif

" --- vim-plug plugins ---
call plug#begin('~/.config/nvim/plugged')


  Plug 'simeji/winresizer', { 'on': [ 'WinResizerStartFocus', 'WinResizerStartResize'] }
    let g:winresizer_start_key = '<Leader>e'
    nnoremap <Leader>e :WinResizerStartResize<CR>

  Plug 'zsugabubus/vim-jumpmotion', { 'on': '<Plug>(JumpMotion)' }
    map <LocalLeader> <Plug>(JumpMotion)
    highlight JumpMotion cterm=bold ctermfg=196 ctermbg=226 gui=bold guifg=#cc241d guibg=#ebcdb2
    highlight JumpMotionTail cterm=NONE ctermfg=196 ctermbg=226 gui=NONE guifg=#cc241d guibg=#ebcdb2


  Plug 'tpope/vim-commentary', { 'on': 'Commentary' }
  Plug 'tpope/vim-fugitive', { 'on': [ 'G', 'Ge', 'Gstatus', 'Gdiff', 'Glog', 'Gblame' ] }
  Plug 'cespare/vim-toml', { 'for': 'toml' }
  Plug 'alvan/vim-closetag', { 'for': ['html', 'jsx', 'tsx', 'vue', 'markdown'] }
    let g:closetag_filenames = "*.html,*.xhtml,*.phtml,*.php,*.jsx,*.vue,*,tsx"
  Plug 'tpope/vim-markdown', { 'for': 'markdown' }
  Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
    let g:mkdp_auto_close=0
    let g:mkdp_refresh_slow=1
    let g:mkdp_echo_preview_url = 1


  Plug 'iamcco/mathjax-support-for-mkdp', { 'for': 'markdown' }
  Plug 'yuezk/vim-js', { 'for': ['js', 'ts', 'jsx', 'tsx'] }
  Plug 'maxmellon/vim-jsx-pretty', { 'for': ['js', 'ts', 'jsx', 'tsx'] }
    let g:vim_jsx_pretty_colorful_config = 1

  Plug 'pangloss/vim-javascript', { 'for': ['js', 'jsx', 'ts', 'tsx'] }
  Plug 'leafgarland/typescript-vim', { 'for': ['js', 'ts', 'jsx', 'tsx'] }
  Plug 'othree/yajs.vim', { 'for': ['js', 'jsx', 'ts', 'tsx'] }
  Plug 'HerringtonDarkholme/yats.vim', { 'for': ['js', 'ts', 'jsx', 'tsx'] }
  Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries', 'for': 'go' }
    let g:go_fmt_autosave = 1
    let g:go_def_mapping_enabled = 0
    let g:go_highlight_types = 1
    let g:go_highlight_fields = 1
    let g:go_highlight_functions = 1
    let g:go_highlight_methods = 1

  Plug 'mhinz/vim-grepper', { 'on': ['Grepper', '<plug>(GrepperOperator)'] }
    nnoremap <Leader>g :Grepper

  Plug 'jparise/vim-graphql', { 'for': 'graphql' }
  Plug 'dstein64/vim-startuptime', { 'on': 'StartupTime' }

  Plug 'tpope/vim-repeat'
  Plug 'tpope/vim-surround'
  Plug 'stefandtw/quickfix-reflector.vim'
    let g:qf_modifiable = 1
    let g:qf_write_changes = 1

  Plug 'unblevable/quick-scope'
    highlight QuickScopePrimary guifg='#fb4934' gui=underline ctermfg=167 cterm=underline
    highlight QuickScopeSecondary guifg='#8ec07c' gui=underline ctermfg=108 cterm=underline
    let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']

  Plug 'SirVer/ultisnips'
    let g:UltiSnipsExpandTrigger="<tab>"
  Plug 'airblade/vim-rooter'
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim', { 'on': [ 'Files', 'GFiles', 'Commands', 'Commits', 'Rg', 'Buffers', 'Maps', 'Marks' ] }
    nnoremap <silent> <C-p> :GFiles<CR>
    nnoremap <silent> sp :Commands<CR>
    nnoremap <silent> sf :Files<CR>
    nnoremap <silent> sj :Buffers<CR>
    nnoremap <silent> sl :Lines<CR>
    nnoremap <silent> sc :Commits<CR>
    nnoremap <silent> sm :Marks<CR>
    nnoremap <silent> sg :Rg<CR>

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

  Plug 'neoclide/coc.nvim', { 'branch': 'release' }
    nnoremap <silent> s: :CocCommand<CR>
    nnoremap <silent> <C-n> :CocCommand explorer --sources=buffer+,file+ --width=50<CR>
    nnoremap <silent> K :call <SID>show_documentation()<CR>
    nnoremap <silent> s; :<C-u>CocList<cr>
    nmap <silent> sd <Plug>(coc-definition)
    nmap <silent> sq <Plug>(coc-fix-current)
    nmap <silent> st <Plug>(coc-type-definition)
    nmap <silent> sh <Plug>(coc-references)
    nmap <silent> sr <Plug>(coc-rename)
    nmap <silent> sk <Plug>(coc-format)
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
          \, 'coc-markdownlint'
          \, 'coc-go'
          \, 'coc-tsserver'
          \, ]

call plug#end()
