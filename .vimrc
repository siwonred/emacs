" set transp=5
" colo evening

filetype plugin indent on

au FileType js set ft=javascript syntax=jquery

au BufNewFile  *.ctp set filetype=php
au BufRead *.ctp set filetype=php

au Filetype ctp source ~/.vim/indent/html.vim

:set lcs=tab:>\ ,extends:>,precedes:<

let PHP_removeCRwhenUnix = 1
let PHP_BracesAtCodeLevel = 1

set backup
set backupdir=~/.vim/backup
set directory=~/.vim/tmp

set nu
set hlsearch
set ts=2
set sw=2

set shiftround
set expandtab

set fileencoding=utf-8
set indentexpr=

" 파일의 종류를 자동으로 인식
filet plugin indent on

" 알아서 하이라이팅
syntax on


" 자동 들여쓰기 사용
set ai

" 똑똑한 들여쓰기 사용
set si

" 오리지널 Vi 와의 호환성을 없애고, Vim 만의 기능들을 쓸 수 있게 함.
set nocp

" 명령어 기록을 남길 갯수 지정
set hi=1000

" 커서의 위치를 항상 보이게 함.
set ru

" magic 기능 사용
set magic

" 여러가지 이동 동작시 줄의 시작으로 자동 이동
set sol

" Tab 자동 완성시 가능한 목록을 보여줌
set wmnu

" 백스페이스 사용
" set bs=indent,eol,start

if has("gui_macvim")
    let macvim_hig_shift_movement = 1
endif

vmap <Tab> >gv
vmap <S-Tab> <gv

map <D-r> <Nop>
imap <D-r> <Nop>

" imap <M-Right> <ESC>e
" map <M-Right> e

nnoremap <M-Left>  b
nnoremap <M-Right> w
inoremap <M-Left>  <Esc>b
inoremap <M-Right> <Esc>w


map <PageUp> <C-U><C-U>
map <PageDown> <C-D><C-D>
map! <PageUp> <C-O><C-U><C-O><C-U>
map! <PageDown> <C-O><C-D><C-O><C-D>

set fileformats=unix,dos,mac

autocmd BufRead * silent! %s/[\r \t]\+$//
autocmd BufEnter *.php :%s/[ \t\r]\+$//e


