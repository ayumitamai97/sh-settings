autocmd FileType denite call s:denite_my_settings()
function! s:denite_my_settings() abort
  nnoremap <silent><buffer><expr> <CR>
  \ denite#do_map('do_action')
  nnoremap <silent><buffer><expr> d
  \ denite#do_map('do_action', 'delete')
  nnoremap <silent><buffer><expr> p
  \ denite#do_map('do_action', 'preview')
  nnoremap <silent><buffer><expr> q
  \ denite#do_map('quit')
  nnoremap <silent><buffer><expr> i
  \ denite#do_map('open_filter_buffer')
  nnoremap <silent><buffer><expr> <Space>
  \ denite#do_map('toggle_select').'j'
endfunction

let s:denite_winheight = 30
let s:denite_winrow = &lines > s:denite_winheight ? (&lines - s:denite_winheight) / 2 : 0
let s:denite_winwidth = &columns > 240 ? &columns / 2 : 120
let s:denite_wincol = &columns > s:denite_winwidth ? (&columns - s:denite_winwidth) / 2 : 0
call denite#custom#option('_', {
      \ 'cached_filter': v:true,
      \ 'cursor_shape': v:true,
      \ 'cursor_wrap': v:true,
      \ 'highlight_filter_background': 'DeniteFilter',
      \ 'highlight_matched_char': 'Underlined',
      \ 'prompt': '❯ ',
      \ 'split': 'floating',
      \ 'start_filter': v:true,
      \ 'statusline': v:false,
      \ 'wincol': s:denite_wincol,
      \ 'winheight': s:denite_winheight,
      \ 'winrow': s:denite_winrow,
      \ 'winwidth': s:denite_winwidth,
      \ })

augroup transparent-windows
  autocmd!
  autocmd FileType denite set winblend=10
  autocmd FileType denite-filter set winblend=10
augroup END

map <leader>f :Denite file/rec -match-highlight<cr>
