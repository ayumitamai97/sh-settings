set runtimepath+=$HOME/dotfiles/.vim/conf.d/

runtime! ./system.vim
runtime! ./keymap.vim
runtime! ./appearances.vim
runtime! ./search.vim
runtime! ./window.vim
runtime! ./input.vim
runtime! ./commands.vim

runtime! ./plugins.vim
runtime! ./plugins/defx.vim
runtime! ./plugins/coc.vim
runtime! ./plugins/emmet-vim.vim
runtime! ./plugins/vim-lsp-settings.vim
