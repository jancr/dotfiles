

"============================================================================
"							Awesome Functions								=
"						And settings related to them						=
"============================================================================

" === Make shift operations in Visual mode stay in Visual mode afterwards ===
" vmap <expr> > ShiftAndKeepVisualSelection(">")
" vmap <expr> < ShiftAndKeepVisualSelection("<")

" function! ShiftAndKeepVisualSelection(cmd, mode)
	" set nosmartindent
	" if mode() =~ '[Vv]'
		" return a:cmd . ":set smartindent\<CR>gv"
	" else
		" return a:cmd . ":set smartindent\<CR>"
	" endif
" endfunction


" ===== Awesome line number magic BEGIN =====
" silent! suppresses error messages from before vim 7.3
nnoremap <Leader>l :call NumberToggle()<cr>
function! NumberToggle()
    if(&relativenumber == 1)
		call NumberLineDisable()
    else
		call NumberLineEnable()
    endif
endfunction

function! NumberLineDisable()
	silent! set nonumber
	silent! set norelativenumber
endfunction

function! NumberLineEnable()
	silent! set number
	silent! set relativenumber
endfunction

call NumberLineEnable()
autocmd FocusLost,InsertEnter * silent! call NumberLineDisable()
autocmd FocusGained,InsertLeave * silent! if mode() != 'c' | call NumberLineEnable() | endif
autocmd TermOpen * silent! call NumberLineDisable()

" ===== Awesome line number magic END =====
"
" ============================================================

