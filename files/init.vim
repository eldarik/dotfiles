set hidden
setglobal nocompatible
setglobal pastetoggle=<F2>
set updatetime=100
set cmdheight=1
set inccommand=nosplit
set splitright
set splitbelow
set ttyfast
set lazyredraw
set number
set cursorline
set cursorcolumn
set hlsearch
set nobackup
set nowritebackup
set nowb
set noswapfile
set ignorecase
set smartcase
set langmap=ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz
set tabstop=2 shiftwidth=2 expandtab
set lcs=tab:>¬,trail:~,space:·
" set textwidth=100
set backspace=indent,eol,start
set clipboard=unnamedplus
set ruler
set list
set signcolumn=yes
" set iskeyword-=_
syntax enable
filetype plugin indent on
let mapleader = "\<Space>"

if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

Plug 'BlakeWilliams/vim-pry'
nmap <leader>d :call pry#insert()<cr>
nmap <leader>в :call pry#insert()<cr>\n

Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'scrooloose/nerdtree'
"let g:nerdtree_tabs_open_on_console_startup=1
au Filetype nerdtree set nolist
let NERDTreeIgnore = ['\.pyc$', '\.retry$']
" let g:NERDTreeMinimalUI = 1
" let g:NERDTreeWinSize = 31
" let g:NERDTreeChDirMode = 2
 let g:NERDTreeAutoDeleteBuffer = 1
" let g:NERDTreeShowBookmarks = 1
" let g:NERDTreeCascadeOpenSingleChildDir = 1
" let g:NERDTreeDirArrows = 1
" let g:NERDTreeMouseMode=3
let g:NERDTreeShowHidden=1
map <leader><leader> :NERDTreeMirrorToggle<CR>
map <leader>n :NERDTreeFind<CR>
map <leader>т :NERDTreeFind<CR>

Plug 'airblade/vim-gitgutter'

Plug 'altercation/vim-colors-solarized'

Plug 'bfredl/nvim-miniyank'
map p <Plug>(miniyank-autoput)

"Plug 'chemzqm/vim-jsx-improve', { 'for': 'javascript' }
Plug 'chrisbra/csv.vim', { 'for': 'csv' }
Plug 'ekalinin/Dockerfile.vim', { 'for': 'Dockerfile' }
Plug 'elixir-editors/vim-elixir', { 'for': 'elixir' }
"Plug 'elzr/vim-json'
Plug 'fatih/vim-nginx', { 'for': 'nginx' }
Plug 'hashivim/vim-terraform', { 'for': 'terraform' }
Plug 'mattn/emmet-vim', { 'for': 'html' }
"Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }
Plug 'tpope/vim-haml', { 'for': 'haml' }
Plug 'tpope/vim-rails', { 'for': 'ruby' }
Plug 'vim-ruby/vim-ruby', { 'for': 'ruby' }
Plug 'stephpy/vim-yaml', { 'for': 'yaml' }
Plug 'slim-template/vim-slim'
Plug 'leafgarland/typescript-vim'

Plug 'tpope/vim-fugitive'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-endwise'
Plug 'vim-scripts/paredit.vim'

Plug 'webdevel/tabulous'
" tabulous
let tabulousLabelModifiedStr = '+'

Plug 'christoomey/vim-tmux-navigator'

Plug 'andrewradev/splitjoin.vim'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
let g:airline_theme='base16'
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_symbols.branch = '⌥'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
" fzf
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }
let g:fzf_layout = { 'down': '~70%' }
let g:fzf_history_dir = '~/.local/share/fzf-history'
autocmd! FileType fzf
autocmd  FileType fzf set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler
" fzf preview
command! -bang -nargs=? -complete=dir Giles
      \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)
command! -bang -nargs=? -complete=dir Files
      \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)
" rg preview
command! -bang -nargs=* Rg
      \ call fzf#vim#grep(
      \   'rg --column --line-number --no-heading --color=always --fixed-strings --smart-case --hidden --follow --glob "!.git/*" '.shellescape(<q-args>), 1,
      \   <bang>0 ? fzf#vim#with_preview('up:60%')
      \           : fzf#vim#with_preview('right:50%:hidden', '?'),
      \   <bang>0)
nmap <leader>s :Rg!<space>
nmap <leader>ы :Rg!<space>
nmap <silent> <leader>f :silent Files<CR>
nmap <silent> <leader>а :silent Files<CR>
nmap <silent> <leader>g :silent GFiles<CR>
nmap <silent> <leader>п :silent GFiles<CR>
nmap <silent> <leader>b :silent Buffers<CR>
nmap <silent> <leader>и :silent Buffers<CR>
nmap <silent> <leader>h :silent History<CR>
nmap <silent> <leader>р :silent History<CR>

Plug 'neoclide/coc.nvim', { 'branch': 'release', 'do' : 'yarn install --frozen-lockfile' }

" Persistent Undo
" Keep undo history across sessions, by storing in file.
" Only works all the time.
if has('persistent_undo')
  silent !mkdir ~/.vim/backups > /dev/null 2>&1
  set undodir=~/.vim/backups
  set undofile
endif

