" Constants and basic configs
set paste           "use ctrl-p or cmd-p to paste
set number          "line numbers
set ignorecase      "ignore case while searching
set smartcase       "if camel-cased, dont ignore case
set incsearch       "instant search
set nocompatible    "non compatibe
set hlsearch        "Highlight the search term
set encoding=utf-8 " set the encoding to utf-8

" Pathogen Configuration
execute pathogen#infect()
filetype off
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

let python_highlight_all = 1

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

" let g:airline_powerline_fonts = 1
" let g:airline#extensions#tabline#enabled = 1

let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'
" Shell like behavior(not recommended).
set completeopt+=longest
let g:neocomplete#enable_auto_select = 1
let g:neocomplete#disable_auto_complete = 1
inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,.git/*,*/node_modules*/,*/bower_components/*

au BufNewFile,BufRead *.py,*js set colorcolumn=80

autocmd BufNewFile,BufRead *.cap   set syntax=ruby

let g:templates_directory = '~/.vim/templates'

"NerdTree"
"=========
nnoremap <leader>nt :NERDTreeToggle<cr>
nnoremap <leader>nn :NERDTree<cr>


"Vim-airline
"===========
let g:airline_theme='luna'
let g:airline_powerline_fonts = 0
"branch parts
let g:airline#extensions#branch#enabled = 1
"seperators
"let g:airline_left_sep = '▶'
"let g:airline_right_sep = '◀'
"modes
let g:airline_section_b="%{fugitive#head()}"
let g:airline_section_y=""
"let g:airline_section_gutter=""
let g:airline#extensions#whitespace#enabled = 0
" let g:airline#extensions#tabline#enabled = 1
