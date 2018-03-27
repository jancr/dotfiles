
" tab stuff
"============================================================================
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set expandtab
set syntax=python
setf python

" allows ctrl+R + i to dump an ipdb trace
let @i='import colored_traceback.auto; import ipdb; ipdb.set_trace()'

let fn_path = "$HOME/.config/nvim/sourceforge/python_fn.vim"
if !filereadable(expand(fn_path))
	:! wget "https://vim.sourceforge.io/scripts/download_script.php?src_id=9196" -O "$HOME/.config/nvim/sourceforge/python_fn.vim"
endif

exec "source " . expand(fn_path)

