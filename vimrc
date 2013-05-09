set nocursorline
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
set mouse=a
cnoreabbrev W w
set foldmethod=indent
set foldnestmax=10
set foldcolumn=0
set foldlevel=2
set foldminlines=1
set filetype=auto
syntax on

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

execute pathogen#infect()
if version >= 703
	set undodir^=~/.vim/undo
endif

" search for visual selection
vnoremap <silent> * :<C-U>
\let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
\gvy/<C-R><C-R>=substitute(
		\escape(@", '/\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
\gV:call setreg('"', old_reg, old_regtype)<CR>
vnoremap <silent> # :<C-U>
\let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
\gvy?<C-R><C-R>=substitute(
		\escape(@", '?\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
\gV:call setreg('"', old_reg, old_regtype)<CR>

function! MoveFile(newspec)
     let old = expand('%')
     " could be improved:
     if (old == a:newspec)
         return 0
     endif
     exe 'sav' fnameescape(a:newspec)
     call delete(old)
endfunction

command! -nargs=1 -complete=file -bar MoveFile call MoveFile('<args>')
