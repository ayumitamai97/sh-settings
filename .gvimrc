set expandtab " Tabキーを押した時にタブ文字ではなく半角スペースを挿入
set tabstop=2 " 画面上でタブ文字が占める幅
set shiftwidth=2 " 自動インデントの幅
au FileType python set shiftwidth=2
au FileType ruby set shiftwidth=2

set smartindent

set autoread " ファイルに変更があった場合にauto-reload
set number
set cursorline
set formatoptions=q
set nowrap " 行の折り返し
set hlsearch " 検索結果をハイライト表示
set splitbelow
set termwinsize=20x0

set lines=56
set columns=205
set guifont=Monaco:h11

colorscheme vim-framer-syntax

set cursorline
hi CursorLine guifg=NONE guibg=#333333
hi Search guibg=DarkGray
hi Search guifg=White

" Fuzzy filename search 微妙
" http://kien.github.io/ctrlp.vim/#installation
set runtimepath^=~/.vim/bundle/ctrlp.vim

let &shell='/bin/bash --login' " read bash_profile when executing :terminal

command Rp let @+ = join([expand("%"), line(".")], ":")
command Fp let @+ = expand("%:p")
command Cdc lcd %:p:h " 今開いているファイルのディレクトリにlcdする
cnoreabbrev cdc Cdc
command Phil cd ~/phil
cnoreabbrev phil Phil
command Ging cd ~/s/g | e .
cnoreabbrev ging Ging
command Rmself call delete(expand('%')) | Ex | echo 'Removed file'
cnoreabbrev rmself Rmself

let g:terminal_ansi_colors = [
  \ "#0C0C0C", "#EE92D5", "#71F449", "#FFFA52",
  \ "#3D97F7", "#EB57F7", "#72F9FD", "#CCCCCC",
  \ "#767676", "#F092D4", "#97F787", "#FFFB8B",
  \ "#8CD4FA", "#EF8EF9", "#96FAFE", "#FFFFFF"
  \ ]

" correspondance:
"   "black",     "dark red",     "dark green", "brown",
"   "dark blue", "dark magenta", "dark cyan",  "light grey",
"   "dark grey", "red",          "green",      "yellow",
"   "blue",      "magenta",      "cyan",       "white"


" Ruby gems
let TermRspec = 'ter++noclose bundle exec rspec'
command RspecFile execute join([TermRspec, expand('%')])
cnoreabbrev rspf RspecFile
command RspecCase execute join([TermRspec, join([expand('%'), line('.')], ':')])
cnoreabbrev rspc RspecCase
command Rubo ter++noclose bundle exec rubocop -a
cnoreabbrev rubo Rubo

autocmd BufWritePre * :%s/\s\+$//ge

execute pathogen#infect()

filetype plugin indent on " Slimシンタックスハイライト
