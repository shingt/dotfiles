autocmd!

set nocompatible
filetype off
if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim
endif

call neobundle#rc(expand('~/.vim/bundle/'))

NeoBundle 'Shougo/neocomplcache.git'
NeoBundle 'Shougo/neobundle.vim'
NeoBundle 'Shougo/vimproc', {
      \ 'build' : {
      \     'windows' : 'make -f make_mingw32.mak',
      \     'cygwin' : 'make -f make_cygwin.mak',
      \     'mac' : 'make -f make_mac.mak',
      \     'unix' : 'make -f make_unix.mak',
      \    },
      \ }
NeoBundle 'VimClojure'
NeoBundle 'Shougo/vimshell'
NeoBundle 'Shougo/unite.vim'
NeoBundle "git://github.com/osyo-manga/unite-quickfix.git"
NeoBundle 'ujihisa/unite-colorscheme'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'jpalardy/vim-slime'
NeoBundle 'git://github.com/mileszs/ack.vim'
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'thinca/vim-ref'
NeoBundle 'yuku-t/vim-ref-ri' " Requires w3m or lynx as well
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'scrooloose/nerdtree' 
NeoBundle 'keith/swift.vim'

NeoBundle 'airblade/vim-gitgutter'
NeoBundle 'rhysd/github-complete.vim'
NeoBundle 'w0ng/vim-hybrid'

NeoBundle 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
NeoBundle 'rking/ag.vim'

NeoBundle "kana/vim-smartinput"
NeoBundle "cohama/vim-smartinput-endwise"

" Use clipboard for yank and space
NeoBundle 'git://github.com/kana/vim-fakeclip.git'

" syntax check
NeoBundleLazy 'git://github.com/scrooloose/syntastic.git', {'autoload':{'filetypes': ['xml', 'html', 'sass', 'css', 'js', 'yaml', 'json', 'xslt', 'python', 'perl', 'c', 'objc']}}

" html
NeoBundleLazy 'ZenCoding.vim', {'autoload': {'filetypes': ['html']}}

" Rails
NeoBundleLazy 'git://github.com/tpope/vim-rails.git', {'autoload':{'filetypes': ['ruby']}}
NeoBundleLazy 'git://github.com/tpope/vim-bundler.git'
NeoBundleLazy 'git@github.com:basyura/unite-rails.git'

" Perl
NeoBundleLazy 'git://github.com/vim-perl/vim-perl.git'
NeoBundleLazy 'c9s/perlomni.vim'
NeoBundleLazy "y-uuki/perl-local-lib-path.vim"

" Configurations variables:
let mojo_highlight_data = 1

NeoBundleLazy 'git://github.com/kchmck/vim-coffee-script.git'
NeoBundleLazy 'git://github.com/chrismetcalf/vim-markdown.git', {'autoload':{'filetypes': ['markdown']}}
NeoBundleLazy "vim-scripts/nginx.vim"
NeoBundleLazy "ekalinin/Dockerfile.vim"
NeoBundleLazy 'vim-scripts/confluencewiki.vim'
NeoBundleLazy 'juvenn/mustache.git'

NeoBundleLazy 'mattn/flappyvird-vim.git'

NeoBundleLazy 'alpaca-tc/alpaca_tags', {
      \    'depends': ['Shougo/vimproc'],
      \    'autoload' : {
      \       'commands' : [
      \          { 'name' : 'AlpacaTagsBundle', 'complete': 'customlist,alpaca_tags#complete_source' },
      \          { 'name' : 'AlpacaTagsUpdate', 'complete': 'customlist,alpaca_tags#complete_source' },
      \          'AlpacaTagsSet', 'AlpacaTagsCleanCache', 'AlpacaTagsEnable', 'AlpacaTagsDisable', 'AlpacaTagsKillProcess', 'AlpacaTagsProcessStatus',
      \       ],
      \    }
      \ }

let g:alpaca_tags#config = {
      \    '_' : '-R . --sort=yes',
      \    'ruby': '--languages=+Ruby',
      \ }

filetype plugin indent on
filetype indent on

augroup AlpacaTags
  autocmd!
  if exists(':AlpacaTags')
    autocmd BufWritePost Gemfile AlpacaTagsBundle
    autocmd BufEnter * AlpacaTagsSet
  endif
augroup END

NeoBundleCheck

set imsearch=0
set iminsert=0
set encoding=utf-8
set fileencodings=utf-8,cp932,euc-jp,iso-2022-jp,ucs-2,latin1
set fileformats=unix,mac,dos
set ambiwidth=double

