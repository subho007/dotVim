"Pathogen Configuration
execute pathogen#infect()
syntax on
filetype plugin indent on

"Solarized configuration
syntax enable
set background=dark
colorscheme solarized

"Undo file cofigurations
" Put plugins and dictionaries in this dir (also on Windows)
let vimDir = '$HOME/.vim'
let &runtimepath.=','.vimDir
" Keep undo history across sessions by storing it in a file
if has('persistent_undo')
    let myUndoDir = expand(vimDir . '/undodir')
    " Create dirs
    call system('mkdir ' . vimDir)
    call system('mkdir ' . myUndoDir)
    let &undodir = myUndoDir
    set undofile
endif
