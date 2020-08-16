" まだ整理必要...
syntax on

" Thanks https://qiita.com/iwaseasahi/items/0b2da68269397906c14c
" set t_Co=256
set backupskip=/tmp/*,/private/tmp/*
set number

set autoread

if has('gui_vimr')
  source ~/.vim/colors/cyber-wolf.vim
else
  colorscheme cyber-wolf
endif

" エラーメッセージの表示時にビープを鳴らさない
set noerrorbells
" すべての数を10進数として扱う
set nrformats=
set mouse=a

" auto reload .vimrc
augroup source-vimrc
  autocmd!
  autocmd BufWritePost *vimrc source $MYVIMRC | set foldmethod=marker
  autocmd BufWritePost *gvimrc if has('gui_running') source $MYGVIMRC
augroup END

if has('vim')
  " Slim syntax highlights
  execute pathogen#infect()
  filetype plugin indent on
endif

call plug#begin('~/.vim/plugged')

" Language Server
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'mattn/emmet-vim'
" Plug 'prettier/vim-prettier'
" Plug 'sheerun/vim-polyglot'

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

set runtimepath+=$HOME/.vim/conf.d

runtime! ./nmap.vim
runtime! ./appearances.vim
runtime! ./search.vim
runtime! ./window.vim
runtime! ./input.vim
runtime! ./terminal.vim
runtime! ./defx.vim
runtime! ./coc.vim
runtime! ./emmet-vim.vim
runtime! ./vim-lsp-settings.vim
