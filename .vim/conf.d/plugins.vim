call plug#begin('~/.vim/plugged')

Plug 'ryanoasis/vim-devicons'
Plug 'preservim/nerdtree'

Plug 'junegunn/vim-easy-align'

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'sheerun/vim-polyglot'
" Plug 'leafOfTree/vim-vue-plugin'
Plug 'mattn/emmet-vim'
Plug 'tpope/vim-rails'
" Plug 'prettier/vim-prettier'

Plug 'kassio/neoterm'

if has('nvim')
  Plug 'Shougo/denite.nvim', { 'do': ':UpdateRemotePlugins' }
  " Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  " Plug 'junegunn/fzf.vim'
else
  Plug 'Shougo/denite.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif

call plug#end()

runtime! ./plugins/coc.vim
runtime! ./plugins/denite.vim
runtime! ./plugins/emmet-vim.vim
" runtime! ./plugins/fzf.vim
runtime! ./plugins/neoterm.vim
runtime! ./plugins/nerdtree.vim
runtime! ./plugins/vim-easy-align.vim
runtime! ./plugins/vim-polyglot.vue
