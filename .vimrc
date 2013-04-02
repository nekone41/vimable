set nocompatible
filetype indent off
filetype plugin on

if has('vim_starting')
  set runtimepath+=~/.vim/.bundle/neobundle.vim/
  call neobundle#rc(expand('~/.vim/.bundle/'))
endif

NeoBundle 'git://github.com/Shougo/neocomplcache.git'
NeoBundle 'git://github.com/Shougo/neosnippet.git'
NeoBundle 'git://github.com/Shougo/unite.vim.git'
NeoBundle 'git://github.com/Shougo/vimproc.git'
NeoBundle 'git://github.com/Shougo/vimshell.git'
NeoBundle 'git://github.com/scrooloose/syntastic.git'
NeoBundle 'git://github.com/thinca/vim-quickrun.git'
NeoBundle 'git://github.com/godlygeek/tabular.git'
NeoBundle 'vim-scripts/yanktmp.vim'
NeoBundle 'taglist.vim'
NeoBundle 'git://github.com/Shougo/vimfiler.git'
NeoBundle 'git://github.com/wesleyche/SrcExpl.git'


filetype plugin on
"filetype indent on
syntax on
highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=#666666
au BufNewFile,BufRead * match ZenkakuSpace /　/
"
""-------------------------------
set number
set si
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2
set ic
set hlsearch
set shiftwidth=2 " 字下げの数
set expandtab " タブは空白に展開
set undolevels=1000 " undo/redoのmax設定
set laststatus=2 " 常にステータスラインを表示する
set ruler " カーソル位置(行,列)の表示
set hlsearch " 検索文字列のハイライト
set incsearch " インクリメンタル検索
set ignorecase smartcase " 小文字検索は大文字と小文字を区別しない。
set nrformats=hex " cnrl+A,Xで加減できる基数10,16進のみ(8進は対象外にする)
set cpoptions+=$ " 変更最終文字を$表示する(viの表示と同じ)互換を追加
set backspace=2 " 編集開始位置や改行、インデントを越えてバックスペースで
set history=50 " コロンコマンドの記録数
set cinoptions=j1 " j1 -> java indent 4
set wildmenu " コマンドライン入力時の<TAB>で補完候補表示
set modeline "モードライン有効(default)
imap <C-j> <C-[>
"imap { {}<Left>
"imap [ []<Left>

"imap ( ()<Left>

nmap <TAB> <C-w><C-w>
"source exploer
"自動でプレビューを表示する。TODO:うざくなってきたら手動にする。またはソースを追う時だけ自動に変更する。
let g:SrcExpl_RefreshTime   = 1
""プレビューウインドウの高さ
let g:SrcExpl_WinHeight     = 9
"tagsは自動で作成する
let g:SrcExpl_UpdateTags    = 0
""マッピング
let g:SrcExpl_RefreshMapKey = "<Space>"
let g:SrcExpl_GoBackMapKey  = "<C-b>"
nmap <F8> :SrcExplToggle<CR>

set mouse=a
"tabular

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
"
"------------------------------------
"" unite.vim
"------------------------------------
"" 入力モードで開始する
let g:unite_enable_start_insert=0
" バッファ一覧
noremap <C-U><C-B> :Unite buffer<CR>
" ファイル一覧
noremap <C-U><C-F> :UniteWithBufferDir -buffer-name=files file<CR>
" 最近使ったファイルの一覧
noremap <C-U><C-R> :Unite file_mru<CR>
" レジスタ一覧
noremap <C-U><C-Y> :Unite -buffer-name=register register<CR>
" ファイルとバッファ
noremap <C-U><C-U> :Unite buffer file_mru<CR>
" 全部
noremap <C-U><C-A> :Unite UniteWithBufferDir -buffer-name=files buffer file_mru bookmark file<CR>
" ESCキーを2回押すと終了する
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> :q<CR>
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>:q<CR>
" Unite-grep
nnoremap <silent> ,ug :Unite grep:%:-iHRn<CR>
"

"-Enable textmanip------------------------------
"
vmap <C-j> <Plug>(textmanip-move-down)
vmap <C-k> <Plug>(textmanip-move-up)
vmap <C-h> <Plug>(textmanip-move-left)
vmap <C-l> <Plug>(textmanip-move-right)
""------------------------------
""Disable AutoComplPop.
let g:acp_enableAtStartup = 0
"" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" <TAB> completion.inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
 inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<S-TAB>"
 inoremap <expr><CR> pumvisible() ? neocomplcache#close_popup() : "\<CR>"
 " Recommended key-mappings.
 " <CR>: close popup and save indent.
 inoremap <expr><CR> neocomplcache#smart_close_popup() . "\<CR>"
 " <TAB>: completion.
 inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
" " <C-h>, <BS>: close popup and delete backword char.
 inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
 inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
 inoremap <expr><C-y> neocomplcache#close_popup()
 inoremap <expr><C-e> neocomplcache#cancel_popup()
" " スニペットファイルの配置場所
 let g:NeoComplCache_SnippetsDir = '~/.vim/snippets'
" " <C-k> にマッピング
 imap <C-k> <Plug>(neocomplcache_snippets_expand)
 smap <C-k> <Plug>(neocomplcache_snippets_expand)
" snippets test"
" For snippet_complete marker.
 if has('conceal')
   set conceallevel=2 concealcursor=i
   endif

" 補完候補検索時に大文字・小文字を無視する
 let g:neocomplcache_enable_ignore_case = 1
 " 大文字が入力されるまで大文字小文字の区別を無視する
 let g:neocomplcache_enable_smart_case = 1


" 関数を補完するための区切り文字パターン
 if !exists('g:neocomplcache_delimiter_patterns')
   let g:neocomplcache_delimiter_patterns = {}
 endif
   let g:neocomplcache_delimiter_patterns['php'] = ['->', '::', '\']
   let g:neocomplcache_delimiter_patterns.vim = ['#']
   let g:neocomplcache_delimiter_patterns.cpp = ['::']


   "インクルード補完 {{{
     " ======================================
"インクルード補完。よくわからない。初期化のみに留める
"通常は設定する必要はないらしい。
"Vim標準のインクルード補完を模倣しているそうなので、そちらを勉強する
if !exists('g:neocomplcache_include_paths')
let g:neocomplcache_include_paths = {}
endif
if !exists('g:neocomplcache_include_patterns')
let g:neocomplcache_include_patterns = {}
endif
if !exists('g:neocomplcache_ctags_arguments_list')
let g:neocomplcache_ctags_arguments_list = {}
endif

"ctagsの引数
let g:neocomplcache_ctags_arguments_list = {
  \ 'cpp' : '-R'
  \ }



       " インクルードパスを指定
       let g:neocomplcache_include_paths = {
         \ 'cpp' :  '.,/opt/local/include,/usr/include',
         \ 'c' : '.,/usr/include',
         \ }

     "インクルード文のパターンを指定
       let g:neocomplcache_include_patterns = {
         \ 'cpp' : '^\s*#\s*include',
         \ 'perl' : '^\s*use',
         \ }
     "インクルード先のファイル名の解析パターン
     " let g:neocomplcache_include_exprs = {
     "   \ 'ruby' : substitute(v:fname,'::','/','g')
     "     \ }

     "
     "ファイルを探す際に、この値を末尾に追加したファイルも探す。
     " let g:neocomplcache_include_suffixes = {
     "   \ 'ruby' : '.rb',
     "   \ 'haskell' : '.hs'
     "     \ }

     " }}}

     "オムニ補完 {{{
     " ======================================

     " オムニ補完の手動呼び出し
     inoremap <expr><C-x><C-o> &filetype == 'vim' ? "\<C-x><C-v><C-p>" :neocomplcache#manual_omni_complete()

     " FileType毎のOmni補完を設定
     autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
     autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
     autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
     autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
     autocmd FileType php setlocal omnifunc=phpcomplete#CompletePHP
     autocmd FileType c setlocal omnifunc=ccomplete#Complete
     autocmd FileType cpp setlocal omnifunc=cppcomplete#Complete
     autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
     " Enable heavy omni completion.
     if !exists('g:neocomplcache_omni_patterns')
       let g:neocomplcache_omni_patterns = {}
     endif
       let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\h\w*\|\h\w*::'
       let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
       let g:neocomplcache_omni_patterns.c = '\%(\.\|->\)\h\w*'
       let g:neocomplcache_omni_patterns.cpp = '\h\w*\%(\.\|->\)\h\w*\|\h\w*::'

     " }}}



""Disable AutoComplPop.
let g:acp_enableAtStartup = 0
"" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
"" clang lib directory
let g:neocomplcache_clang_use_library = 1
let g:neocomplcache_clang_library_path = '/Users/nekosu/vimshare/lib' 
let g:neocomplcache_clang_user_options =
                        \ '-I /usr/include/ '.
                        \ '-I /usr/include/boost/'
" 補完候補検索時に大文字・小文字を無視する
 let g:neocomplcache_enable_ignore_case = 1
 " 大文字が入力されるまで大文字小文字の区別を無視する
 let g:neocomplcache_enable_smart_case = 1

" 関数を補完するための区切り文字パターン
 if !exists('g:neocomplcache_delimiter_patterns')
   let g:neocomplcache_delimiter_patterns = {}
   endif
   let g:neocomplcache_delimiter_patterns['php'] = ['->', '::', '\']
   let g:neocomplcache_delimiter_patterns.vim = ['#']
   let g:neocomplcache_delimiter_patterns.cpp = ['::']



"" clang lib directory
"let g:neocomplcache_clang_use_library = 1
"let g:neocomplcache_clang_library_path = '/export/home/yosuke/.vim'
"let g:neocomplcache_clang_user_options =
"\ '-I /usr/include/ '.
"\ '-I /usr/include/boost/'


let g:neocomplcache_max_list=1000
 
set completeopt=menuone
