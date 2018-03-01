" solve register empty problem
set clipboard=unnamed

" disable complete search from included file
set complete-=i

" Press F4 to toggle highlighting on/off, and show current value.
" noremap <F4> :set hlsearch! hlsearch?<CR>
set incsearch
set hlsearch
nnoremap <CR> :noh<CR><CR>

" comment spell checking, disable capital check
noremap <F5> :setlocal spell! spelllang=en_us<CR>

"set spell spelllang=en_us
set spellcapcheck=false

" The following line enables many vim features which might be otherwise turned
" off. If you have a .vimrc file it should be off by default anyways.
set nocp

" The following lines are necessary to get vim to work with ctags:

" Enable plugins (for OmniCppComplete)
filetype plugin on

" Set locations of tags file
set tags=~/.vim/tags

" Remap @q to close and compile
let @q=":wa:make"

set makeprg=ca

nnoremap ; :
vnoremap ; :

" These lines aren't necessary and I don't know what they do. They were
" recommended online. 
let OmniCpp_NamespaceSearch = 1
let OmniCpp_GlobalScopeSearch = 1
let OmniCpp_ShowAccess = 1
let OmniCpp_MayCompleteDot = 1
let OmniCpp_MayCompleteArrow = 1
let OmniCpp_MayCompleteScope = 1
let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]

" max copy paste 1000 lines, buffer size 1000
set viminfo='20,<1000,s1000

" Set the leader key to be spacebar
:let mapleader = "\<Space>"


" Helps add m in front of member variables
let @m=":%s//m\u&/gc"

" Ignores doxygen files when using command-t
set wildignore=doxygen*,*deprecated*

" Needed to initialize pathogen
execute pathogen#infect()
execute pathogen#helptags()


"
" Header source file jump
"

" Put vim_util.vim in your home directory
source ~/vim_util.vim

" Map ctrl + h to jump between source code and header
noremap  :call HeaderJump()
noremap  :call HeaderSplit()

" macro for quickly switching to ~/.vimrc file
:nnoremap <leader>ev :vsplit $MYVIMRC<cr>

" macro to quickly source ~/.vimrc file so you don't need
" to restart vim after adding a macro (such as with <leader>ev macro)
nnoremap <leader>sv ma<cr>:silent! source $MYVIMRC<cr>'azz

" quick exit out of insert mode
inoremap jk <esc>

autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

nnoremap gr :!git grep '\b<cword>\b' *<CR>
