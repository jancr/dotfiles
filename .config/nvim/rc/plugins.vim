
"============================================================================
" Nerd Commentator
"============================================================================
let g:NERDAltDelims_c = 1
let g:NERDAltDelims_cpp = 1

let g:NERDSpaceDelims = 1
let g:NERDCommentEmptyLines = 1

"============================================================================
" source shellbridge
"============================================================================
" let shellbridge_rc = npm_root . "/shellbridge/editors/shellbridge.vim"
" if filereadable(shellbridge_rc)
	" exec 'source' shellbridge_rc
" endif

"============================================================================
" Syntastic
"============================================================================
" movements
" :map ]r :lnext<CR>
" :map [r :lprevious<CR>

:py3 << EOF
class Syntastic:
	@classmethod
	def get_count(cls):
		count = int(vim.eval('v:count'))
		if count == 0:
			count = ""
		return str(count)

	@classmethod
	def move(cls, command):
		count = cls.get_count()
		cmd = ":{}{}".format(count, command)
		print(cmd)
		vim.command(cmd)
EOF

:noremap ]r :py3 Syntastic.move("lnext")<CR>
:noremap [r :py3 Syntastic.move("lprevious")<CR>
