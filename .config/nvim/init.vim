
set termguicolors

" share stuff between vim and neovim
"set runtimepath+=$HOME/.vim
"source $HOME/.vimrc

set encoding=utf-8
"
"autocmd! bufwritepost .vimrc source %
" ============================= vim-plug  ==============================
call plug#begin()
" On-demand loading
	Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
	if !has('nvim')
		Plug 'tpope/vim-sensible'
	endif

	Plug 'Valloric/YouCompleteMe'
	Plug 'scrooloose/nerdcommenter'
	"Plug 'vim-perl/vim-perl'
	"Plug 'freeo/vim-kalisi'
	Plug 'tpope/vim-surround'
	Plug 'vim-airline/vim-airline'
	Plug 'vim-airline/vim-airline-themes'
call plug#end()

filetype plugin indent on    " required
" ============================================================
" file type specific vim config
" ============================================================
autocmd BufNewFile,BufRead *.tex source $HOME/.config/nvim/rc/latex.vim
autocmd BufNewFile,BufRead *.py  source $HOME/.config/nvim/rc/python.vim

" ============================================================
" makes vim drop its tmp files inside the .vim folder
" ============================================================
set backupdir=~/.local/share/nvim/backup/
set directory=~/.local/share/nvim/swap/
set undodir=~/.local/share/nvim/undo/

" ALL hotkeys
" ============================================================
let  mapleader = ','
map <Leader>v :source ~jcr/.vimrc<CR>
noremap <C-s> :w<CR>
inoremap <C-s> <Esc>:w<CR>i

" use 2 letter custom leader command
noremap  <Leader>wc :%!column -t

"inoremap <S-left> <Esc>bi
"#inoremap <S-right> <Esc>wi
"inoremap "<S-h> <Esc>bi
"inoremap <S-l> <Esc>wi

"inoremap <A-left>>wi
"inoremap <A-right> normal w
"inoremap <A-h> normal b
"inoremap <A-l> normal w

" nnoremap <Leader>l :call NumberToggle()<cr>
" ============================================================


" ============================================================
" General option
" ============================================================
" enables hj and arrow keys warp to next next/previous line
set whichwrap+=<,>,h,l,[,]
"set matchpairs=(:),[:],{:},<:>
set matchpairs+=<:>,«:»



nnoremap . <NOP>
set autoread " reload file when changes happen in other editors
set tags=./tags

set mouse=a

" disable formatting when pasting large chunks of code
set pastetoggle=<F2>

" Disable stupid backup and swap files - they trigger too many events
" for file system watchers
"set nobackup
"set nowritebackup
"set noswapfile

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
"
" ============================================================
" Color scheme and other ‘estetics’
" ============================================================"
colorscheme wombat256mod
let g:airline_theme='badwolf'
"set t_Co=256
set colorcolumn=100
"set tw=100  " width of document (used by gd), default was 79
highlight ColorColumn ctermbg=233



" ============================================================
" makes yanked text be yanked into the global clipboard
" makes OSX clipboard work when vim is started in a tmux session
" ============================================================
set clipboard=unnamed
"if $TMUX == ''
"    set clipboard+=unnamed
"endif


" ============================================================
" Fold stuff
" ============================================================
set foldmethod=syntax
set foldmethod=indent
set foldlevel=99

" Make folds auto-open and auto-close when the cursor moves over them
" DELETE THIS IF IT IS ANOYING!!!!!
" DELETE THIS IF IT IS ANOYING!!!!!
" DELETE THIS IF IT IS ANOYING!!!!!
" DELETE THIS IF IT IS ANOYING!!!!!
set foldopen=all
set foldclose=all
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
"							Awesome Functions								=
"						And settings related to them						=
"============================================================================

" === Make shift operations in Visual mode stay in Visual mode afterwards ===
"    vmap <expr> > ShiftAndKeepVisualSelection(">")
"    vmap <expr> < ShiftAndKeepVisualSelection("<")
"
"    function! ShiftAndKeepVisualSelection(cmd, mode)
"        set nosmartindent
"        if mode() =~ '[Vv]'
"            return a:cmd . ":set smartindent\<CR>gv"
"        else
"            return a:cmd . ":set smartindent\<CR>"
"        endif
"    endfunction


" ===== Awesome line number magic =====
function! NumberToggle()
    if(&relativenumber == 1)
        set number
    else
        set relativenumber
    endif
endfunction
:au FocusLost * set number
:au FocusGained * set relativenumber
autocmd InsertEnter * set number
autocmd InsertLeave * set relativenumber
set number
set relativenumber
" ============================================================

"============================================================================
" Plugin specific stuff
"============================================================================
let g:NERDSpaceDelims = 1
let g:NERDCommentEmptyLines = 1



let g:pyflakes_use_quickfix = 0

