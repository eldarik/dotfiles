set number
set runtimepath^=~/.vim/bundle/ctrlp.vim
execute pathogen#infect()

set tabstop=2
set shiftwidth=2
set smarttab
set expandtab
syntax on
filetype plugin indent on
autocmd StdinReadPre * let s:std_in=1

autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

map <C-k> <C-w><Up>
map <C-j> <C-w><Down>
map <C-l> <C-w><Right>
map <C-h> <C-w><Left>

" Remove all trailing whitespace by pressing F5
map <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>

map fj :tabprev<CR>
map fk :tabnext<CR>
map fn :tabe<CR>
map fq :q<CR>
let g:nerdtree_tabs_open_on_console_startup=1
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
set showmode

let mapleader=","

map ,, :NERDTreeMirrorToggle<CR>

" Allow to copy/paste between VIM instances
" "copy the current visual selection to ~/.vbuf
vmap <Leader>y :w! ~/.vbuf<CR>
" "copy the current line to the buffer file if no visual selection
nmap <Leader>y :.w! ~/.vbuf<CR>
" "paste the contents of the buffer file
nmap <Leader>p :r ~/.vbuf<CR>

let g:buffergator_viewport_split_policy = "B"
let g:buffergator_sort_regime = "mru"
