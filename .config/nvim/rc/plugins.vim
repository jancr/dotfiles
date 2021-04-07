
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
" :map ]r <Nop>
" :map [r <Nop>

" noremap ]r :lnext<CR>
" noremap [r :lprevious<CR>

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
