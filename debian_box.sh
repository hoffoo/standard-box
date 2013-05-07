# hookup some basic shit on a new install

apt-get update
apt-get dist-upgrade
apt-get install sudo vim curl git unzip screen build-essential tmux rsync

export EDITOR=vim

# setup vim with pathogen, vim-sensible, and basic vim setup
mkdir -p ~/.vim/autoload ~/.vim/bundle
curl -Sso ~/.vim/autoload/pathogen.vim https://raw.github.com/tpope/vim-pathogen/master/autoload/pathogen.vim
cd ~/.vim/bundle
git clone git://github.com/tpope/vim-sensible.git
cd ~
echo 'execute pathogen#infect()' >> ~/.vimrc
echo 'set undodir^=~/.vim/undo' >> ~/.vimrc
mkdir ~/.vim/undo

# http shits
apt-get install lighttpd php5-cgi php5-common 

