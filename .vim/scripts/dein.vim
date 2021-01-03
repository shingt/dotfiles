let s:dein_dir = fnamemodify('~/.vim/dein/', ':p')
let s:dein_repo_dir = s:dein_dir . 'repos/github.com/Shougo/dein.vim'

if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' shellescape(s:dein_repo_dir)
endif

if &runtimepath !~# '/dein.vim'
    execute 'set runtimepath^=' . s:dein_repo_dir
endif

call dein#begin(s:dein_dir)
call dein#add('Shougo/dein.vim')
call dein#add('Shougo/neocomplete.vim')
call dein#add('Shougo/neomru.vim')
call dein#add('Shougo/neosnippet.vim')
call dein#add('Shougo/neocomplcache.git')
call dein#add('Shougo/neocomplcache-rsense.vim')
call dein#add('Shougo/neobundle.vim')
call dein#add('Shougo/vimproc.vim', {
      \ 'build' : {
      \     'windows' : 'make -f make_mingw32.mak',
      \     'cygwin' : 'make -f make_cygwin.mak',
      \     'mac' : 'make -f make_mac.mak',
      \     'unix' : 'make -f make_unix.mak',
      \    },
      \ })
call dein#add('Shougo/vimshell')
call dein#add('Shougo/unite.vim')
call dein#add("osyo-manga/unite-quickfix")
call dein#add('ujihisa/unite-colorscheme')
call dein#add('Shougo/neosnippet')
call dein#add('Shougo/neosnippet-snippets')
call dein#add('jpalardy/vim-slime')
call dein#add('mileszs/ack.vim')
call dein#add('davidklsn/vim-sialoquent')
call dein#add('thinca/vim-ref')
call dein#add('yuku-t/vim-ref-ri') " Requires w3m or lynx
call dein#add('thinca/vim-quickrun')
call dein#add('preservim/nerdtree')
call dein#add('tpope/vim-obsession')

call dein#add('airblade/vim-gitgutter')
call dein#add('rhysd/github-complete.vim')
call dein#add('w0ng/vim-hybrid')
call dein#add('dracula/vim')
call dein#add('junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' })
call dein#add('rking/ag.vim')
call dein#add("kana/vim-smartinput")
call dein#add("cohama/vim-smartinput-endwise")
call dein#add('kana/vim-fakeclip')
call dein#add('octol/vim-cpp-enhanced-highlight')
call dein#add('fatih/vim-go')
call dein#add('keith/swift.vim')
call dein#add('leafgarland/typescript-vim')
call dein#add('thalesmello/lkml.vim')
call dein#add('udalov/kotlin-vim')
call dein#add('vim-syntastic/syntastic', {'autoload':{'filetypes': ['xml', 'html', 'sass', 'css', 'js', 'yaml', 'json', 'xslt', 'python', 'perl', 'c', 'objc']}}, {'lazy': 1})
call dein#add('vim-scripts/ZenCoding.vim', {'autoload': {'filetypes': ['html']}}, {'lazy': 1})

call dein#add('tpope/vim-rails', {'autoload':{'filetypes': ['ruby']}}, {'lazy': 1})
call dein#add('tpope/vim-bundler', {'lazy': 1})
call dein#add('basyura/unite-rails', {'lazy': 1})
call dein#add('vim-perl/vim-perl', {'lazy': 1})
call dein#add('chrismetcalf/vim-markdown', {'autoload':{'filetypes': ['markdown']}}, {'lazy': 1})
call dein#add("vim-scripts/nginx.vim", {'lazy': 1})
call dein#add("ekalinin/Dockerfile.vim", {'lazy': 1})
call dein#add('juvenn/mustache.git', {'lazy': 1})
call dein#add('mattn/flappyvird-vim.git', {'lazy': 1})
call dein#add('alpaca-tc/alpaca_tags', {
      \    'depends': ['Shougo/vimproc'],
      \    'autoload' : {
      \       'commands' : [
      \          { 'name' : 'AlpacaTagsBundle', 'complete': 'customlist,alpaca_tags#complete_source' },
      \          { 'name' : 'AlpacaTagsUpdate', 'complete': 'customlist,alpaca_tags#complete_source' },
      \          'AlpacaTagsSet', 'AlpacaTagsCleanCache', 'AlpacaTagsEnable', 'AlpacaTagsDisable', 'AlpacaTagsKillProcess', 'AlpacaTagsProcessStatus',
      \       ],
      \    }
      \ }, {'lazy': 1})

call dein#add('kmnk/vim-unite-giti', {
      \ 'autoload': {
      \   'unite_sources': [
      \     'giti', 'giti/branch', 'giti/branch/new', 'giti/branch_all',
      \     'giti/config', 'giti/log', 'giti/remote', 'giti/status'
      \   ]
      \ }}, {'lazy': 1})

