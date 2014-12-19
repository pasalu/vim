set autoindent "Copy indentation from the previous line 
set smartindent "Indent after entering '{' and other special characters

set nowrap "Don't wrap the text around when it doesn't fit the screen
syntax on "Syntax coloring on

set backspace=indent,eol,start "Allow backpacing over autoindent, line breaks, and at the start of indent
set tabstop=4 "Number of spaces that a tab counts for visusally
set softtabstop=4 "Number of spaces that are actually inserted.
set shiftwidth=4 "Number of spaces used for autoindenting e.g. '>>' 
set noexpandtab "Don't convert tabs to spaces

set ruler "Line and column information at the bottom of a buffer

set background=dark 
colorscheme slate

filetype plugin on

autocmd filetype haskell set expandtab

set incsearch "Find items as i type
set ignorecase "Be case insensitive
set smartcase "Assume upper and lower case characters unless upper case characters are used.

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
