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
set runtimepath+=~/.vim/dein/dein.vim

call dein#begin(expand('~/.vim/dein'))

call dein#add('Shougo/dein.vim')
call dein#add('Shougo/neocomplete.vim')
call dein#add('Shougo/unite.vim')
call dein#add('Shougo/vimproc.vim', {'build': {'mac' : 'make -f make_mac.mak', }, })
call dein#add('Shougo/neomru.vim')
call dein#add('davidhalter/jedi-vim')
call dein#add('Shougo/neosnippet.vim')
call dein#add('Shougo/neosnippet-snippets')
call dein#add('posva/vim-vue')
call dein#add('fatih/vim-go')
call dein#add('tpope/vim-fugitive')

call dein#end()

" dein#end()のあとに書かないと反映されない
colorscheme ron
syntax on

" Neocompleteを有効化
let g:neocomplete#enable_at_startup = 1
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

""" Uniteの設定
"unite prefix key.
nnoremap [unite] <Nop>
nmap <Space>f [unite]
 
"unite general settings
let g:unite_source_menu_menus = get(g:,'unite_source_menu_menus',{})
"インサートモードで開始
let g:unite_enable_start_insert = 1
"最近開いたファイル履歴の保存数
let g:unite_source_file_mru_limit = 50
 
"file_mruの表示フォーマットを指定。空にすると表示スピードが高速化される
let g:unite_source_file_mru_filename_format = ''
 
"現在開いているファイルのディレクトリ下のファイル一覧。
"開いていない場合はカレントディレクトリ
nnoremap <silent> [unite]f :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
"バッファ一覧
nnoremap <silent> [unite]b :<C-u>Unite buffer<CR>
"レジスタ一覧
nnoremap <silent> [unite]r :<C-u>Unite -buffer-name=register register<CR>
"最近使用したファイル一覧
nnoremap <silent> [unite]m :<C-u>Unite file_mru<CR>
"ブックマーク一覧
nnoremap <silent> [unite]c :<C-u>Unite bookmark<CR>
"ブックマークに追加
nnoremap <silent> [unite]a :<C-u>UniteBookmarkAdd<CR>
"uniteを開いている間のキーマッピング
autocmd FileType unite call s:unite_my_settings()
function! s:unite_my_settings()"{{{
    "ESCでuniteを終了
    nmap <buffer> <ESC> <Plug>(unite_exit)
    "入力モードのときjjでノーマルモードに移動
    imap <buffer> jj <Plug>(unite_insert_leave)
    "入力モードのときctrl+wでバックスラッシュも削除
    imap <buffer> <C-w> <Plug>(unite_delete_backward_path)
    "ctrl+jで縦に分割して開く
    nnoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
    inoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
    "ctrl+lで横に分割して開く
    nnoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
    inoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
    "ctrl+oでその場所に開く
    nnoremap <silent> <buffer> <expr> <C-o> unite#do_action('open')
    inoremap <silent> <buffer> <expr> <C-o> unite#do_action('open')
endfunction"}}}
