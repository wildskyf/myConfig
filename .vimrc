" Author: Wildsky / wildskyf+gh (at) gmail.com
" Blog: http://blog.wildsky.cc
" Filename: .vimrc
" Modified: 2016-11-06 19:56

"	Tips:
"		Use command-line-window with q:
"		Use search history with q/

set nocompatible

" Determine what we have

let s:OS = 'linux'

let os = substitute(system('uname'), '\n', '', '')
if os == 'Darwin' || os == 'Mac'
    let s:OS = 'osx'
endif

" Vundle

filetype off			" required!

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" import Vundle manage Vundle
Plugin 'VundleVim/Vundle.vim'

" Bundles
Plugin 'ap/vim-css-color'
Plugin 'ctrlpvim/ctrlp.vim'						" Fuzzy search
Plugin 'editorconfig/editorconfig-vim'			" Editorconfig is awesome
Plugin 'itchyny/lightline.vim'					" Statusbar beautify
Plugin 'bling/vim-bufferline'					" Buffer list on statusbar
Plugin 'mattn/emmet-vim'						" Web developer must have
Plugin 'ntpeters/vim-better-whitespace'			" Get rid of redundant whitespace
Plugin 'wellsjo/wellsokai.vim'					" Theme
Plugin 'pangloss/vim-javascript'				" Js lib
Plugin 'mustache/vim-mustache-handlebars'
Plugin 'tpope/vim-markdown'

call vundle#end()
filetype plugin indent on

"
" General

syntax on						" syntax highlight
set autoindent					" Use autoindenting
set autoread					" Automatically re-read the file if it has changed
set backspace=indent,eol,start	" allow backspacing over everything in insert mode
set confirm						" if confict, ask me
set cursorline					" display current cursor (line)
set cursorcolumn				" display current cursor (column)
set display+=lastline			" Always show the last line
set encoding=utf-8				" UTF-8 bj4
set fo+=mB						" for asia text
set hlsearch					" hightlight search result
set history=999					" number of history of command
set hidden						" make buffer could hold a modified file
set incsearch					" display search result realtime
set ignorecase smartcase		" case-insensitive
set laststatus=2				" open status bar
set linebreak					" don't split a vocabulary
" set mouse=a					" enable the mouse
set number						" display line number
set ruler						" right-bottom detail
set scrolloff=2					" scroll with extra line
set showcmd						" Show the current command at the bottom
set showmatch					" highlight matched brackets
set shortmess=I					" Don't show the startup message
set smartindent					" Use smarter defaults
set smarttab					" Use smarter defaults
set title						" change the terminal's title
set textwidth=78
set visualbell					" don't beep
set noerrorbells				" don't beep
set undolevels=1000				" use many muchos levels of undo
set wildmenu					" Enhanced mode for command-line completion
set whichwrap=b,s,<,>,[,]		" back to the last line
set wrap						" new line when too many char

" Tab
set autoindent
set copyindent
set shiftwidth=4
set smartindent
set tabstop=4

" limit char number for git commit
autocmd Filetype gitcommit setlocal spell textwidth=72
" redundant whitespace bye bye
autocmd BufWritePre * StripWhitespace

" emmet trigger key
" let g:user_emmet_leader_key='~~~~~~~~~~~~~~'
"
" supported js framework
" let g:used_javascript_libs = 'jquery,react,flux,chai'

" CtrlP custom

let g:ctrlp_user_command = {
	\ 'types': {
		\ 1: ['.git', 'cd %s && git ls-files --exclude-standard --others --cached'],
		\ 2: ['.hg', 'hg --cwd %s locate -I .'],
	\ },
	\ 'fallback': 'find %s -type f'
\ }

" Setup some default ignores
let g:ctrlp_custom_ignore = {
	\ 'dir':  '\v[\/](\.(git|hg|svn)|\_site)$',
	\ 'file': '\v\.(exe|so|dll|class|png|jpg|jpeg)$',
\}
" use relative path
let g:ctrlp_working_path_mode = 'ra'

" ========================================
" ================  Map  =================
" ========================================