" 挿入モードでのバックスペースの挙動設定
set backspace=indent,eol,start

autocmd ColorScheme * highlight LineNr ctermfg=98
set background=dark
colorscheme hybrid 

set number
set showmatch
set laststatus=2
set statusline=%<%f\ %m%r%h%w%y%{'\ \ \/'.(&fenc!=''?&fenc:&enc).'\/'.&ff.'\/'}%=%l,%c%V%8P
set list
set lcs=tab:>\ 
set wildmenu
set showcmd
set autoindent
set expandtab
set shiftwidth=2
set smarttab
set tabstop=2

augroup filetypedetect
  autocmd! BufNewFile,BufRead *.pl  set tabstop=4 shiftwidth=4
  autocmd! BufNewFile,BufRead *.pm  set tabstop=4 shiftwidth=4
  autocmd! BufNewFile,BufRead *.swift  set tabstop=4 shiftwidth=4
  autocmd! BufNewFile,BufRead *.rb  set tabstop=2 shiftwidth=2
  autocmd! BufNewFile,BufRead *.md  set tabstop=2 shiftwidth=2
  autocmd! BufNewFile,BufRead *.hoge  set ft=confluencewiki
  autocmd! BufNewFile,BufRead Fastfile set ft=ruby
  autocmd! BufNewFile,BufRead *.cap set ft=ruby
  autocmd! BufNewFile,BufRead *.hamlc set ft=haml
  autocmd! BufNewFile,BufRead *.t    setf perl
  autocmd! BufNewFile,BufRead *.psgi setf perl
  autocmd! BufNewFile,BufRead *.fcgi setf perl
  autocmd! BufNewFile,BufRead *.tx   setf html
  autocmd! BufNewFile,BufRead *.tt   setf tt2html
  autocmd! BufNewFile,BufRead *.tt2  setf tt2html
  autocmd! BufNewFile,BufRead cpanfile setf tt2html
  autocmd! BufNewFile,BufRead *.hoge  setf confluencewiki
augroup END

set smartindent
set backupdir=$HOME/backup
set directory=$HOME/backup
set browsedir=buffer 
set hidden

set incsearch
set hlsearch
set ignorecase smartcase

" vimgrep時に自動でQuickFixを開く設定
autocmd QuickfixCmdPost vimgrep cw

" カーソルを行頭、行末で止まらないようにする
set whichwrap=b,s,h,l,<,>,[,]

" 日本語の行の連結時には空白を入力しない。
set formatoptions+=mM

" 画面最後の行をできる限り表示する。
set display+=lastline

" 補完の設定
set completeopt=menu,preview,longest

" 日付の自動入力のフォーマット
let autodate_format="%Y-%m-%d"

" 折り畳み設定
set foldmethod=marker

set clipboard=unnamed

" 自動改行防止
set tw=0

" keybindings 
noremap [MyPrefix] <Nop>
map <Space> [MyPrefix]
noremap [MyDoublePrefix] <Nop>
map <Space><Space> [MyDoublePrefix]

set winaltkeys=no
inoremap  <C-l>   <Esc>:<C-u>w<CR>

" カーソル点滅
let &t_ti.="\e[1 q"
let &t_SI.="\e[5 q"
let &t_EI.="\e[1 q"
let &t_te.="\e[0 q"

" ---------- for MacVim ----------

nnoremap <S-C>   c$

" ---------- move ----------

noremap  <silent> <C-a>    0
noremap  <silent> <C-e>    $
noremap j gj
noremap k gk
noremap gj j
noremap gk k
vnoremap L l/)<CR>h
vnoremap H h?(<CR>l
nnoremap L l/)<CR>:noh<CR>h
nnoremap H h?(<CR>:noh<CR>l

" ---------- insert mode ----------

inoremap <C-d>     <Delete>

" ---------- visual mode ----------

nnoremap gc   '[v']
vnoremap gc   :<C-u>normal gc<Enter>
onoremap gc   :<C-u>normal gc<Enter>

" ---------- command mode ----------
cnoremap <C-f>    <Right>
cnoremap <C-b>    <Left>
cnoremap <C-a>    <Home>
cnoremap <C-e>    <End>
cnoremap <C-d>    <Del>
cnoremap <C-h>    <BackSpace>
cnoremap <S-Tab>  <C-d>

nnoremap <C-p>    :FZF<CR>

nnoremap [MyPrefix]o             A;<Esc>o

