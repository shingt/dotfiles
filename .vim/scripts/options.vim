set imsearch=0
set iminsert=0
set encoding=utf-8
set fileencodings=utf-8,cp932,euc-jp,iso-2022-jp,ucs-2,latin1
set fileformats=unix,mac,dos
set ambiwidth=double
set backspace=indent,eol,start
set number
set showmatch
set laststatus=2
set nolist
set lcs=tab:\ \ 
set wildmenu
set showcmd
set autoindent
set expandtab
set smarttab
set shiftwidth=2
set tabstop=2
set smartindent
set backupdir=$HOME/backup
set directory=$HOME/backup
set browsedir=buffer 
set hidden
set incsearch
set hlsearch
set ignorecase smartcase
set whichwrap=b,s,h,l,<,>,[,]
set formatoptions+=mM
set display+=lastline
set completeopt=menu,preview,longest
set foldmethod=marker
set clipboard=unnamed
set tw=0
set winaltkeys=no
set statusline=%<%f\ %{fugitive#statusline()}\ %m%r%h%w%y%{'\ \ \/'.(&fenc!=''?&fenc:&enc).'\/'.&ff.'\/'}%=%l,%c%V%8P

filetype plugin indent on

highlight link EndOfBuffer Ignore

augroup filetypedetect
  autocmd! BufNewFile,BufRead Fastfile set ft=ruby
  autocmd! BufNewFile,BufRead Dangerfile set ft=ruby
  autocmd! BufNewFile,BufRead Podfile set ft=ruby
  autocmd! BufNewFile,BufRead Cartfile set ft=swift
  autocmd! BufNewFile,BufRead *.def set ft=cpp
augroup END

autocmd QuickfixCmdPost vimgrep cw

let autodate_format="%Y-%m-%d"

