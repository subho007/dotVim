" Constants and basic configs
set paste           "use ctrl-p or cmd-p to paste
set number          "line numbers
set ignorecase      "ignore case while searching
set smartcase       "if camel-cased, dont ignore case
set incsearch       "instant search
set nocompatible    "non compatibe
set hlsearch        "Highlight the search term

" Pathogen Configuration
execute pathogen#infect()
syntax on

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

" Syntastic config
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let NERDTreeIgnore = ['\.pyc$']             "NERDTree ignore filetypes
let g:gitgutter_enabled = 0                 "Disable GitGutter by default
let g:email = "subho.halder@gmail.com"
let g:username = "Subho Halder"

set tabstop=4
set shiftwidth=4
au BufNewFile,BufReadPost *.coffee,*.rb,*.yml,*.yaml,*.js,*.jade setl tabstop=2 shiftwidth=2

set expandtab

filetype on
autocmd BufWritePost *.py call Flake8() "apply flake8 as files are saved
autocmd BufWritePre * :%s/\s\+$//e "Trim the line endings
syntax on

"I hate 'Modifiable is off' warnings. I dont properly understand how am I ending up with that error. This is a quick trick to restore writable state.
func! ModifiableOff()
    set modifiable
    set noreadonly
    set number
endfu
:com! ModOff call ModifiableOff()

filetype plugin indent on

"post Pathogen functions
if has("gui_running")
    set guifont=Monaco:h14      "favorite font
    set guioptions-=m           "remove menu bar
    set guioptions-=T           "remove toolbar
    set guioptions-=r           "remove right-hand scroll bar
    set fu                      "Goto full screen on mac
endif


set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,.git/*,*/node_modules*/,*/bower_components/*

au BufNewFile,BufRead *.py,*js set colorcolumn=80

autocmd BufNewFile,BufRead *.cap   set syntax=ruby

let g:templates_directory = '~/.vim/templates'

au BufNewFile,BufReadPost *.emblem,*.haml,*.py,*.coffee,*.jade set foldmethod=indent
