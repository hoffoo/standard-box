execute pathogen#infect()
if version >= 703
	set undodir^=~/.vim/undo
endif

set nocursorline
set backspace=eol,start,indent
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
set shiftwidth=4
set tabstop=4
set wmh=0
set autoindent
set smartindent
set nocindent
set mouse=a
cnoreabbrev W w
set foldmethod=indent
set foldnestmax=10
set foldcolumn=0
set foldlevel=2
set foldminlines=1


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
