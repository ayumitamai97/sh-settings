call plug#begin('~/.vim/plugged')

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'mattn/emmet-vim'
" Plug 'prettier/vim-prettier'
" Plug 'sheerun/vim-polyglot'
Plug 'HerringtonDarkholme/yats.vim'

Plug 'junegunn/vim-easy-align'

" Plug 'ryanoasis/vim-devicons'

Plug 'jparise/vim-graphql'

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

xmap ga <Plug>(EasyAlign)
