

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


" ===== Awesome line number magic =====
" silent! suppresses error messages from before vim 7.3
nnoremap <Leader>l :call NumberToggle()<cr>
function! NumberToggle()
    if(&relativenumber == 1)
		silent! set nonumber
		silent! set norelativenumber
    else
		silent! set number
		silent! set relativenumber
    endif
endfunction
autocmd FocusLost * silent! set norelativenumber
autocmd FocusGained * silent! set relativenumber

autocmd InsertEnter * silent! set norelativenumber
autocmd InsertLeave * silent! set relativenumber
silent! set number
silent! set relativenumber
" ============================================================

