# hookup some basic shit on a new install

apt-get update
apt-get dist-upgrade
apt-get install sudo vim curl git unzip screen build-essential tmux rsync

export EDITOR=vim
visudo

# setup vim with pathogen, vim-sensible, and basic vim setup
mkdir -p ~/.vim/autoload ~/.vim/bundle
curl -Sso ~/.vim/autoload/pathogen.vim https://raw.github.com/tpope/vim-pathogen/master/autoload/pathogen.vim
cd ~/.vim/bundle
git clone git://github.com/tpope/vim-sensible.git
cd ~
echo 'execute pathogen#infect()' >> ~/.vimrc
echo 'set undodir^=~/.vim/undo' >> ~/.vimrc
mkdir ~/.vim/undo

# standard bashrc
cat << EOF > ~/.bashrc

export EDITOR=vim
export LS_OPTIONS='--color=auto'

eval "`dircolors`"

alias ls='ls $LS_OPTIONS'
alias ll='ls $LS_OPTIONS -lA'
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

HISTSIZE=5000
HISTCONTROL=ignoreboth
shopt -s histappend
shopt -s checkwinsize

PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '

EOF


# tmux config
cat << EOF > ~/.tmux.conf
unbind C-b
set -g prefix C-a

setw -g mode-mouse off
set -g mouse-select-pane off
set -g mouse-resize-pane off
set -g mouse-select-window off

set -g status-bg black
set -g status-fg white
set -g status-left '#[fg=green]#H'
set-window-option -g window-status-current-bg red

bind-key C-a last-window

set -g status-right '#[fg=yellow]#(uptime | cut -d"," -f2- | sed -e "s/ load average://")'

unbind %
bind | split-window -h
bind - split-window -v

setw -g automatic-rename
set-window-option -g mode-keys vi
EOF

# http shits
apt-get install lighttpd php5-cgi php5-common 

