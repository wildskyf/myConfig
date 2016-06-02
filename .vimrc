" ===============================================
" Author: Wildsky / wildskyf+vimrc (at) gmail.com
" Blog: http://blog.wildsky.cc
" Filename: .vimrc
" Modified: 2016-06-06 20:27
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
Plugin 'editorconfig/editorconfig-vim'
Plugin 'itchyny/lightline.vim'			" 美化狀態列
Plugin 'nielsmadan/harlequin'			" 主題
Plugin 'othree/javascript-libraries-syntax.vim'
Plugin 'plasticboy/vim-markdown'
Plugin 'scrooloose/nerdtree'
Plugin 'sheerun/vim-polyglot'			" A solid language pack for Vim
" Plugin 'terryma/vim-multiple-cursors'	" 多行同時編輯

" Dependencies of snipMate
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/snipMate'			" 可以在 ~/.vim/bundle/snipMate/ 中自訂
Plugin 'honza/vim-snippets'						
" FYI: https://github.com/honza/vim-snippets/tree/master/snippets

call vundle#end()
filetype plugin indent on

" ========================================
" =============  Vundle End  =============
" ========================================

" ========================================
" ==========  General Setting  ===========
" ========================================

syntax on		" 語法上色
set confirm		" 操作過程有衝突時，以明確的文字來詢問
set cursorline		" 顯示目前的游標位置(行)
set cursorcolumn	" 顯示目前的游標位置(列)
set encoding=utf-8	" 編碼
set hlsearch		" 搜尋到的字加 hightlight
set history=50		" 保留 50 個使用過的指令
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

" 支援的 js framework
let g:used_javascript_libs = 'jquery,react,flux,chai'

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
" F9     : 切換 paste 模式
" F12    : 切換行號
nmap <silent> <F2> :NERDTreeToggle<CR>
:set pastetoggle=<F9>
nnoremap <F12> :set nonumber!<CR>

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

