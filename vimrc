call plug#begin('~/.vim/plugged')
  Plug 'ctrlpvim/ctrlp.vim'
  Plug 'vim-scripts/paredit.vim'
  Plug 'scrooloose/nerdtree'
  Plug 'Xuyuanp/nerdtree-git-plugin'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'jeetsukumaran/vim-buffergator'
  Plug 'tpope/vim-classpath'
  Plug 'altercation/vim-colors-solarized'
  Plug 'airblade/vim-gitgutter'
  Plug 'jistr/vim-nerdtree-tabs'
  Plug 'tpope/vim-repeat'
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-fugitive'
  Plug 'elixir-lang/vim-elixir'
call plug#end()

set number

set runtimepath^=~/.vim/bundle/ctrlp.vim

set langmap=йq,цw,уe,кr,еt,нy,гu,шi,щo,зp,х[,ъ],фa,ыs,вd,аf,пg,рh,оj,лk,дl,ж\\;,э',ё\\\,яz,чx,сc,мv,иb,тn,ьm,б\\,,ю.,ЙQ,ЦW,УE,КR,ЕT,НY,ГU,ШI,ЩO,ЗP,Х{,Ъ},ФA,ЫS,ВD,АF,ПG,РH,ОJ,ЛK,ДL,Ж:,Э\\\",Ё\\\|,ЯZ,ЧX,СC,МV,ИB,ТN,ЬM,Б<,Ю>

set tabstop=2 shiftwidth=2 expandtab
set lcs=tab:>¬,trail:~,space:·

"nerdtree
"let g:nerdtree_tabs_open_on_console_startup=1
au Filetype nerdtree set nolist
"autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
"autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

syntax enable
set background=dark
colorscheme solarized
let g:solarized_termcolors=256

"airline config
let g:airline_theme='base16'
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_symbols.branch = '⌥'

"ctrlp
"not indexing files
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\.git$\|\.hg$\|\.svn$\|node_modules$'
    \ }

"hotkeys
let mapleader=","
map <C-k> <C-w><Up>
map <C-j> <C-w><Down>
map <C-l> <C-w><Right>
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
map <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
map ,, :NERDTreeMirrorToggle<CR>
map <F7> :%norm ggw

" Allow to copy/paste between VIM instances
" "copy the current visual selection to ~/.vbuf
vmap <Leader>y :w! ~/.vbuf<CR>
" "copy the current line to the buffer file if no visual selection
nmap <Leader>y :.w! ~/.vbuf<CR>
" "paste the contents of the buffer file
nmap <Leader>p :r ~/.vbuf<CR>


set textwidth=100
set backspace=indent,eol,start
set clipboard=unnamed
set ruler
set list
filetype plugin indent on
