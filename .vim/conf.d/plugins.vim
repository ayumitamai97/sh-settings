call plug#begin('~/.vim/plugged')

Plug 'ryanoasis/vim-devicons'
Plug 'preservim/nerdtree'

Plug 'junegunn/vim-easy-align'

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'sheerun/vim-polyglot'
Plug 'mattn/emmet-vim'
Plug 'tpope/vim-rails'
Plug 'codota/tabnine-vim'
" Plug 'prettier/vim-prettier'

if has('nvim')
  Plug 'Shougo/denite.nvim', { 'do': ':UpdateRemotePlugins' }
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  Plug 'ms-jpq/chadtree', {'branch': 'chad', 'do': ':UpdateRemotePlugins'}
else
  Plug 'Shougo/denite.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif

call plug#end()
