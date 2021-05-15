set backupskip=/tmp/*,/private/tmp/*
set noerrorbells
set nrformats=
set mouse=a

let MYVIMRC='$HOME/dotfiles/.vim/conf.d/init.vim'
augroup source-vimrc
  autocmd!
  autocmd BufWritePost $HOME/dotfiles/.vim/conf.d/*.vim source $MYVIMRC | set foldmethod=marker
  autocmd BufWritePost *gvimrc if has('gui_running') source $MYGVIMRC
augroup END
