# hookup some basic shit on a new install

BACK=$(pwd)

apt-get update
#apt-get --yes dist-upgrade
apt-get install --yes sudo vim curl git unzip tmux build-essential rsync xtail dstat fail2ban pwgen mlocate ntp

export EDITOR=vim

if [[ $(grep 'UseDns' /etc/ssh/sshd_config) -ne 0 ]]
then
	echo 'UseDns no' >> /etc/ssh/sshd_config
	/etc/init.d/ssh reload
fi


cd ~
git clone https://github.com/hoffoo/standard-box
/bin/cp -fb standard-box/tmux.conf .tmux.conf
/bin/cp -fb standard-box/bashrc .bashrc
/bin/cp -fb standard-box/vimrc .vimrc

if [[ $(id -u $(whoami)) -ne 0 ]]
then
	echo "export PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '" >> .bashrc
else
	echo "export PS1='\[\033[01;31m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '" >> .bashrc
fi

# basic vim
mkdir -p ~/.vim/autoload ~/.vim/bundle ~/.vim/undo
curl -Sso ~/.vim/autoload/pathogen.vim https://raw.github.com/tpope/vim-pathogen/master/autoload/pathogen.vim

cd ~/.vim/bundle

git clone https://github.com/tpope/vim-sensible.git
git clone https://github.com/tpope/vim-sleuth.git
git clone https://github.com/tpope/vim-surround.git
git clone https://github.com/ervandew/supertab.git
git clone https://github.com/kien/ctrlp.vim.git
git clone https://github.com/Townk/vim-autoclose.git
git clone https://github.com/hoffoo/vim-marin-misc.git
git clone https://github.com/vim-scripts/Align.git
git clone https://github.com/christoomey/vim-tmux-navigator.git

cd $BACK

