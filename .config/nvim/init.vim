
set encoding=utf-8

" ============================= vim-plug  ==============================
call plug#begin()
" On-demand loading
	Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
	if !has('nvim')
		Plug 'tpope/vim-sensible'
	else
		set termguicolors
	endif

	" General:
	Plug 'Valloric/YouCompleteMe'
	Plug 'scrooloose/nerdcommenter'
	"Plug 'freeo/vim-kalisi'
	Plug 'tpope/vim-surround'
	Plug 'vim-airline/vim-airline'
	Plug 'vim-airline/vim-airline-themes'

	" Git:
	Plug 'tpope/vim-fugitive'

	" Color:
	Plug 'dracula/vim'

	" Markdown:
	Plug 'godlygeek/tabular'
	Plug 'plasticboy/vim-markdown'

	" Python:
	" Plug 'https://github.com/tweekmonster/impsort.vim'

	" Latex:
	Plug 'lervag/vimtex'
call plug#end()

let  mapleader = ','
filetype plugin indent on    " required

" ============================================================
" file type specific vim config
" ============================================================
" programming languages
autocmd BufNewFile,BufRead Snakefile,*.py,*.ipy  source $HOME/.config/nvim/rc/python.vim
autocmd BufNewFile,BufRead *.js  source $HOME/.config/nvim/rc/java_script.vim
autocmd BufNewFile,BufRead *.cs source $HOME/.config/nvim/rc/cs.vim
autocmd BufNewFile,BufRead *.c,*.cpp  source $HOME/.config/nvim/rc/c.vim
"autocmd BufNewFile,BufRead *.cpp  source $HOME/.config/nvim/rc/c.vim
" Other
autocmd BufNewFile,BufRead *.tex source $HOME/.config/nvim/rc/latex.vim
autocmd BufNewFile,BufRead *.md  source $HOME/.config/nvim/rc/markdown.vim
autocmd BufNewFile,BufRead *.html,*.xhtml  source $HOME/.config/nvim/rc/html.vim


" ============================================================
" makes vim drop its tmp files inside the .vim folder
" ============================================================
set backupdir=~/.local/share/nvim/backup/
set directory=~/.local/share/nvim/swap/
set undodir=~/.local/share/nvim/undo/
source $HOME/.config/nvim/rc/spell.vim

" ============================================================
" define variables (let clause)
" ============================================================
let npm_root = systemlist("npm root -g")[0]

" ============================================================
" ALL hotkeys
" ============================================================
source $HOME/.config/nvim/rc/map.vim

" ============================================================
" General option
" ============================================================
" enables hj and arrow keys warp to next next/previous line
set whichwrap+=<,>,h,l,[,]
"set matchpairs=(:),[:],{:},<:>
set matchpairs+=<:>,«:»

" nnoremap . <NOP>
set autoread " reload file when changes happen in other editors
set tags=./tags

set mouse=a

set history=5000

syntax enable
filetype plugin indent on
" ============================================================

" ============================================================
" Dont wrap lines
" ============================================================"
"set nowrap
"set nolinebreak
"set nolist  " list disables linebreak
set wrap
set linebreak
set nolist  " list disables linebreak
set textwidth=0
set wrapmargin=0

" ============================================================
" Color scheme and other ‘estetics’
" ============================================================"
colorscheme dracula
let g:airline_theme='badwolf'
set colorcolumn=100
"set tw=100  " width of document (used by gd), default was 79
highlight ColorColumn ctermbg=233

" ============================================================
" makes yanked text be yanked into the global clipboard
" makes OSX clipboard work when vim is started in a tmux session
" ============================================================
set clipboard=unnamedplus
if $TMUX == ''
    set clipboard+=unnamed
endif

" ============================================================
" Fold stuff
" ============================================================
set foldmethod=syntax
set foldmethod=indent
set foldlevel=99

" Make folds auto-open and auto-close when the cursor moves over them
"set foldopen=all
"set foldclose=all
"============================================================================
" Undu stuff
"============================================================================
if has('persistent_undo')
	set undofile
endif

set undolevels=5000

"============================================================================
" Tab stuff
"============================================================================
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround

"============================================================================
" Backspace stuff
"============================================================================
set bs=2 " make backspace behave like normal again
set backspace=indent,eol,start

set wildmode=list:longest " make TAB behave like in a shell
set wildignore+=*.pyc
set wildignore+=*_build/*
set wildignore+=*/coverage/*

"============================================================================
" Search  stuff
"============================================================================
set hlsearch
set incsearch
set ignorecase

set smartcase

" makes / and ? case insensitive
set ic
"============================================================================
" Source custom plugin settings
"============================================================================
source $HOME/.config/nvim/rc/plugins.vim

"============================================================================
" Source user defined functions
"============================================================================
source $HOME/.config/nvim/rc/functions.vim

"============================================================================
" Hacks (change stuff at the to overwrite plugin behavior
"============================================================================
" make background the terminals color:
hi Normal             ctermfg=252             ctermbg=none            cterm=none              guifg=#e3e0d7   guibg=NONE     gui=none


