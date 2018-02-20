
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

