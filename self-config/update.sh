sudo ln ./vimrc.local /etc/vim/
rm $HOME/.bashrc
ln .bashrc $HOME
ln .gitconfig $HOME

sudo sh install-starship.sh
