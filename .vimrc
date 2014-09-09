set autoindent "Copy indentation from the previous line 
set smartindent "Indent after entering '{' and other special characters

set nowrap "Don't wrap the text around when it doesn't fit the screen
syntax on "Syntax coloring on

set backspace=indent,eol,start "Allow backpacing over autoindent, line breaks, and at the start of indent
set tabstop=4 "Number of spaces that a tab counts for

set ruler "Line and column information at the bottom of a buffer

set background=dark 
colorscheme slate

filetype plugin on

autocmd filetype haskell set expandtab softtabstop=4 shiftwidth=4

set incsearch "Find items as i type
set ignorecase "Be case insensitive
set smartcase "Assume upper and lower case characters unless upper case characters are used.

