noremap [MyPrefix] <Nop>
map <Space> [MyPrefix]
noremap [MyDoublePrefix] <Nop>
map <Space><Space> [MyDoublePrefix]

inoremap  <C-l>   <Esc>:<C-u>w<CR>

" for MacVim
nnoremap <S-C>   c$

noremap  <silent> <C-a>    0
noremap j gj
noremap k gk
noremap gj j
noremap gk k
vnoremap L l/)<CR>h
vnoremap H h?(<CR>l
nnoremap L l/)<CR>:noh<CR>h
nnoremap H h?(<CR>:noh<CR>l

inoremap <C-d>    <Delete>
cnoremap <C-f>    <Right>
cnoremap <C-b>    <Left>
cnoremap <C-a>    <Home>
cnoremap <C-e>    <End>
cnoremap <C-d>    <Del>
cnoremap <C-h>    <BackSpace>
cnoremap <S-Tab>  <C-d>

nnoremap <silent> <C-p> :FZF<CR>

nnoremap [MyPrefix]o             A;<Esc>o
nnoremap [MyPrefix]y "yy
nnoremap [MyPrefix]d "yd
nnoremap [MyPrefix]p "yp
nnoremap [MyPrefix]P "yP
nnoremap [MyPrefix]" :<C-u>let @y=@*<CR>:echo @y<CR>
nnoremap [MyPrefix]r "rciw<C-r>*<Esc>
nnoremap [MyPrefix]<C-a> ggVG

function! s:buflist()
  redir => ls
  silent ls
  redir END
  return split(ls, '\n')
endfunction

function! s:bufopen(e)
  execute 'buffer' matchstr(a:e, '^[ 0-9]*')
endfunction

nnoremap <silent> ,b :call fzf#run({
      \   'source':  reverse(<sid>buflist()),
      \   'sink':    function('<sid>bufopen'),
      \   'options': '+m',
      \   'down':    len(<sid>buflist()) + 2
      \ })<CR>

