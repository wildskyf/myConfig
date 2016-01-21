" ===============================================
" Author: Wildsky / poppin.wildsky (at) gmail.com
" Blog: http://wildsky.cc
" Filename: .vimrc
" Modified: 2015-12-24 23:25
" Description: vimrc
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
Plugin 'bronson/vim-trailing-whitespace'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'cakebaker/scss-syntax.vim'
Plugin 'editorconfig/editorconfig-vim'
" Plugin 'ervandew/supertab'
Plugin 'godlygeek/tabular'
Plugin 'itchyny/lightline.vim'
Plugin 'jiangmiao/auto-pairs'
Plugin 'mattn/emmet-vim'
Plugin 'Molokai'
Plugin 'plasticboy/vim-markdown'
Plugin 'snipMate'
Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdtree'
Plugin 'sheerun/vim-polyglot'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-fugitive'
" Plugin 'vim-scripts/OmniCppComplete'
Plugin 'vim-scripts/taglist.vim'
Plugin 'vim-scripts/grep.vim'
Plugin 'vim-scripts/CSApprox'
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-notes'
Plugin 'kchmck/vim-coffee-script'

call vundle#end()
filetype plugin indent on

" ========================================
" =============  Vundle End  =============
" ========================================

" ========================================
" ==========  General Setting  ===========
" ========================================

syntax on			" 語法上色
set background=dark	" 啟用暗色背景模式
set confirm			" 操作過程有衝突時，以明確的文字來詢問
set cursorline		" 顯示目前的游標位置(行)
set cursorcolumn	" 顯示目前的游標位置(列)
set encoding=utf-8	" 編碼
set hlsearch		" 搜尋到的字加 hightlight
set history=100		" 保留 100 個使用過的指令
set incsearch		" 即時顯示搜尋結果
set ignorecase		" 搜尋忽略大小寫
set laststatus=2	" 開啟狀態列
set number			" 顯示行號
set ruler			" 顯示右下角設定值
set scrolloff=2		" 捲動時保留底下 2 行
set showmatch		" 設置匹配模式，顯示匹配的括號
set wrap			" 字數過長時換行

" 讓 git commit 字數限制爲 72 字
autocmd Filetype gitcommit setlocal spell textwidth=72

" Tab
set tabstop=4
set shiftwidth=4
set autoindent
set copyindent
set smartindent

" Treeview
let NERDTreeShowHidden=1
let NERDTreeIgnore=['\.vim$', '\~$', '\.git$', '.DS_Store']

" Markdown
let g:vim_markdown_folding_disabled=1	" 停用摺疊
let g:vim_markdown_frontmatter=1		" 啟用 front matter (for jekyll)

" ========================================
" ================  Map  =================
" ========================================

" 切換行號
nnoremap <F12> :set nonumber!<CR>
" 開啟函式清單 for C/C++
map <F3> :Tlist<CR>
" 開啟檔案瀏覽
nmap <silent> <F2> :NERDTreeToggle<CR>
:set pastetoggle=<F9>

" ========================================
" ===============  theme  ================
" ========================================

set t_Co=256		" 歡樂的顏色！
let g:lightline = {
	\ 'colorscheme': 'jellybeans'
	\ }

colorscheme molokai


" ========================================
" =============== hint ===================
" ========================================

" Tab == ctrl + t == >>
" Shift == ctrl + d == <<
" m數字：移動到第「數字」行
" 插入： I i a A
"
