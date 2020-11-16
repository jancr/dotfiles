set spell
set expandtab
set tabstop=4
set shiftwidth=4

let g:syntastic_tex_checkers = ['lacheck']
let g:syntastic_tex_lacheck_quiet_messages = { 
	\ 'regex': [
		\ 'possible unwanted space at', 
		\ '\Vdouble space at',
		\ 'Wrong length of dash'
	\ ], }

