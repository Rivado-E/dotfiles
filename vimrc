" Enable syntax highlighting
syntax on

" Show line numbers
set number

" Enable relative line numbers (useful for navigating)
set relativenumber

" Set the default indentation settings
set tabstop=4        " Number of spaces for a tab
set shiftwidth=4     " Number of spaces for auto-indentation
set expandtab         " Convert tabs to spaces

" Enable line wrapping
set wrap

" Highlight search results
set hlsearch
set incsearch         " Show search matches as you type

" Enable smart case search
set ignorecase
set smartcase

" Show line and column number in the status line
set ruler

" Enable mouse support
set mouse=a

" Set the default clipboard to use the system clipboard
set clipboard=unnamedplus

" Enable incremental search
set incsearch

" Enable auto-completion
set wildmenu
set wildmode=list:longest,full

" Use the system clipboard for copy/paste
set clipboard+=unnamedplus

" Show matching parentheses and brackets
set showmatch

" Use a smaller scroll offset
set scrolloff=8

set nofoldenable
" Enable line number and cursor position in the status line
set statusline=%F\ %y\ %m\ %r\ %=%l,%c\ %p%%

" Use 256 colors in the terminal
set t_Co=256

" Enable line breaks
set linebreak

" Set the timeout length for key mappings
set timeoutlen=500

" Set default search to ignore case
set ignorecase

" Show line numbers in the gutter
set number

" Enable automatic indentation
set smartindent
set autoindent

" Set up a simple status line
set laststatus=2

" Turn on filetype detection
filetype plugin indent on

" Set a custom color scheme (optional)
" colorscheme desert

" Enable the 'foldmethod' to 'indent' for automatic folding
set foldmethod=indent

" Set the maximum number of lines to be displayed in the command line
set history=1000

colorscheme desert