" Coc
let g:coc_node_path = '$HOME/.asdf/shims/node'
let g:coc_npm_path = '$HOME/.asdf/shims/npm'
let g:coc_global_extensions = [
      \ 'coc-tsserver',
      \ 'coc-html',
      \ 'coc-lists',
      \ 'coc-css',
      \ 'coc-stylelint',
      \ 'coc-vimlsp',
      \ 'coc-go',
      \ 'coc-elixir',
      \ 'coc-json',
      \ 'coc-eslint',
      \ 'coc-python',
      \ 'coc-solargraph',
      \ 'coc-yaml',
      \ 'coc-snippets',
      \ 'coc-docker',
      \ 'coc-diagnostic',
      \ 'coc-highlight'
      \]
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> пв <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> пн <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> пш <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> пк <Plug>(coc-references)
" use `[c` and `]c` to navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)
nmap <silent> ]r :CocRestart<CR>
" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
" inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" remap for rename current word
nmap <leader>rn <Plug>(coc-rename)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)
" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')
nnoremap <Leader>l :Format<CR>

Plug 'terryma/vim-multiple-cursors'
Plug 'dyng/ctrlsf.vim'
let g:ctrlsf_ackprg = 'rg'
let g:ctrlsf_case_sensitive = 'smart'
nmap     <C-F>f <Plug>CtrlSFPrompt
nmap     <C-F>w <Plug>CtrlSFCwordExec
vmap     <C-F> <Plug>CtrlSFVwordExec
" nmap     <C-F>w <Plug>CtrlSFCwordPath
" nmap     <C-F>p <Plug>CtrlSFPwordPath
nnoremap <C-F>o :CtrlSFOpen<CR>
nnoremap <C-F>t :CtrlSFToggle<CR>
inoremap <C-F>t <Esc>:CtrlSFToggle<CR>

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

Plug 'janko/vim-test'
map <Leader>t :TestNearest<CR>

Plug 'pechorin/any-jump.vim'
let g:any_jump_list_numbers = 1
let g:any_jump_search_prefered_engine = 'rg'
let g:any_jump_window_width_ratio  = 1.0
let g:any_jump_window_height_ratio = 0.8
let g:any_jump_window_top_offset   = 40
let g:any_jump_results_ui_style = 'filename_last'
nnoremap <leader>j :AnyJump<CR>
nnoremap <leader>ab :AnyJumpBack<CR>
let g:any_jump_colors = {
      \"plain_text":         "Comment",
      \"preview":            "Comment",
      \"preview_keyword":    "Operator",
      \"heading_text":       "Function",
      \"heading_keyword":    "Identifier",
      \"group_text":         "Comment",
      \"group_name":         "Function",
      \"more_button":        "Operator",
      \"more_explain":       "Comment",
      \"result_line_number": "Comment",
      \"result_text":        "Statement",
      \"result_path":        "String",
      \"help":               "Comment"
      \}

call plug#end()
" set t_Co=16
" let g:solarized_termtrans = 1
" let g:solarized_termcolors=256
set background=light
" set background=dark
colorscheme solarized

" hotkeys

" navigation
map <C-k> <C-w><Up>
map <C-j> <C-w><Down>
map <C-l> <C-w><Right>
map <C-h> <C-w><Left>

" translate tabs to spaces
map <F3> :retab<CR>

" Remove all trailing whitespace by pressing F4
map <F4> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>

"Tabs
map fj :tabprev<CR>
map ао :tabprev<CR>
map fk :tabnext<CR>
map ал :tabnext<CR>
" New tab
map fn :tabe<CR>
map ат :tabe<CR>
" Open same file in new tab
map fe :tab split<CR>
map ау :tab split<CR>

nmap fq :q!<CR>
nmap ай :q!<CR>
nmap tq :tabclose<CR>
nmap ей :tabclose<CR>
nmap fw :w<CR>
nmap ац :w<CR>
map fv :vsplit<CR>
map ам :vsplit<CR>
map fs :split<CR>
map аы :split<CR>
map ft :terminal<CR>
map ае :terminal<CR>
" Reload current file
map <leader>e :e! <CR>

map <F2> :set invpaste paste?<CR>

" Fix all lines to maximum length
map <F7> :%norm ggw<CR>

" Clear highlighted text
map <leader>H :nohlsearch<CR>
map <leader>к :nohlsearch<CR>

" Allow to copy/paste between VIM instances
" copy the current visual selection to ~/.vbuf
vmap <leader>y :w! ~/.vbuf<CR>
vmap <leader>н :w! ~/.vbuf<CR>
" copy the current line to the buffer file if no visual selection
nmap <leader>y :.w! ~/.vbuf<CR>
nmap <leader>н :.w! ~/.vbuf<CR>
" paste the contents of the buffer file
nmap <leader>p :r ~/.vbuf<CR>
nmap <leader>н :r ~/.vbuf<CR>

" Edit .vimrc
map <leader>vl :vsp $MYVIMRC<CR>
map <leader>vr :source $MYVIMRC<CR>

inoremap <C-J> <C-N>
inoremap <C-K> <C-P>

" github link to line repo
" for linux workstation
" nnoremap <silent> ,gl :silent !echo `git url`/blob/`git rev-parse --abbrev-ref HEAD`/%\#L<C-R>=line('.')<CR> \| xargs > ~/.vbuf <CR>
" for macos
nnoremap <silent> ,gl :silent !echo `git url`/blob/`git rev-parse --abbrev-ref HEAD`/%\#L<C-R>=line('.')<CR> \| pbcopy <CR>

" set light background
nmap <silent> <leader>bl :set background=light<CR>
nmap <silent> <leader>bd :set background=dark<CR>

" replace selected text
nnoremap <leader>r :%s///g<left><left>

" find visual selection in current buffer
vnoremap / y:let @/ = @"<CR>

" find visual selection in dir
function SearchVisualSelection()
  normal gv"xy
  let selection = getreg("x")
  execute 'Rg!' selection
endfunction
vnoremap f :call SearchVisualSelection() <CR>

tnoremap fq <C-\><C-n>
highlight clear SignColumn
