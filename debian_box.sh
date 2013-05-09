# hookup some basic shit on a new install

apt-get update
apt-get --yes dist-upgrade
apt-get install --yes sudo vim curl git unzip screen build-essential tmux rsync xtail

export EDITOR=vim
echo 'UseDns no' >> /etc/ssh/sshd_config
/etc/init.d/ssh reload


cd ~
git clone https://github.com/hoffoo/standard-box
/bin/cp -fb standard-box/tmux.conf .tmux.conf
/bin/cp -fb standard-box/bashrc .bashrc
/bin/cp -fb standard-box/vimrc .vimrc

# setup vim with pathogen, vim-sensible, and basic vim setup
mkdir -p ~/.vim/autoload ~/.vim/bundle ~/.vim/undo
curl -Sso ~/.vim/autoload/pathogen.vim https://raw.github.com/tpope/vim-pathogen/master/autoload/pathogen.vim
cd ~/.vim/bundle
git clone https://github.com/hoffoo/vim-sensible.git
git clone https://github.com/tpope/vim-sleuth.git
git clone https://github.com/tpope/vim-surround.git
git clone https://github.com/ervandew/supertab.git
git clone https://github.com/kien/ctrlp.vim.git
git clone https://github.com/Townk/vim-autoclose.git


# http shits
# apt-get install lighttpd php5-cgi php5-common 

