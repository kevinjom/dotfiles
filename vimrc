" vundle bundles
if filereadable(expand("~/.vimrc.bundles"))
  source ~/.vimrc.bundles
endif

syntax on

set clipboard=unnamed  " copy to system clipboard
set paste  " copy from system clipboard
set nu
set backspace=2
set textwidth=80

" Softtabs, 2 spaces
set tabstop=2
set shiftwidth=2
set shiftround
set expandtab

set autowrite " save the file when you switch buffers

" disable arrow keys
nnoremap <Left> <NOP>
nnoremap <Right> <NOP>
nnoremap <Up> <NOP>
nnoremap <Down> <NOP>
