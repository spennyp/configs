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
	Plug 'preservim/nerdtree' "nerdtree for file browsing
	Plug 'tpope/vim-fugitive' "vim-fugitive for git in vim
	Plug 'vim-airline/vim-airline' "vim-airline to get nice statusline with git branch names, etc
	Plug 'pangloss/vim-javascript' "js syntax highlighting
	Plug 'mxw/vim-jsx' "JSX syntax highlighting
	Plug 'w0rp/ale' "Linting engine
	Plug 'junegunn/fzf.vim' "fzf fuzzy finder
	Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } "make sure fzf is up to date
	Plug 'Valloric/YouCompleteMe' "You complete me tab completion
call plug#end()

colorscheme gruvbox "Applying the gruvbox theme
set bg=dark "Setting the background to dark

set backspace=indent,eol,start "Allow backspace in insert mode

let g:ycm_autoclose_preview_window_after_insertion = 1 "Autoclose YCM preview window when insertion mode is left

"Mapping ctr n to toggle nerdtree browser
nnoremap <C-n> :NERDTreeToggle<CR>

"fzf remaps
nnoremap <silent> <Leader>b :Buffers<CR>
nnoremap <silent> <C-f> :Files<CR>
nnoremap <silent> <Leader>f :Rg<CR>


"Save, and run python code in terminal to right side with F9
autocmd Filetype python map <buffer> <F9> :w<CR>:vert term python3 %<CR>

"Save, compile, and run C or C++ code in terminal to the right with F9
autocmd Filetype c map <buffer> <F9> :w<CR>:vertical terminal bash -c "gcc % -o %<.o && ./%<.o && rm ./%<.o"<CR>

"ALE linting config
let g:ale_fixers = {
\   'javascript': ['prettier', 'eslint'],
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\}
let g:ale_sign_error = '❌' " Less aggressive than the default '>>'
let g:ale_sign_warning = '⚠️'
"let g:ale_lint_on_enter = 0 " Less distracting when opening a new file
let g:ale_fix_on_save = 1 "Fix the file when I save


"Merge conflict bindings, h is for left pane (vim left key), l is for right
"pane (vim right key)
nnoremap :gd<CR> :Gvdiff<CR>
nnoremap gdh :diffget //2<CR>
nnoremap gdl :diffget //3<CR>
