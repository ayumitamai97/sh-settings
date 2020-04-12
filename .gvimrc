" ツールバーを非表示にする
set guioptions-=T
" yでコピーした時にクリップボードに入る
set guioptions+=a
" メニューバーを非表示にする
set guioptions-=m
" 右スクロールバーを非表示
set guioptions+=R

set guifont=Monaco:h11

" デフォルトのウインドウサイズ
set lines=56
set columns=205

hi CursorLine guifg=NONE guibg=#333333
hi Search guibg=DarkGray
hi Search guifg=White

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
