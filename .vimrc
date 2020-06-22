" まだ整理必要...
syntax on

" Thanks https://qiita.com/iwaseasahi/items/0b2da68269397906c14c
set t_Co=256
set backupskip=/tmp/*,/private/tmp/*
set number

" ファイルを上書きする前にバックアップを作ることを無効化
set nowritebackup
" ファイルを上書きする前にバックアップを作ることを無効化
set nobackup
" vim の矩形選択で文字が無くても右へ進める
set virtualedit=block
" 挿入モードでバックスペースで削除できるようにする
" set backspace=indent,eol,start
" 全角文字専用の設定
set ambiwidth=double
" wildmenuオプションを有効(vimバーからファイルを選択できる)
set wildmenu
" 行を折り返さない
set nowrap

set autoread

" ウインドウ分割の方向
set splitbelow
set splitright
" Vimでターミナルをエミュレートするときの実行コマンド
let &shell=$SHELL." --login"

if has('nvim')
  " exitフックを指定して:terminalを開く
  function! s:termopen_wrapper(on_exit) abort
    call termopen($SHELL, {'on_exit': function(a:on_exit)})
  endfunction

  " terminalの終了時にバッファを消すフック
  function! s:onTermExit(job_id, code, event) dict
    " Process Exitが表示されたその後cr打つとバッファが無くなるので
    " それと同じようにする
    call feedkeys("\<CR>")
  endfun

  " 水平分割でexit時に自動でcloseする行数sizeのターミナルバッファ表示
  function! TermHelper(...) abort
    let h_or_v = get(a:, 1, 'h') "デフォルトは水平分割
    let size = get(a:, 2, 15) "デフォルトは高さ(or幅)15のウィンドウ

    if h_or_v == 'h'
      "topleft new | call s:termopen_wrapper('s:onTermExit')
      botright new | Eterminal
      execute 'resize ' . size
    else
      "vertical botright new | call s:termopen_wrapper('s:onTermExit')
      vertical botright new | Eterminal
      execute 'vertical resize ' . size
    endif
  endfun

  " 水平ウィンドウ分割してターミナル表示 引数はwindowの行数指定(Horizontal terminal)
  command! -count=20 Hterminal :call TermHelper('h', <count>)
  " 垂直ウィンドウ分割してターミナル表示 引数はwindowの行数指定(Vertical terminal)
  command! -count=80 Vterminal :call TermHelper('v', <count>)
  " ウィンドウ分割なしでターミナル表示(Extended Terminal)
  command! Eterminal :call s:termopen_wrapper('s:onTermExit') | startinsert
else
  set termwinsize=20x0
endif

if has('gui_vimr')
  source ~/.vim/colors/cyber-wolf.vim
else
  colorscheme cyber-wolf
endif

"----------------------------------------
" 検索
"----------------------------------------
" 検索するときに大文字小文字を区別しない
set ignorecase
" 小文字で検索すると大文字と小文字を無視して検索
set smartcase
" 検索がファイル末尾まで進んだら、ファイル先頭から再び検索
set wrapscan
" インクリメンタル検索 (検索ワードの最初の文字を入力した時点で検索が開始)
set incsearch
" 検索結果をハイライト表示
set hlsearch
hi Search ctermbg=DarkGray
hi Search ctermfg=White

"----------------------------------------
" 表示設定
"----------------------------------------
set cursorline
hi CursorLine cterm=NONE ctermbg=236

" 行番号左のスペースの色
hi SignColumn ctermbg=NONE
" 行番号の背景色
hi LineNr ctermbg=NONE

" エラーメッセージの表示時にビープを鳴らさない
set noerrorbells
" 対応する括弧やブレースを表示
set showmatch matchtime=1
" インデント方法の変更
set cinoptions+=:0
set tabstop=2
" メッセージ表示欄を2行確保
set cmdheight=2
" ステータス行を常に表示
set laststatus=2
" ウィンドウの右下にまだ実行していない入力中のコマンドを表示
set showcmd
" 省略されずに表示
set display=lastline
" タブ文字を CTRL-I で表示し、行末に $ で表示する
set list
" 行末のスペースを可視化
set listchars=tab:^\ ,trail:~
" コマンドラインの履歴を10000件保存する
set history=10000
" Tabキーを押した時にタブ文字ではなく半角スペースを挿入
set expandtab
" インデント幅
set shiftwidth=2
" タブキー押下時に挿入される文字幅を指定
set softtabstop=2
" ファイル内にあるタブ文字の表示幅
set tabstop=2
" 対応する括弧を強調表示
set showmatch
" 改行時に入力された行の末尾に合わせて次の行のインデントを増減する
set smartindent
" 検索にマッチした行以外を折りたたむ(フォールドする)機能
set nofoldenable
" タイトルを表示
set title
" 行番号の表示
set number
" ヤンクでクリップボードにコピー
set clipboard+=unnamed
" Escの2回押しでハイライト消去
nnoremap <Esc><Esc> :nohlsearch<CR><ESC>
" F1 (help) をunmap
nmap <F1> :echo<CR>
" すべての数を10進数として扱う
set nrformats=
" 行をまたいで移動
" set whichwrap=b,s,h,l,<,>,[,],~
" バッファスクロール
set mouse=a

" auto reload .vimrc
augroup source-vimrc
  autocmd!
  autocmd BufWritePost *vimrc source $MYVIMRC | set foldmethod=marker
  autocmd BufWritePost *gvimrc if has('gui_running') source $MYGVIMRC
augroup END

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

" Commands, abbreviations
command Rp let @+ = join([expand("%"), line(".")], ":")
command Fp let @+ = expand("%:p")
command Cdc lcd %:p:h " 今開いているファイルのディレクトリにlcdする
cnoreabbrev cdc Cdc
command Rmself call delete(expand('%')) | Ex | echo 'Removed file'
cnoreabbrev rmself Rmself

" command! -nargs=0 Prettier :call CocAction('runCommand', 'prettier.formatFile')

" Ruby gems commands
if has('vim')
  let TermRspec = 'ter++noclose bundle exec rspec'
  command RspecFile execute join([TermRspec, expand('%')])
  cnoreabbrev rspf RspecFile
  command RspecCase execute join([TermRspec, join([expand('%'), line('.')], ':')])
  cnoreabbrev rspc RspecCase
  command Rubo ter++noclose bundle exec rubocop -a
  cnoreabbrev rubo Rubo
  command Eslint ter++noclose yarn run eslint --fix
  cnoreabbrev eslint Eslint
  command Stylelint ter++noclose yarn run stylelint --fix
  cnoreabbrev stylelint Stylelint

  " Slim syntax highlights
  execute pathogen#infect()
  filetype plugin indent on
endif

call plug#begin('~/.vim/plugged')

" Language Server
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'mattn/emmet-vim'
Plug 'prettier/vim-prettier'

if has('nvim')
  Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }
  Plug 'Shougo/denite.nvim', { 'do': ':UpdateRemotePlugins' }
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
else
  Plug 'Shougo/defx.nvim'
  Plug 'Shougo/denite.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif

call plug#end()

let g:lsp_diagnostics_echo_cursor = 1
let g:user_emmet_leader_key='<C-Z>'
let g:user_emmet_settings = {
\    'html' : {
\        'quote_char': '"',
\    },
\}

" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" GoTo code navigation.
" nmap <silent> gd <Plug>(coc-definition)
" nmap <silent> gy <Plug>(coc-type-definition)
" nmap <silent> gi <Plug>(coc-implementation)
" nmap <silent> gr <Plug>(coc-references)

" Add `:Format` command to format current buffer.
" command! -nargs=0 Format :call CocAction('format')

" defx
autocmd FileType defx call s:defx_my_settings()
function! s:defx_my_settings() abort
  nnoremap <silent><buffer><expr> <CR>
  \ defx#do_action('open_tree', 'toggle')
  nnoremap <silent><buffer><expr> h
  \ defx#do_action('cd', ['..'])
  nnoremap <silent><buffer><expr> l
  \ defx#do_action('open')
  nnoremap <silent><buffer><expr> P
  \ defx#do_action('open', 'pedit')
  nnoremap <silent><buffer><expr> o
  \ defx#do_action('open_tree', 'toggle')
  nnoremap <silent><buffer><expr> O
  \ defx#do_action('open', 'vsplit')
  nnoremap <silent><buffer><expr> K
  \ defx#do_action('new_directory')
  nnoremap <silent><buffer><expr> N
  \ defx#do_action('new_file')
  nnoremap <silent><buffer><expr> d
  \ defx#do_action('remove')
  nnoremap <silent><buffer><expr> r
  \ defx#do_action('rename')
  nnoremap <silent><buffer><expr> yy
  \ defx#do_action('yank_path')
  nnoremap <silent><buffer><expr> ~
  \ defx#do_action('cd')
  nnoremap <silent><buffer><expr> q
  \ defx#do_action('quit')
  nnoremap <silent><buffer><expr> <Space>
  \ defx#do_action('toggle_select') . 'j'
  nnoremap <silent><buffer><expr> *
  \ defx#do_action('toggle_select_all')
  nnoremap <silent><buffer><expr> j
  \ line('.') == line('$') ? 'gg' : 'j'
  nnoremap <silent><buffer><expr> k
  \ line('.') == 1 ? 'G' : 'k'
  nnoremap <silent><buffer><expr> cd
  \ defx#do_action('change_vim_cwd')
endfunction
