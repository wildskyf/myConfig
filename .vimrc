" ===============================================
" Author: Wildsky / poppin.wildsky (at) gmail.com
" Blog: http://wildsky.cc
" Filename: .vimrc
" Modified: 2015-12-3 21:33
" Description: vimrc for GNU/Linux.
" ===============================================

" ===============================================
" ===============  Vundle Start  ================
" ===============================================

set nocompatible		" not compatible with the old-fashion vi mode
filetype off			" required!

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
" "call vundle#begin('~/some/path/here')

" import Vundle manage Vundle
Plugin 'VundleVim/Vundle.vim'

" Bundles
Plugin 'Molokai'
Plugin 'itchyny/lightline.vim'
Plugin 'snipMate'
Plugin 'mattn/emmet-vim'
Plugin 'ap/vim-css-color'
Plugin 'scrooloose/syntastic'
Plugin 'vim-scripts/taglist.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-notes'
Plugin 'cakebaker/scss-syntax.vim'

call vundle#end()
filetype plugin indent on

" ========================================
" =============  Vundle End  =============
" ========================================

" ========================================
" ==========  General Setting  ===========
" ========================================

syntax on			" 語法上色
set hlsearch		" 搜尋到的字加 hightlight
set encoding=utf-8	" 編碼
set number			" 顯示行號。
set cursorline		" 顯示目前的游標位置
set ruler			" 顯示右下角設定值
set ic				" 搜尋忽略大小寫。
set hlsearch		" 設定高亮度顯示搜尋結果
set incsearch		" 即時顯示搜尋結果
set confirm			" 操作過程有衝突時，以明確的文字來詢問
set history=100		" 保留 100 個使用過的指令
set wrap			" 字數過長時換行。
set scrolloff=3		" 捲動時保留底下 3 行。
set showmatch		" 設置匹配模式，顯示匹配的括號
set background=dark	" 啟用暗色背景模式。
autocmd FileType css, scss set omnifunc=csscomplete#CompleteCSS

" Status Line
set laststatus=2

" Tab
set tabstop=4
set shiftwidth=4
set cindent
set autoindent
set smartindent 

" Treeview
let g:netrw_liststyle=3
let mapleader=" "

" 括號引號補全
" :inoremap ( ()<ESC>i
" :inoremap [ []<ESC>i
" :inoremap { {<CR>}<ESC>O

" ========================================
" ================  Map  =================
" ========================================

" 切換行號
nnoremap <F12> :set nonumber!<CR>
" 開啟函式清單 for C/C++
map <F3> :Tlist<CR>
" 開啟檔案瀏覽
map <silent> <F2> :NERDTree<CR>

" ========================================
" ===============  theme  ================
" ========================================

set t_Co=256		" 歡樂的顏色！
let g:lightline = {
	\ 'colorscheme': 'jellybeans',
	\ 'component': {
		\   'readonly': '%{&readonly?"":""}'
		\ }
	\ }

colorscheme molokai


" ========================================
" =============== hint ===================
" ========================================

" Tab == ctrl + t == >>
" Shift == ctrl + d == <<
" m數字：移動到第「數字」行
