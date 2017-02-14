set nocompatible

"------------------------------------
" NeoBundle設定
"------------------------------------
filetype off
if has('vim_starting')
  set rtp+=$HOME/.vim/bundle/neobundle.vim/
endif
call neobundle#begin(expand('~/.vim/bundle'))
NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'stephpy/vim-yaml'
NeoBundle 'scrooloose/nerdtree'
"NeoBundle 'Shougo/neocomplcache.git'
"NeoBundle 'Shougo/unite.vim.git'

call neobundle#end()

filetype plugin indent on
NeoBundleCheck

"------------------------------------
" カラースキーマ設定
"------------------------------------
colorscheme calorie
set t_Co=256

"------------------------------------
" 基本設定
"------------------------------------
" バックアップを取らない
set nobackup
" バックアップを取る
" set backup
" バックアップを作るディレクトリを指定する
" set backupdir=~/.vim/tmp
" コマンドラインの履歴数
set history=10000
" マウスを使用可能にする
set mouse=a



"" edit settings
set autoindent		
set cindent         
set showmatch		
"上行末尾の文字を１文字消去
set backspace=2		
"<Tab>の空白数
set tabstop=4       
"インデント幅
set shiftwidth=4	

"" display settings
" ,nで行表示トグル切り替え
if version >= 703
  nnoremap <silent> ,n :<C-u>ToggleNumber<CR>
  command! -nargs=0 ToggleNumber call ToggleNumberOption()

  function! ToggleNumberOption()
    if &number
      set relativenumber
    else
      set number
    endif
  endfunction
endif
set number
set title
set ruler
set laststatus=2
syntax on           
set cursorline
set cursorcolumn
set showcmd     " 入力中コマンド表示
autocmd BufNewFile,BufRead *.psgi set filetype=perl
autocmd BufNewFile,BufRead *.t    set filetype=perl

" html用設定
au BufRead,BufNewFile,BufReadPre *.html   set filetype=html
autocmd FileType html    setlocal sw=2 sts=2 ts=2 et

"" search setting
set incsearch		
set hlsearch        
set ignorecase		
" 大文字がある時のみ、大小文字を区別しない
set smartcase       
set nowrapscan

" clipboard
set clipboard+=unnamed	  
set clipboard+=autoselect 

"" key mappings

let g:BASH_Ctrl_j = 'off' " ターミナルでしかきかない？
inoremap <C-j> <Down>
"inoremap <C-k> <Up>
inoremap <C-h> <Left>
inoremap <C-l> <Right>
inoremap {} {}<Left>
inoremap [] []<Left>
inoremap () ()<Left>
inoremap "" ""<Left>
inoremap '' ''<Left>
inoremap <> <><Left>
inoremap <C-d> $
inoremap <C-a> @
inoremap <C-p> %

"" encoding
set encoding=utf-8
set fileencodings=utf-8,iso-2022-jp,cp932,euc-jp,Shift_JIS

"タブ、空白、改行の可視化
set list
set listchars=tab:>.,eol:↲,extends:>,precedes:<,nbsp:%

set scrolloff=4

inoremap <C-e> <Esc>$a
inoremap <C-a> <Esc>^i
noremap <C-e> <Esc>$a
noremap <C-a> <Esc>^i

" Anywhere SID.
function! s:SID_PREFIX()
  return matchstr(expand('<sfile>'), '<SNR>\d\+_\zeSID_PREFIX$')
endfunction

" Set tabline.
function! s:my_tabline()  "{{{
  let s = ''
  for i in range(1, tabpagenr('$'))
    let bufnrs = tabpagebuflist(i)
    let bufnr = bufnrs[tabpagewinnr(i) - 1]  " first window, first appears
    let no = i  " display 0-origin tabpagenr.
    let mod = getbufvar(bufnr, '&modified') ? '!' : ' '
    let title = fnamemodify(bufname(bufnr), ':t')
    let title = '[' . title . ']'
    let s .= '%'.i.'T'
    let s .= '%#' . (i == tabpagenr() ? 'TabLineSel' : 'TabLine') . '#'
    let s .= no . ':' . title
    let s .= mod
    let s .= '%#TabLineFill# '
  endfor
  let s .= '%#TabLineFill#%T%=%#TabLine#'
  return s
endfunction "}}}
let &tabline = '%!'. s:SID_PREFIX() . 'my_tabline()'
set showtabline=2 " 常にタブラインを表示

" The prefix key.
nnoremap    [Tag]   <Nop>
nmap    t [Tag]
" Tab jump
" t1 で1番左のタブ、t2 で1番左から2番目のタブにジャンプ
for n in range(1, 9)
  execute 'nnoremap <silent> [Tag]'.n  ':<C-u>tabnext'.n.'<CR>'
endfor

" tc 新しいタブを一番右に作る
map <silent> [Tag]c :tablast <bar> tabnew<CR>
" tx タブを閉じる
map <silent> [Tag]x :tabclose<CR>
" tn 次のタブ
map <silent> [Tag]n :tabnext<CR>
" tp 前のタブ
map <silent> [Tag]p :tabprevious<CR>


