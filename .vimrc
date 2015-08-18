execute pathogen#infect()

"Set global and local leader
let mapleader = "-"
let maplocalleader = "\\"

"Move a line down
nnoremap <leader>- ddp
"Move a line up
nnoremap <leader>_ ddkkp

"Convert a word to uppercase
inoremap <leader><c-u> <esc>bveUe<esc>a
nnoremap <leader><c-u> bvwU

"Edit vimrc
nnoremap <leader>ev :split $MYVIMRC<cr>
"Source vimrc
nnoremap <leader>sv :source $MYVIMRC<cr>

"Automatically correct common spelling mistakes.
iabbrev ssig Peter Salu (psalua@gmail.com)
iabbrev teh the

"Surround with quotes.
nnoremap <leader>" viw<esc>a"<esc>hbi"<esc>lel
vnoremap <leader>" <esc>`<i"<esc>`>la"<esc>

"Force using jk to get back into normal mode.
inoremap jk <esc>
nnoremap <esc> <nop>

"Set tabstop, shiftwidth, and softtabstop to 2.
autocmd FileType elm :set tabstop=2 shiftwidth=2 softtabstop=2

"Comments commands
autocmd FileType elm nnoremap <localleader>c I--<esc>
autocmd FileType haskell nnoremap <localleader>c I--<esc>
autocmd FileType python nnoremap <localleader>c I#<esc>
autocmd FileType java nnoremap <localleader>c I//<esc>

"Snippets
autocmd FileType python iabbrev <buffer> iff if:<left>
autocmd FileType elm iabbrev <buffer> iff if then<left><left><left><left>

set autoindent "Copy indentation from the previous line 
set smartindent "Indent after entering '{' and other special characters

set nowrap "Don't wrap the text around when it doesn't fit the screen
syntax on "Syntax coloring on

set backspace=indent,eol,start "Allow backpacing over autoindent, line breaks, and at the start of indent
set tabstop=4 "Number of spaces that a tab counts for visusally
set softtabstop=4 "Number of spaces that are actually inserted.
set shiftwidth=4 "Number of spaces used for autoindenting e.g. '>>' 
set expandtab "Convert tabs to spaces
set guifont=Consolas:h11:cANSI

set ruler "Line and column information at the bottom of a buffer

set background=dark 
colorscheme kolor

filetype plugin indent on

set incsearch "Find items as i type
set ignorecase "Be case insensitive
set smartcase "Assume upper and lower case characters unless upper case characters are used.

let g:auto_save = 1 "Enable autosave on Vim startup

" Set tabstop, softtabstop and shiftwidth to the same value
" Taken from: http://vimcasts.org/episodes/tabs-and-spaces/
command! -nargs=* Stab call Stab()
function! Stab()
	let l:tabstop = 1 * input('set tabstop = softtabstop = shiftwidth = ')
	if l:tabstop > 0
		let &l:sts = l:tabstop
		let &l:ts = l:tabstop
		let &l:sw = l:tabstop
	endif
	call SummarizeTabs()
endfunction

function! SummarizeTabs()
	try
		echohl ModeMsg
		echon 'tabstop='.&l:ts
		echon ' shiftwidth='.&l:sw
		echon ' softtabstop='.&l:sts
		if &l:et
			echon ' expandtab'
		else
		echon ' noexpandtab'
		endif
	finally
		echohl None
	endtry
endfunction
