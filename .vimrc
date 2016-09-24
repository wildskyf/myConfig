" ===============================================
" Author: Wildsky / wildskyf+vimrc (at) gmail.com
" Blog: http://blog.wildsky.cc
" Filename: .vimrc
" Modified: 2016-09-24 20:27
" ===============================================

" ===============================================
" ===============  Vundle Start  ================
" ===============================================

set nocompatible		" 不使用和 VI 相容的模式
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
Plugin 'mattn/emmet-vim'						" Web developer must use
Plugin 'nielsmadan/harlequin'					" Theme
Plugin 'ntpeters/vim-better-whitespace'			" Get rid of redundant whitespace
Plugin 'othree/javascript-libraries-syntax.vim'	" Js lib
Plugin 'sheerun/vim-polyglot'					" A solid language pack for Vim

call vundle#end()
filetype plugin indent on

" ========================================
" =============  Vundle End  =============
" ========================================

" ========================================
" ==========  General Setting  ===========
" ========================================

syntax on			" syntax highlight
set confirm			" if confict, ask me
set cursorline		" display current cursor (line)
set cursorcolumn	" display current cursor (column)
set encoding=utf-8
set hlsearch		" hightlight search result
set history=50		" number of history of command
set hidden			" make buffer could hold a modified file
set incsearch		" display search result realtime
set ignorecase		" case-insensitive
set laststatus=2	" open status bar
set number			" display line number
set ruler			" right-bottom detail
set scrolloff=2		" scroll with extra line
set showmatch		" highlight matched brackets
set wrap			" new line when too many char

" limit char number for git commit
autocmd Filetype gitcommit setlocal spell textwidth=72
" redundant whitespace bye bye
autocmd BufWritePre * StripWhitespace
" emmet trigger key
" let g:user_emmet_leader_key='~~~~~~~~~~~~~~'
" supported js framework
let g:used_javascript_libs = 'jquery,react,flux,chai'
" CtrlP custom
set wildignore+=*/tmp/*,*/cache/*

" Tab
set tabstop=4
set shiftwidth=4
set autoindent
set copyindent
set smartindent

" ========================================
" ================  Map  =================
" ========================================

" F9     : 切換 paste 模式
" F12    : 切換行號
:set pastetoggle=<F9>
noremap  <Home> ^
inoremap <Home> <ESC>^i
noremap  <F2> :mksession! ~/vim_session <CR>
noremap  <F3> :source ~/vim_session <CR>
nnoremap <F12> :call NumberToggle()<CR>

function! NumberToggle()
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

" remap arrow keys
" nnoremap <Left> :bprev<CR>
" nnoremap <Right> :bnext<CR>


" ========================================
" ============== auto run ================
" ========================================

:au FocusLost *   :call SetNumber()
:au FocusGained * :call SetRelativeNumber()

autocmd InsertEnter * :call SetNumber()
autocmd InsertLeave * :call SetRelativeNumber()

" ========================================
" ===============  theme  ================
" ========================================

set t_Co=256		" happy color!
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

set background=dark
colorscheme harlequin

" ========================================
" =============== hint ===================
" ========================================

" 縮排				: Tab == ctrl + t == >>
" 取消縮排			: Shift == ctrl + d == <<
" 移動到第 n 行		::m[n]
" 插入				: I i a A

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

