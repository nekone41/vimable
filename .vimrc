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
"imap ( ()<Left>x
nmap <TAB> <C-w><C-w>
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
 autocmd FileType c setlocal omnifunc=ccomplete#CompleteTags
 autocmd FileType cpp setlocal omnifunc=cppcomplete#CompleteTags
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



"" clang lib directory
"let g:neocomplcache_clang_use_library = 1
"let g:neocomplcache_clang_library_path = '/export/home/yosuke/.vim'
"let g:neocomplcache_clang_user_options =
"\ '-I /usr/include/ '.
"\ '-I /usr/include/boost/'


let g:neocomplcache_max_list=1000
 
set completeopt=menuone
