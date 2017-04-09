set number
set runtimepath^=~/.vim/bundle/ctrlp.vim
execute pathogen#infect()

filetype plugin indent on
syntax on

colorscheme solarized
set tabstop=2 shiftwidth=2 expandtab

set lcs=tab:>¬,trail:~,space:·
au Filetype nerdtree set nolist
set list

set ruler
set backspace=indent,eol,start
set clipboard=unnamed

let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'

filetype plugin indent on
autocmd StdinReadPre * let s:std_in=1

autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

map <C-k> <C-w><Up>
map <C-j> <C-w><Down>
map <C-l> <C-w><Right>
map <C-h> <C-w><Left>

" translate tabs to spaces
map <F3> :retab

" Remove all trailing whitespace by pressing F5
map <F4> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>
" Clear cache of cltr.p
map <F5> :CtrlPClearCache

map fj :tabprev<CR>
map fk :tabnext<CR>
map fn :tabe<CR>
map fq :q<CR>
let g:nerdtree_tabs_open_on_console_startup=1
map <F2> :set invpaste paste?<CR>
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
let b:showSpaces = 1
