
"===============================================================================
" tab stuff
"===============================================================================
source $HOME/.config/nvim/rc/code.vim
setf python

" allows ctrl+R + i to dump an ipdb trace
let @i='import ipdb; ipdb.set_trace()  # noqa'

let fn_path = "$HOME/.config/nvim/sourceforge/python_fn.vim"
if !filereadable(expand(fn_path))
	:! wget "https://vim.sourceforge.io/scripts/download_script.php?src_id=9196" -O "$HOME/.config/nvim/sourceforge/python_fn.vim"
endif

exec "source " . expand(fn_path)


"===============================================================================
" YCM jedi hotkeys
"===============================================================================
" close the window __doc__ window when you have choosen a completion
" let g:ycm_autoclose_preview_window_after_completion=1
" 
" nnoremap <leader>g :YcmCompleter GoToDefinitionElseDeclaration<CR>
" show call signatures in the button of the screen
" set g:jedi#show_call_signatures=2


"===============================================================================
" Python UltiSnippets
"===============================================================================
" UltiSnipsAddFileTypes python

"===============================================================================
" Python Syntastic
"===============================================================================
" let g:syntastic_python_checkers=['flake8']
" let g:syntastic_python_checkers = ['python']
" let g:syntastic_python_python_exec = 'python3'

" map ]r and [r to nex and previous flake8 error
" noremap ]r :lnext<CR>
" noremap [r :lprevious<CR>



