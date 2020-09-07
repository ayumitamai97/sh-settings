call plug#begin('~/.vim/plugged')

" Language Server
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'mattn/emmet-vim'
" Plug 'prettier/vim-prettier'
" Plug 'sheerun/vim-polyglot'
Plug 'HerringtonDarkholme/yats.vim'

Plug 'junegunn/vim-easy-align'

if has('nvim')
  Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }
  Plug 'Shougo/denite.nvim', { 'do': ':UpdateRemotePlugins' }
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  Plug 'ryanoasis/vim-devicons'
  Plug 'ms-jpq/chadtree', {'branch': 'chad', 'do': ':UpdateRemotePlugins'}
else
  Plug 'Shougo/defx.nvim'
  Plug 'Shougo/denite.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif

call plug#end()

xmap ga <Plug>(EasyAlign)
