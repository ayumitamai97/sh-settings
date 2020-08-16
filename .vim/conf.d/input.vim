set cinoptions+=:0
set tabstop=2
" Tabキーを押した時にタブ文字ではなく半角スペースを挿入
set expandtab
" インデント幅
set shiftwidth=2
" タブキー押下時に挿入される文字幅を指定
set softtabstop=2
" set clipboard+=unnamed " For MacOS
set clipboard+=unnamedplus " For Ubuntu
" ヤンクでクリップボードにコピー
" Escの2回押しでハイライト消去
nnoremap <Esc><Esc> :nohlsearch<CR><ESC>
" 改行時に入力された行の末尾に合わせて次の行のインデントを増減する
set smartindent

" 保存時に行末のスペースを削除
autocmd BufWritePre * :%s/\s\+$//ge

" auto comment off
augroup auto_comment_off
  autocmd!
  autocmd BufEnter * setlocal formatoptions-=r
  autocmd BufEnter * setlocal formatoptions-=o
augroup END

" HTML/XML閉じタグ自動補完
augroup MyXML
  autocmd!
  autocmd Filetype xml inoremap <buffer> </ </<C-x><C-o>
  autocmd Filetype html inoremap <buffer> </ </<C-x><C-o>
augroup END

" 編集箇所のカーソルを記憶
if has("autocmd")
  augroup redhat
    " In text files, always limit the width of text to 78 characters
    autocmd BufRead *.txt set tw=78
    " When editing a file, always jump to the last cursor position
    autocmd BufReadPost *
    \ if line("'\"") > 0 && line ("'\"") <= line("$") |
    \   exe "normal! g'\"" |
    \ endif
  augroup END
endif

" 矢印キーを使わない
map <Up> <Nop>
map <Down> <Nop>
map <Left> <Nop>
map <Right> <Nop>
inoremap <Up> <Nop>
inoremap <Down> <Nop>
inoremap <Left> <Nop>
inoremap <Right> <Nop>

" ファイルを上書きする前にバックアップを作ることを無効化
set writebackup
" ファイルを上書きする前にバックアップを作ることを無効化
set backup

" vim の矩形選択で文字が無くても右へ進める
set virtualedit=block
