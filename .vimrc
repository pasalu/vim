"Plugin settings -----------{{{
"Don't be compatible with vi.
set nocompatible

"Don't detect the type of file automatically.
filetype off

"Set the runtime path to include Vundle and initialize.
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

"Let Vudle manage Vundle, required.
Plugin 'VundleVim/Vundle.vim'

"Install colorscheme kolor.
Plugin 'solarized'

"Keep Plugin commands between vundle#begin/end.
call vundle#end()

"Enable autosave on Vim startup
let g:auto_save = 1

"Load filetype specific indentation.
filetype plugin indent on

"Set global and local leader
let mapleader = "-"
let maplocalleader = "\\"
"}}}

"Editing settings ---------------------{{{
"Move a line down
nnoremap <leader>- ddp
"Move a line up
nnoremap <leader>_ ddkkp

"Convert a word to uppercase
inoremap <leader><c-u> <esc>bveUe<esc>a
nnoremap <leader><c-u> bvwU

"Surround with quotes.
nnoremap <leader>" viw<esc>a"<esc>hbi"<esc>lel
vnoremap <leader>" <esc>`<i"<esc>`>la"<esc>

"Operator pending mapping for around next/last parentheses.
onoremap in( :<c-u>normal! f(vi(<cr>
onoremap il( :<c-u>normal! F)vi(<cr>
"Operator pending mapping for around next/last curly brackets.
onoremap in{ :<c-u>normal! f{vi{<cr>
onoremap il{ :<c-u>normal! F{vi{<cr>
"}}}

".vimrc settings --------------{{{
"Edit vimrc
nnoremap <leader>ev :split $MYVIMRC<cr>
"Source vimrc
nnoremap <leader>sv :source $MYVIMRC<cr>
"}}}

"Basic settings ----------------{{{
"Use jk to get back into normal mode.
inoremap jk <esc>

"Copy indentation from the previous line
set autoindent
"Indent after entering '{' and other special characters
set smartindent

"Don't wrap the text around when it doesn't fit the screen
set nowrap

"Allow backpacing over autoindent, line breaks, and at the start of indent
set backspace=indent,eol,start
"Number of spaces that a tab counts for visusally
set tabstop=4
"Number of spaces that are actually inserted.
set softtabstop=4
"Number of spaces used for autoindenting e.g. '>>'
set shiftwidth=4
"Convert tabs to spaces
set expandtab
"Show tabs and trailing whitespace. Also show arrows when text can't fit on
"the screen horizontally.
set list
set listchars=tab:��,trail:�,precedes:<,extends:>

"Find items as i type
set incsearch
"Be case insensitive
set ignorecase
"Assume upper and lower case characters unless upper case characters are used.
set smartcase

"Set the working directory to be the same as the current file.
autocmd BufEnter * silent! lcd %:p:h

"Start editing a file with all folds closed.
set foldlevelstart=0

"Turn on spell checking.
set spell

"Always show the status line (ruler, filename, etc.)
set laststatus=2

"Wrap lines after 79 characters.
set textwidth=79
"Wrap lines in insert mode.
set formatoptions-=l

"List files in a tree format
let g:netrw_liststyle=3

"Turn off the bell.
set belloff=all
"}}}

"Appearance settings -------------------{{{
set guifont=Consolas:h11:cANSI
"Remove right-hand scroll bar.
set guioptions-=r

"Syntax coloring on
syntax on

"Line and column information at the bottom of a buffer
set ruler

set background=dark
colorscheme solarized
"}}}

"Filetype specific settings ------------{{{
"Set tabstop, shiftwidth, and softtabstop to 2.
augroup elm
    autocmd!
    autocmd FileType elm :set tabstop=2 shiftwidth=2 softtabstop=2
augroup END

"Comments commands
augroup comments
    autocmd!
    autocmd FileType elm nnoremap <localleader>c I--<esc>
    autocmd FileType haskell nnoremap <localleader>c I--<esc>
    autocmd FileType python nnoremap <localleader>c I#<esc>
    autocmd FileType java nnoremap <localleader>c I//<esc>
augroup END

"Snippets for if statements
augroup snippets
    autocmd!
    autocmd FileType python iabbrev <buffer> iff if:<left>
    autocmd FileType elm iabbrev <buffer> iff if then<left><left><left><left>
augroup END

augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END
"}}}

"Set tabstop, softtabstop and shiftwidth to the same value {{{
"Taken from: http://vimcasts.org/episodes/tabs-and-spaces/
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
"}}}
