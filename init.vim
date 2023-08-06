" -------------------------
" 基本設定
" -------------------------
" バックアップファイルを作らない
set nobackup
" スワップファイルを作らない
set noswapfile
" 編集中のファイルが変更されたら自動で読み直す
set autoread
" バッファが編集中でもその他のファイルを開けるように
set hidden
" 入力中のコマンドをステータスに表示する
set showcmd
" 行末のスペースを可視化
set listchars=tab:^\ ,trail:~
" コメントの色を水色
hi Comment ctermfg=3
" windowのタイトルを変更
set title
" 行番号
set number
" 相対行番号
set relativenumber
" 不可視文字を可視化(タブが「▸-」と表示される)
set list listchars=tab:\▸\-

set foldmethod=indent
"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=/Users/akaikeyusuke/.cache/dein/repos/github.com/Shougo/dein.vim


" Let dein manage dein
" Required:
"call dein#add('/Users/akaikeyusuke/.cache/dein/repos/github.com/Shougo/dein.vim')

" Add or remove your plugins here like this:
"call dein#add('Shougo/neosnippet.vim')
"call dein#add('Shougo/neosnippet-snippets')
"
if dein#load_state('/Users/akaikeyusuke/.cache/dein')
  " XDG base direcory compartible
  let g:dein#cache_directory = $HOME . '/.cache/dein'

  call dein#begin('/Users/akaikeyusuke/.cache/dein')

  " Let dein manage dein
  " Required:
  call dein#add('/Users/akaikeyusuke/.cache/dein/repos/github.com/Shougo/dein.vim')

  " Add or remove your plugins here like this:
  "call dein#add('Shougo/neosnippet.vim')
  "call dein#add('Shougo/neosnippet-snippets')

  " ~~~ ????toml?????????????? ~~~
  " ??????????????toml????????????
   let s:toml_dir  = $HOME . '/.config/nvim' 
   let s:toml      = s:toml_dir . '/dein.toml'
   let s:lazy_toml = s:toml_dir . '/dein_lazy.toml'
  
   " toml???????????????????
   call dein#load_toml(s:toml,      {'lazy': 0})
   call dein#load_toml(s:lazy_toml, {'lazy': 1})
  " ~~~ toml??????????? ~~~

  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

"End dein Scripts-------------------------

set number             "行番号を表示
set autoindent         "改行時に自動でインデントする
set tabstop=2
set shiftwidth=2
set expandtab          "タブ入力を空白に変換
set splitright         "画面を縦分割する際に右に開く
set clipboard=unnamed  "yank した文字列をクリップボードにコピー
set hls                "検索した文字をハイライトする

set background=dark
colorscheme atom-dark-256



let mapleader = "\<Space>"

"easymotion Scripts -----------------------
"
let g:python3_host_prog='/opt/homebrew/bin/python3'

" <Leader>f{char} to move to {char}

" s{char}{char} to move to {char}{char}
nmap <Leader>s <Plug>(easymotion-overwin-f2)

" Move to line
map <Leader>L <Plug>(easymotion-bd-jk)
nmap <Leader>L <Plug>(easymotion-overwin-line)

" Move to word
map  <Leader>w <Plug>(easymotion-bd-w)
nmap <Leader>w <Plug>(easymotion-overwin-w)
"End easymotion Scripts -----------------------


function! s:javascript_filetype_settings()
    setlocal tabstop=4
    setlocal shiftwidth=4
    setlocal cindent
endfunction
autocmd FileType javascript call s:javascript_filetype_settings()

function! s:html_filetype_settings()
    setlocal tabstop=4
    setlocal shiftwidth=4
    setlocal includeexpr=substitute(v:fname,'^\\/','','') |
endfunction
autocmd FileType html call s:html_filetype_settings()

function! s:css_filetype_settings()
    setlocal tabstop=4
    setlocal shiftwidth=4
    setlocal cindent
endfunction
autocmd FileType css  call s:css_filetype_settings()
autocmd FileType less call s:css_filetype_settings()



nmap <silent> gd <Plug>(coc-definition)

nmap <silent>fm  <Plug>(coc-format)
nmap <silent>rn  <Plug>(coc-rename)

autocmd User EasyMotionPromptBegin silent! CocDisable
autocmd User EasyMotionPromptEnd silent! CocEnable


nmap <Esc><Esc> :nohlsearch<CR><Esc>

nnoremap [ %
nnoremap ] %


" カーソル位置の単語をyankする
nnoremap vv vawy
" カーソル位置の単語をカットする
nnoremap cc vawc

highlight Normal ctermbg=none
highlight NonText ctermbg=none
highlight LineNr ctermbg=none
highlight Folded ctermbg=none
highlight EndOfBuffer ctermbg=none 
