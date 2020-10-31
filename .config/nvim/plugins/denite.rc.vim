autocmd FileType denite call s:denite_my_settings()
function! s:denite_my_settings() abort
  nnoremap <silent><buffer><expr> <CR>
  \ denite#do_map('do_action')
  " ?o? ???????
  nnoremap <silent><buffer><expr> o
  \ denite#do_map('do_action')
  " ?s? ???????????????????
  nnoremap <silent><buffer><expr> s
  \ denite#do_map('do_action', 'split')
  " ?v? ???????????????????
  nnoremap <silent><buffer><expr> v
  \ denite#do_map('do_action', 'vsplit')
  " ?d? ?????????
  nnoremap <silent><buffer><expr> d
  \ denite#do_map('do_action', 'delete')
  " ?p? ???????????????
  nnoremap <silent><buffer><expr> p
  \ denite#do_map('do_action', 'preview')
  " ?ESC? / ?q? denite.nvim?????
  nnoremap <silent><buffer><expr> <Esc>
  \ denite#do_map('quit')
  nnoremap <silent><buffer><expr> q
  \ denite#do_map('quit')
  " ?i? ??????????
  nnoremap <silent><buffer><expr> i
  \ denite#do_map('open_filter_buffer')
  " ?SPACE? ???????????
  nnoremap <silent><buffer><expr> <Space>
  \ denite#do_map('toggle_select').'j'
endfunction

autocmd FileType denite-filter call s:denite_filter_my_settings()
function! s:denite_filter_my_settings() abort
  imap <silent><buffer> <C-o> <Plug>(denite_filter_quit)
endfunction
