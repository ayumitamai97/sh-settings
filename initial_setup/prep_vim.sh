mkdir -p $HOME/.vim $HOME/.config/nvim
echo 'source $HOME/dotfiles/.vim/conf.d/init.vim' > $HOME/.vimrc
echo 'source $HOME/dotfiles/.vim/conf.d/init.vim' > $HOME/.config/nvim/init.vim

mkdir -p $HOME/.vim/colors $HOME/.config/nvim/colors $HOME/dev
export THEME_NAME='cyber-wolf'
export THEME_DIR=$HOME/dev/$THEME_NAME
if [ ! -d $HOME/dev/$THEME_NAME ]; then
  git clone git@github.com:ayumitamai97/$THEME_NAME.git $THEME_DIR;
fi
echo "source $THEME_DIR/v1/.vim/colors/cyber-wolf.vim" > $HOME/.vim/colors/$THEME_NAME.vim
echo "source $THEME_DIR/v1/.vim/colors/cyber-wolf.vim" > $HOME/.config/nvim/colors/$THEME_NAME.vim
