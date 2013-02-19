set hlsearch
set incsearch

" Set standard setting for PEAR coding standards
set tabstop=4
set shiftwidth=4

" Auto expand tabs to spaces
set expandtab

set autoindent
set smartindent

" Linewidth to endless
set textwidth=0

" Do not wrap lines automatically
set nowrap

" Jump 5 lines when running out of the screen
set scrolljump=5

" Indicate jump out of the screen when 3 lines before end of the screen
set scrolloff=3

" Repair wired terminal/vim settings
set backspace=start,eol

set laststatus=2
set statusline=%F%m%r%h%w\ \|\ FORMAT=%{&ff}\ \|\ TYPE=%Y\ \|\ ASCII=%03.3b\ \|\ ENCODING=%{&fenc?&fenc:&encoding}\ \|\ LINE=%03l\ \|\ %p%%\ \|\ LINES=%L
set number

set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'
Bundle 'motemen/git-vim.git'
Bundle 'mattn/zencoding-vim'
Bundle 'scrooloose/nerdtree'
Bundle 'rosenfeld/rgrep.vim'
Bundle 'flazz/vim-colorschemes'
Bundle 'altercation/vim-colors-solarized'

colorscheme ingretu
syntax on

" This function determines, wether we are on the start of the line text (then tab indents) or
" if we want to try autocompletion
function InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-p>"
    endif
endfunction

" Remap the tab key to select action with InsertTabWrapper
inoremap <tab> <c-r>=InsertTabWrapper()<cr>

nmap <S-n> :NERDTree<CR>
map th :tabfirst<CR>
map tj :tabnext<CR>
map tk :tabprevious<CR>
map tl :tablast<CR>
map tn :tabnew<CR>
map tc :tabclose<CR>
set directory=~/swap