call dein#add('tpope/vim-fugitive', { 'autoload': {
      \ 'functions' : ['fugitive#head', 'fugitive#detect'],
      \ 'commands': ['Gcommit', 'Gblame', 'Ggrep', 'Gdiff', 'Gcd'] }}, {'lazy': 1})

call dein#end()
filetype plugin indent on
syntax enable
if dein#check_install()
  call dein#install()
endif

let g:alpaca_tags#config = {
      \    '_' : '-R . --sort=yes',
      \    'ruby': '--languages=+Ruby',
      \ }

augroup AlpacaTags
  autocmd!
  if exists(':AlpacaTags')
    autocmd BufWritePost Gemfile AlpacaTagsBundle
    autocmd BufEnter * AlpacaTagsSet
  endif
augroup END

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

call pathogen#infect()

" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif

" Tell Neosnippet about the other snippets
let g:neosnippet#snippets_directory='~/.vim/snippets'

let g:hi_insert = 'highlight StatusLine guifg=darkblue guibg=darkyellow gui=none ctermfg=blue ctermbg=yellow cterm=none'

function! s:GetHighlight(hi)
  redir => hl
  exec 'highlight '.a:hi
  redir END
  let hl = substitute(hl, '[\r\n]', '', 'g')
  let hl = substitute(hl, 'xxx', '', '')
  return hl
endfunction

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

if has('syntax')
  augroup InsertHook
    autocmd!
    autocmd InsertEnter * call s:StatusLine('Enter')
    autocmd InsertLeave * call s:StatusLine('Leave')
  augroup END
endif

" Disable AutoComplPop.
let g:acp_enableAtStartup = 0

let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_smart_case = 1
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

let g:neocomplcache_enable_camel_case_completion = 1
let g:neocomplcache_enable_underbar_completion = 1

" Rsense
if !exists('g:neocomplcache_omni_patterns')
    let g:neocomplcache_omni_patterns = {}
endif
let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'
autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete

let g:rsenseHome = "/Users/shingt/.rbenv/shims/rsense"
let g:rsenseUseOmniFunc = 1

" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
      \ 'default' : ''
      \ }

syntax on

let NERDTreeShowHidden = 1
nnoremap <silent><C-e> :NERDTreeToggle<CR>
nnoremap <C-h> gT
nnoremap <C-l> gt
nnoremap <C-\> :tabnew<CR>

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
let g:ref_open = 'split'
nnoremap ri :<C-U>Unite ref/ri -default-action=split -input=

aug MyAutoCmd
  au FileType ruby,ruby.rspec nnoremap <silent><buffer>KK :<C-U>Unite -no-start-insert ref/ri   -input=<C-R><C-W><CR>
aug END

" Go
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
autocmd FileType go :highlight goErr cterm=bold ctermfg=214
autocmd FileType go :match goErr /\<err\>/
let g:syntastic_mode_map = { 'mode': 'passive',
    \ 'active_filetypes': ['go'] }

" C++
let g:cpp_class_scope_highlight = 1

" fugitive
nnoremap <silent>ga :Gwrite<CR>
nnoremap <silent>gb :Gblame<CR>
nnoremap <silent>gB :Gbrowse<CR>
nnoremap <silent>gc :Gcommit<CR>
nnoremap <silent>gM :Gcommit --amend<CR>
nnoremap <silent>gd :Gdiff<CR>

let hooks = neobundle#get_hooks('vim-fugitive')
function! hooks.on_source(bundle)
  augroup MyGitCmd
    autocmd!
    autocmd FileType fugitiveblame vertical res 25
    autocmd FileType gitcommit,git-diff nnoremap <buffer>q :q<CR>
  augroup END

  let g:fugitive_git_executable = executable('hub') ? 'hub' : 'git'
endfunction

function! hooks.on_post_source(bundle)
  call fugitive#detect(expand('<amatch>:p'))
endfunction

command! FugitiveReload call fugitive#detect(expand('<amatch>:p'))
unlet hooks

" vim-unite-giti
nnoremap <silent>gl :Unite giti/log -no-start-insert -horizontal<CR>
nnoremap <silent>gP :Unite giti/pull_request/base -no-start-insert -horizontal<CR>
nnoremap <silent>gs :Unite giti/status -no-start-insert -horizontal<CR>
nnoremap <silent>gh :Unite giti/branch_all -no-start-insert<CR>

augroup AlpacaTags
  autocmd!
  if exists(':Tags')
    autocmd BufWritePost Gemfile TagsBundle
    autocmd BufEnter * TagsSet
  endif
augroup END

