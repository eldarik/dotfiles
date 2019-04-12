" NOTE uncomment line if use native nvim in mac os
" set runtimepath^=~/.vim runtimepath+=~/.vim/after

setglobal nocompatible
setglobal pastetoggle=<F2>

set ttyfast
set lazyredraw

call plug#begin('~/.vim/plugged')
  Plug 'BlakeWilliams/vim-pry'
  Plug 'Xuyuanp/nerdtree-git-plugin'
  Plug 'airblade/vim-gitgutter'
  Plug 'altercation/vim-colors-solarized'
  Plug 'bfredl/nvim-miniyank'
  "Plug 'chemzqm/vim-jsx-improve', { 'for': 'javascript' }
  Plug 'chrisbra/csv.vim', { 'for': 'csv' }
  Plug 'ctrlpvim/ctrlp.vim'
  Plug 'ekalinin/Dockerfile.vim', { 'for': 'Dockerfile' }
  Plug 'elixir-editors/vim-elixir', { 'for': 'elixir' }
  "Plug 'elzr/vim-json'
  Plug 'fatih/vim-nginx', { 'for': 'nginx' }
  Plug 'hashivim/vim-terraform', { 'for': 'terraform' }
  Plug 'jeetsukumaran/vim-buffergator'
  Plug 'jiangmiao/auto-pairs'
  Plug 'jistr/vim-nerdtree-tabs'
  Plug 'mattn/emmet-vim', { 'for': 'html' }
  "Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }
  Plug 'scrooloose/nerdtree'
  Plug 'slim-template/vim-slim'
  Plug 'stephpy/vim-yaml', { 'for': 'yaml' }
  Plug 'tpope/vim-classpath'
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-haml', { 'for': 'haml' }
  Plug 'tpope/vim-rails', { 'for': 'ruby' }
  Plug 'tpope/vim-repeat'
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-unimpaired'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'vim-ruby/vim-ruby', { 'for': 'ruby' }
  Plug 'vim-scripts/paredit.vim'
  "Plug 'autozimu/LanguageClient-neovim', {
  "  \ 'branch': 'next',
  "  \ 'do': 'bash install.sh',
  "  \ }
  Plug 'leafgarland/typescript-vim'
call plug#end()

set number
set cursorline
set hlsearch
set nobackup
set nowritebackup
set nowb
set noswapfile
set runtimepath^=~/.vim/plugged/ctrlp.vim
set ignorecase
set smartcase

set langmap=йq,цw,уe,кr,еt,нy,гu,шi,щo,зp,х[,ъ],фa,ыs,вd,аf,пg,рh,оj,лk,дl,ж\\;,э',ё\\\,яz,чx,сc,мv,иb,тn,ьm,б\\,,ю.,ЙQ,ЦW,УE,КR,ЕT,НY,ГU,ШI,ЩO,ЗP,Х{,Ъ},ФA,ЫS,ВD,АF,ПG,РH,ОJ,ЛK,ДL,Ж:,Э\\\",Ё\\\|,ЯZ,ЧX,СC,МV,ИB,ТN,ЬM,Б<,Ю>

set tabstop=2 shiftwidth=2 expandtab
set lcs=tab:>¬,trail:~,space:·
set textwidth=100
set backspace=indent,eol,start
set clipboard=unnamedplus
set ruler
set list

" style
syntax enable
set background=dark
silent! colorscheme solarized
let g:solarized_termcolors=256

"nerdtree
"let g:nerdtree_tabs_open_on_console_startup=1
au Filetype nerdtree set nolist
let NERDTreeIgnore = ['\.pyc$', '\.retry$']
"autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
"autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

"airline config
let g:airline_theme='base16'
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_symbols.branch = '⌥'

"ctrlp not index files
let g:ctrlp_custom_ignore = '\.git\|\.hg\|\.svn\|node_modules\|assets\/images\|tmp\|bundle\|_build'
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

" Persistent Undo
" Keep undo history across sessions, by storing in file.
" Only works all the time.
if has('persistent_undo')
  silent !mkdir ~/.vim/backups > /dev/null 2>&1
  set undodir=~/.vim/backups
  set undofile
endif

" hotkeys
let mapleader=","

map <C-k> <C-w><Up>
map <C-j> <C-w><Down>
map <C-l> <C-w><Right>
map <C-h> <C-w><Left>

" translate tabs to spaces
map <F3> :retab<CR>

" Remove all trailing whitespace by pressing F4
map <F4> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>

" Ctrlp
" Clear cache of cltr.p
map <F5> :CtrlPClearCache<CR>
" Start search
map <leader>f :CtrlP<CR>
let g:ctrlp_map = '<,-f>'
let g:ctrlp_cmd = 'CtrlP'
" Unmap ctrl - p
" unmap <C-p>

" Tabs
map fj :tabprev<CR>
map fk :tabnext<CR>
" New tab
map fn :tabe<CR>
" Open same file in new tab
map fc :tab split<CR>
" Open object definition file in new tab
map gtf fc gf<CR>

map fq :q!<CR>

map <F2> :set invpaste paste?<CR>
set clipboard=unnamed
" Nerdtree toggle project's tree
map <Leader><Leader> :NERDTreeMirrorToggle<CR>

" Fix all lines to maximum length
map <F7> :%norm ggw<CR>

" Clear highlighted text
map ,r :nohlsearch<CR>

" Allow to copy/paste between VIM instances
" copy the current visual selection to ~/.vbuf
vmap <Leader>y :w! ~/.vbuf<CR>
" copy the current line to the buffer file if no visual selection
nmap <Leader>y :.w! ~/.vbuf<CR>
" paste the contents of the buffer file
nmap <Leader>p :r ~/.vbuf<CR>

" call debugger
nmap <leader>d :call pry#insert()<cr>

filetype plugin indent on

map p <Plug>(miniyank-autoput)

" Edit .vimrc
map <leader>vl :vsp $MYVIMRC<CR>
map <leader>vr :source $MYVIMRC<CR>

inoremap <C-J> <C-N>
inoremap <C-K> <C-P>
