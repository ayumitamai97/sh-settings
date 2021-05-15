" 分割した設定ファイルを読み込めるようにする
set runtimepath+=$HOME/dotfiles/.vim/conf.d/

runtime! ./system.vim
runtime! ./keymap.vim
runtime! ./appearances.vim
runtime! ./search.vim
runtime! ./window.vim
runtime! ./input.vim
runtime! ./commands.vim
runtime! ./plugins.vim