" 名前付きレジスタにヤンク
nnoremap [MyPrefix]y "yy
" 名前付きレジスタにヤンクして削除
nnoremap [MyPrefix]d "yd
" 名前付きレジスタからペースト
nnoremap [MyPrefix]p "yp
nnoremap [MyPrefix]P "yP
" クリップボードの内容を名前付きレジスタに逃がす
nnoremap [MyPrefix]" :<C-u>let @y=@*<CR>:echo @y<CR>
" 単語の置き換え(クリップボードの内容を保つ)
nnoremap [MyPrefix]r "rciw<C-r>*<Esc>

" 全選択
nnoremap [MyPrefix]<C-a> ggVG
filetype off

set nocompatible               " be iMproved
filetype off                   " required!

call pathogen#infect()

"" --- snippet ----
" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
      \ "\<Plug>(neosnippet_expand_or_jump)"
      \: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
      \ "\<Plug>(neosnippet_expand_or_jump)"
      \: "\<TAB>"

" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif

" Tell Neosnippet about the other snippets
let g:neosnippet#snippets_directory='~/.vim/snippets'

let g:hi_insert = 'highlight StatusLine guifg=darkblue guibg=darkyellow gui=none ctermfg=blue ctermbg=yellow cterm=none'

if has('syntax')
  augroup InsertHook
    autocmd!
    autocmd InsertEnter * call s:StatusLine('Enter')
    autocmd InsertLeave * call s:StatusLine('Leave')
  augroup END
endif

let s:slhlcmd = ''
function! s:StatusLine(mode)
  if a:mode == 'Enter'
    silent! let s:slhlcmd = 'highlight ' . s:GetHighlight('StatusLine')
    silent exec g:hi_insert
  else
    highlight clear StatusLine
    silent exec s:slhlcmd
  endif
endfunction

function! s:GetHighlight(hi)
  redir => hl
  exec 'highlight '.a:hi
  redir END
  let hl = substitute(hl, '[\r\n]', '', 'g')
  let hl = substitute(hl, 'xxx', '', '')
  return hl
endfunction

" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
      \ 'default' : ''
      \ }

" === perl ===

autocmd BufNewFile *.pl 0r $HOME/.vim/template/perl-script.txt
autocmd BufNewFile *.t  0r $HOME/.vim/template/perl-test.txt

function! s:pm_template()
  let path = substitute(expand('%'), '.*lib/', '', 'g')
  let path = substitute(path, '[\\/]', '::', 'g')
  let path = substitute(path, '\.pm$', '', 'g')

  call append(0, 'package ' . path . ';')
  call append(1, 'use strict;')
  call append(2, 'use warnings;')
  call append(3, 'use utf8;')
  call append(4, '')
  call append(5, '')
  call append(6, '')
  call append(7, '1;')
  call cursor(6, 0)
endfunction
autocmd BufNewFile *.pm call s:pm_template()

function! s:get_package_name()
  let mx = '^\s*package\s\+\([^ ;]\+\)'
  for line in getline(1, 5)
    if line =~ mx
      return substitute(matchstr(line, mx), mx, '\1', '')
    endif
  endfor
  return ""
endfunction

function! s:check_package_name()
  let path = substitute(expand('%:p'), '\\', '/', 'g')
  let name = substitute(s:get_package_name(), '::', '/', 'g') . '.pm'
  if path[-len(name):] != name
    echohl WarningMsg
    echomsg "Package name differs from a saved path."
    echohl None
  endif
endfunction

au! BufWritePost *.pm call s:check_package_name()

autocmd FileType perl,cgi :compiler perl  

syntax on

if &term == "screen"
  set t_Co=256
endif

let NERDTreeShowHidden = 1

let g:gitgutter_max_signs = 1000

nnoremap <silent> ,ag :<C-u>Unite grep:. -buffer-name=search-buffer<CR>
nnoremap <silent> ,cag :<C-u>Unite grep:. -buffer-name=search-buffer<CR><C-R><C-W>

let g:unite_enable_ignore_case = 1
let g:unite_enable_smart_case = 1

if executable('ag')
  let g:unite_source_grep_command = 'ag'
  let g:unite_source_grep_default_opts =
        \ '-i --vimgrep --hidden --ignore ' .
        \ '''.hg'' --ignore ''.svn'' --ignore ''.git'' --ignore ''.bzr'''
  let g:unite_source_grep_recursive_opt = ''
endif

" Ruby docs
let g:ref_open                    = 'split'
nnoremap ri :<C-U>Unite ref/ri       -default-action=split -input=

aug MyAutoCmd
  au FileType ruby,ruby.rspec nnoremap <silent><buffer>KK :<C-U>Unite -no-start-insert ref/ri   -input=<C-R><C-W><CR>
aug END

