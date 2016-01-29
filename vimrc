" vundle bundles
if filereadable(expand("~/.vimrc.bundles"))
  source ~/.vimrc.bundles
endif

syntax on

let mapleader=" "      " leader key

set clipboard=unnamed  " copy to system clipboard
" set paste            " copy from system clipboard and do NOT use this because it will disable many other options
set nu
set backspace=2
set textwidth=80
" set colorcolumn=+2

set hlsearch  " highlight search
set ic        " case insenstive search
set incsearch

" Softtabs, 2 spaces
set tabstop=2
set shiftwidth=2
set shiftround
set expandtab

set autowriteall  " save the file when you switch buffers
set autoindent

" List chars [copied from janus' config]
set list
set listchars=""                  " Reset the listchars
set listchars=tab:\ \             " a tab should display as "  ", trailing whitespace as "."
set listchars+=trail:.            " show trailing spaces as dots

" autocmd
" autocmd VimEnter * execute 'NERDTree' | wincmd p

" maps
nmap <leader>o :Tagbar<CR>           " toggle Tagbar
nmap <leader>n :NERDTree<CR>         " toggle NERDTree
nmap <leader>cn :NERDTreeClose<CR>   " close NERDTree

nmap <leader>r :source ~/.vimrc<CR>      " relaod vim config

" disable arrow keys
nnoremap <Left> <NOP>
nnoremap <Right> <NOP>
nnoremap <Up> <NOP>
nnoremap <Down> <NOP>

" option settings for plugins
let NERDTreeShowHidden=1
let g:ctrlp_show_hidden = 1
