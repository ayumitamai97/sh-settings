if has('gui_running')
  source ~/.vim/colors/cyber-wolf.vim
else
  colorscheme cyber-wolf
endif

syntax on

set cursorline
set title
set number
set cmdheight=2
set showcmd
set laststatus=2
set display=lastline
set list
set listchars=tab:^\ ,trail:~
set showmatch matchtime=1
set ambiwidth=double
set nowrap
set autoread
set termguicolors

hi CursorLine cterm=NONE ctermbg=236
hi LineNr cterm=NONE ctermbg=NONE
hi CursorLineNr cterm=NONE ctermbg=236
