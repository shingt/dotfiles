zplug "zsh-users/zsh-autosuggestions"
zplug "b4b4r07/enhancd", use:init.sh
if zplug check "b4b4r07/enhancd"; then
    export ENHANCD_FILTER="fzf --height 50% --reverse --ansi"
    export ENHANCD_DOT_SHOW_FULLPATH=1
fi
zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-syntax-highlighting", defer:2
zplug "glidenote/hub-zsh-completion"
zplug 'Valodim/zsh-curl-completion'

