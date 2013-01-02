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
NeoBundle 'vim-scripts/yanktmp.vim'
filetype plugin on
filetype indent on
syntax on
highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=#666666
au BufNewFile,BufRead * match ZenkakuSpace /　/

"-------------------------------
set si
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2
set ic
set hlsearch
"-------------------------------

"" Enable omni completion.
"set ofu=syntaxcomplete#Complete
"autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
"autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
"autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
"autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
"autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
"autocmd FileType c setlocal omnifunc=ccomplete#CompleteTags
""-------------------------------
"<TAB>で補完
" {{{ Autocompletion using the TAB key
" This function determines, wether we are on the start of the line text (then tab indents) or
" if we want to try autocompletion
function! InsertTabWrapper()
  let col = col('.') - 1
  if !col || getline('.')[col - 1] !~ '\k'
  return "\<TAB>"
  else
if pumvisible()
  return "\<C-N>"
  else
  return "\<C-N>\<C-P>"
  end
  endif
  endfunction
  " Remap the tab key to select action with InsertTabWrapper
  inoremap <tab> <c-r>=InsertTabWrapper()<cr>
  " }}} Autocompletion using the TAB key


"-Enable textmanip------------------------------
              
  vmap <C-j> <Plug>(textmanip-move-down) 
  vmap <C-k> <Plug>(textmanip-move-up)
  vmap <C-h> <Plug>(textmanip-move-left)
  vmap <C-l> <Plug>(textmanip-move-right) 
"------------------------------

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

let g:neocomplcache_max_list=1000
 
set completeopt=menuone
