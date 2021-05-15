if has('gui_running')
  if has('nvim')
    source ~/.config/nvim/colors/constellation-theme.vim
  else
    source ~/.vim/colors/constellation-theme.vim
  endif
else
  colorscheme constellation-theme
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
set ambiwidth=single
set nowrap
set autoread
set termguicolors

hi CursorLine cterm=NONE ctermbg=236
hi LineNr cterm=NONE ctermbg=NONE
hi CursorLineNr cterm=NONE ctermbg=236
hi Search ctermfg=White ctermbg=DarkGray
