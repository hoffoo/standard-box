set nocursorline
set backspace=indent,eol,start
set laststatus=2
set shell=/bin/bash
set scrolloff=5
set wrap
set nocompatible
set noswapfile
set number
set wrapmargin=0
set hlsearch
set nowrap
set wmh=0
set mouse=
set shiftwidth=4
set tabstop=4
set wmh=0
cnoreabbrev W w
" Make file with quickfix
command! -nargs=* Make write | make! <args> | cwindow

set foldmethod=indent
set foldnestmax=10
set foldcolumn=0
set foldlevel=2
set foldminlines=1
set filetype=auto
syntax on

set wildignore+=*.o
set wildignore+=*.class
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'

set pastetoggle=<F10>
inoremap <C-v> <F10><C-r>+<F10>
inoremap {<cr> {<cr>}<esc>O
let mapleader = 'm'
inoremap <c-e> <esc>A
map <cr> :w<cr>
map ; :w<CR>
map T :tabnew<cr>
map tn :tabn<cr>
map tp :tabp<cr>
map <leader>b :FufBuffer<cr>
map Q :q<cr>
map <leader>1 :set foldlevel=0<cr>
map <leader>2 :set foldlevel=1<cr>
map <leader>3 :set foldlevel=2<cr>
map ga :Git add %<cr>
map gc :Gcommit<cr>
map  <C-n> :noh<CR>
imap <C-n> <Esc>:noh<CR>
map  <C-J> <C-W>j<C-W>_
map  <C-K> <C-W>k<C-W>_
map gr :tabprev<cr>
map <C-c> "+y<CR>
" get rid of f1
nmap <F1> <nop>
map <F1> <Esc>
imap <F1> <Esc>
map <space> :Make<cr>

execute pathogen#infect()
if version >= 703
	set undodir^=~/.vim/undo
endif
