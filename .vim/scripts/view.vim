" Blink cursol
let &t_ti.="\e[1 q"
let &t_SI.="\e[5 q"
let &t_EI.="\e[1 q"
let &t_te.="\e[0 q"

"https://github.com/dracula/vim/issues/65
let g:dracula_italic = 0
colorscheme dracula

if &term == "screen"
  set t_Co=256
endif

