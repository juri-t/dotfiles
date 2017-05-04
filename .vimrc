" 表示関連
set list "不可視文字表示
set number "行番号を表示
set cursorline
set title "編集中のファイル名を表示
set showmatch "かっこ入力時に対応する括弧を表示
set autoread
set laststatus=2
set scrolloff=8

" コマンド関連
set wildmenu 
set showcmd

" エンコード関連
set enc=utf-8
set fenc=utf-8
set fileencodings=utf-8,shift-jis

" インデント関連
set tabstop=4 "タグ文字の幅
set shiftwidth=4 "自動で挿入されるインデントの幅
set expandtab
set smartindent

" 検索関連
set incsearch
set hlsearch
set ignorecase "大文字小文字の区別なく検索する
set smartcase "検索文字列に大文字が含まれている場合は区別して検索する
set wrapscan "検索時に最後までいったら最初に戻る

" バックアップ関連
set nobackup
set noswapfile

nnoremap sj <C-w>j
nnoremap sk <C-w>k
nnoremap sh <C-w>h
nnoremap sl <C-w>l

set backspace=indent,eol,start
set clipboard=unnamed,unnamedplus

" dein.vimの設定
if &compatible 
    set nocompatible
endif
set runtimepath+=/Users/juri/.vim/dein/dein.vim

call dein#begin(expand('~/.vim/dein'))

call dein#add('Shougo/dein.vim')
call dein#add('Shougo/neocomplete.vim')
call dein#add('Shougo/unite.vim')
call dein#add('davidhalter/jedi-vim')

call dein#end()

" dein#end()のあとに書かないと反映されない
colorscheme ron
syntax on
