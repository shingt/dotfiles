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
set statusline=%<%f\ %{fugitive#statusline()}\ %m%r%h%w%y%{'\ \ \/'.(&fenc!=''?&fenc:&enc).'\/'.&ff.'\/'}%=%l,%c%V%8P
set nolist
set lcs=tab:\ \ 
set wildmenu
set showcmd
set autoindent
set expandtab
set shiftwidth=2
set smarttab
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

filetype plugin indent on

highlight link EndOfBuffer Ignore

augroup filetypedetect
  autocmd! BufNewFile,BufRead *.pl  set tabstop=4 shiftwidth=4
  autocmd! BufNewFile,BufRead *.pm  set tabstop=4 shiftwidth=4
  autocmd! BufNewFile,BufRead *.rb  set tabstop=2 shiftwidth=2
  autocmd! BufNewFile,BufRead *.md  set tabstop=2 shiftwidth=2
  autocmd! BufNewFile,BufRead Fastfile set ft=ruby
augroup END

autocmd QuickfixCmdPost vimgrep cw

let autodate_format="%Y-%m-%d"

