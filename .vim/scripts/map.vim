noremap  <silent> <C-a>    0

vnoremap L l/)<CR>h
vnoremap H h?(<CR>l

nnoremap L l/)<CR>:noh<CR>h
nnoremap H h?(<CR>:noh<CR>l
nnoremap <silent> <C-p> :FZF<CR>

inoremap <C-d>    <Delete>
inoremap <C-l>   <Esc>:<C-u>w<CR>

cnoremap <C-f>    <Right>
cnoremap <C-b>    <Left>
cnoremap <C-a>    <Home>
cnoremap <C-e>    <End>
cnoremap <C-d>    <Del>
cnoremap <C-h>    <BackSpace>
cnoremap <S-Tab>  <C-d>

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

" for MacVim
nnoremap <S-C>   c$

