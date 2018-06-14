
" make english default, and make wswitch language commands
set spellfile=~/.local/share/nvim/site/spell/en.utf-8.add
command! -bar SpellEn set spelllang=en spellfile=$HOME/.local/share/nvim/site/spell/en.utf-8.add
command! -bar SpellDa set spelllang=da spellfile=$HOME/.local/share/nvim/site/spell/da.utf-8.add

" regenerate .add.spl files fron .add files if new words has been added
" This is nessesary as .add files can be merged by git, but .spl files can't
" as they are binar
for d in glob('~/.local/share/nvim/site/spell/*.add', 1, 1)
    if filereadable(d) && (!filereadable(d . '.spl') || getftime(d) > getftime(d . '.spl'))
        exec 'mkspell! ' . fnameescape(d)
    endif
endfor
