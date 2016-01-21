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
Plugin 'ntpeters/vim-better-whitespace'
" Plugin 'cakebaker/scss-syntax.vim'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'godlygeek/tabular'				" 自動對齊
Plugin 'itchyny/lightline.vim'			" 美化狀態列
Plugin 'jiangmiao/auto-pairs'
Plugin 'nielsmadan/harlequin'			" 主題
Plugin 'mattn/emmet-vim'
Plugin 'plasticboy/vim-markdown'
" Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdtree'
Plugin 'sheerun/vim-polyglot'
Plugin 'tpope/vim-commentary'			" 讓註解超好用！
Plugin 'tpope/vim-fugitive'				" 在 vim 中使用 git 指令
Plugin 'vim-scripts/taglist.vim'

" Dependencies of snipMate
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'snipMate'

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

" 讓 git commit 字數限制為 72 字
autocmd Filetype gitcommit setlocal spell textwidth=72
" 在存檔時自動把多餘的空白字元吃掉
autocmd BufWritePre * StripWhitespace

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

" F2     : 開啟檔案瀏覽
" F3     : 開啟函式清單 for C/C++
" F9     : 切換 paste 模式
" F12    : 切換行號
" Ctrl+/ : 依等號對齊
nmap <silent> <F2> :NERDTreeToggle<CR>
map <F3> :Tlist<CR>
:set pastetoggle=<F9>
nnoremap <F12> :set nonumber!<CR>
map <C-/> :Tabularize /=<CR>

" ========================================
" ===============  theme  ================
" ========================================

set t_Co=256		" 歡樂的顏色！
let g:lightline = {
	\ 'colorscheme': 'wombat'
\ }

set background=dark
colorscheme harlequin

" ========================================
" =============== hint ===================
" ========================================

" 縮排               : Tab == ctrl + t == >>
" 取消縮排           : Shift == ctrl + d == <<
" 移動到第「數字」行 : :m[n]
" 插入				 : I i a A
" 多行註解1          : [n]gcc
" 多行註解2          : Visual 下按 gc
" 自動對齊			 : Visual 下，:Tabu /[對齊字元]

" ========================================
" =============== auto ==================
" ========================================

" 用 | 來畫表格的時候，第三行開始會自動對齊
inoremap <silent> <Bar>   <Bar><Esc>:call <SID>align()<CR>a

function! s:align()
	let p = '^\s*|\s.*\s|\s*$'
	if exists(':Tabularize') && getline('.') =~# '^\s*|' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
		let column = strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
		let position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
		Tabularize/|/l1
		normal! 0
		call search(repeat('[^|]*|',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
	endif
endfunction
