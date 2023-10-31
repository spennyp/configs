set number "show the line number
syntax on "enable syntax highlighting
set tabstop=4 "make tab be 4 spaces
set shiftwidth=4 "similar^
set showmatch "shows matching brackets
set smarttab "autotab
set laststatus=2 "Show filepath at bottom
set statusline+=%t "Show only the file name (not full path)
set hlsearch "highlight searched items
set splitright "Makes vertical splits open to the right

"Vim plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif


call plug#begin('~/.vim/plugged')
    Plug 'morhetz/gruvbox' "Gruvbox color scheme
	Plug 'vim-airline/vim-airline' "vim-airline to get nice statusline with git branch names, etc
call plug#end()

colorscheme gruvbox "Applying the gruvbox theme
set bg=dark "Setting the background to dark

set backspace=indent,eol,start "Allow backspace in insert mode
