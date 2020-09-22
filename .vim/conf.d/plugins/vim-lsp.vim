"----------------------------------------
" vim-lsp
" 未完
"----------------------------------------

if executable('gql-language-server')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'gql-language-server',
        \ 'cmd': {server_info->['gql-language-server']},
        \ })
endif
