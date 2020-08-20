set cinoptions+=:0
set tabstop=2
set expandtab
set shiftwidth=2
set softtabstop=2
set clipboard+=unnamed,unnamedplus
nnoremap <Esc><Esc> :nohlsearch<CR><ESC>
set smartindent

autocmd BufWritePre * :%s/\s\+$//ge

augroup auto_comment_off
  autocmd!
  autocmd BufEnter * setlocal formatoptions-=r
  autocmd BufEnter * setlocal formatoptions-=o
augroup END

augroup MyXML
  autocmd!
  autocmd Filetype xml inoremap <buffer> </ </<C-x><C-o>
  autocmd Filetype html inoremap <buffer> </ </<C-x><C-o>
augroup END

if has("autocmd")
  augroup redhat
    autocmd BufRead *.txt set tw=78
    autocmd BufReadPost *
    \ if line("'\"") > 0 && line ("'\"") <= line("$") |
    \   exe "normal! g'\"" |
    \ endif
  augroup END
endif

set writebackup
set backup

set virtualedit=block