" F9     : 切換 paste 模式
" F12    : 切換行號
nnoremap ; :
:set pastetoggle=<F9>
noremap  <Home> ^
inoremap <Home> <ESC>^i
noremap  <F2> :mksession! ~/vim_session <CR>
noremap  <F3> :source ~/vim_session <CR>
nnoremap <F10> :call NumberToggle()<CR>
nnoremap <F12> :call NumberToggleRe()<CR>
" Non quitting analog of ZZ
nmap ZZ :w<cr>
" When pushing j/k on a line that is wrapped, it navigates to the same line,
" just to the expected location rather than to the next line
nnoremap j gj
nnoremap k gk

function! NumberToggleRe()
	if(&relativenumber == 1)
		call SetNumber()
	else
		call SetRelativeNumber()
	endif
endfunc

function! SetNumber()
	set norelativenumber
	set number
endfunc

function! SetRelativeNumber()
	set relativenumber
	set nonumber
endfunc

function! NumberToggle()
	if(&relativenumber == 1 || &number == 1)
		set nonumber
		set norelativenumber
	else
		call SetNumber()
	endif
endfunc

" remap arrow keys
" nnoremap <Left> :bprev<CR>
" nnoremap <Right> :bnext<CR>


" ========================================
" ============== auto run ================
" ========================================

" auto restore the position last I open the file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" switch the shape of the cursor
if exists('$TMUX')
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

:autocmd InsertEnter * set cursorline
:autocmd InsertLeave * set nocursorline

" auto toggle LineNumber between absolute or relative
:au FocusLost *   :call SetNumber()
:au FocusGained * :call SetRelativeNumber()
:autocmd InsertEnter * :call SetNumber()
:autocmd InsertLeave * :call SetRelativeNumber()

" ========================================
" ===============  theme  ================
" ========================================

set background=dark
set t_Co=256
" set t_AB=
" set t_AF=

set showtabline=2   " always show tabline

let g:lightline = {
	\ 'colorscheme': 'wombat',
	\ 'separator': { 'left': '', 'right': '' },
	\ 'subseparator': { 'left': '', 'right': '' },
	\ 'active': {
	\   'left': [ [ 'mode', 'paste' ], [ 'filename' ], [ 'bufferline' ] ],
	\ },
	\ 'component': {
	\   'bufferline': '%{bufferline#refresh_status()}%{g:bufferline_status_info.before . g:bufferline_status_info.current . g:bufferline_status_info.after}'
	\ }
\ }

" colorscheme harlequin
colorscheme wellsokai

" Ignore some defaults
set wildignore=*.o,*.obj,*~,*.pyc
set wildignore+=.env
set wildignore+=.env[0-9]+
set wildignore+=.git,.gitkeep
set wildignore+=.tmp
set wildignore+=.coverage
set wildignore+=*DS_Store*
set wildignore+=.sass-cache/
set wildignore+=__pycache__/
set wildignore+=vendor/rails/**
set wildignore+=vendor/cache/**
set wildignore+=*.gem
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=.tox/**
set wildignore+=.idea/**
set wildignore+=*.egg,*.egg-info
set wildignore+=*.png,*.jpg,*.gif
set wildignore+=*.so,*.swp,*.zip,*/.Trash/**,*.pdf,*.dmg,*/Library/**,*/.rbenv/**
set wildignore+=*/.nx/**,*.app

" ========================================
" ======== paste auto switch mode ========
" ========================================

if &term =~ "xterm.*"
	let &t_ti = &t_ti . "\e[?2004h"
	let &t_te = "\e[?2004l" . &t_te
	function XTermPasteBegin(ret)
		set pastetoggle=<Esc>[201~
		set paste
		return a:ret
	endfunction
	map <expr> <Esc>[200~ XTermPasteBegin("i")
	imap <expr> <Esc>[200~ XTermPasteBegin("")
	cmap <Esc>[200~ <nop>
	cmap <Esc>[201~ <nop>
endif

" show invisible
set list
set list listchars=tab:>\ ,trail:·,precedes:←,extends:→,nbsp:␣
" set list listchars=tab:▸\ ,trail:·,precedes:←,extends:→,nbsp:␣
hi NonText ctermfg=16 guifg=#4a4a59
hi SpecialKey ctermfg=16 guifg=#4a4a59

