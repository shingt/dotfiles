if [ -f ~/.bash_profile ]; then
  source ~/.bash_profile
fi

DOTFILES_DIR=src/github.com/shingt/dotfiles
source ~/$DOTFILES_DIR/.zsh.d/zshrc

# ------------------------------
# git-completion.zsh
# ------------------------------

if which brew > /dev/null; then
  fpath=($(brew --prefix)/share/zsh/site-functions $fpath)
else
  fpath=(~/.zsh.d/completion $fpath)
fi

# ------------------------------
# General Settings
# ------------------------------

export EDITOR=vim
export LANG=ja_JP.UTF-8
export KCODE=u
export AUTOFEATURE=true
export TERM='xterm-256color'

bindkey -e

setopt no_beep
setopt auto_cd
setopt auto_pushd
setopt correct
setopt magic_equal_subst
setopt prompt_subst
setopt notify
setopt equals

### Complement ###
autoload -U compinit; compinit
setopt auto_list
setopt auto_menu
setopt list_packed
setopt list_types
bindkey "^[[Z" reverse-menu-complete
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

### Glob ###
setopt extended_glob
unsetopt caseglob

### History ###
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt bang_hist
setopt extended_history
setopt hist_ignore_dups
setopt share_history
setopt hist_reduce_blanks

autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end

# ------------------------------
# Look And Feel Settings
# ------------------------------

# Ls Color
export LS_COLORS='di=01;34:ln=01;35:so=01;32:ex=01;31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
export ZLS_COLORS=$LS_COLORS
export CLICOLOR=true
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

### Prompt ###
autoload -U colors; colors
tmp_prompt="%{${fg[cyan]}%}%n%# %{${reset_color}%}"
tmp_prompt2="%{${fg[cyan]}%}%_> %{${reset_color}%}"
tmp_rprompt="%{${fg[green]}%}[%~]%{${reset_color}%}"
tmp_sprompt="%{${fg[yellow]}%}%r is correct? [Yes, No, Abort, Edit]:%{${reset_color}%}"

if [ ${UID} -eq 0 ]; then
  tmp_prompt="%B%U${tmp_prompt}%u%b"
  tmp_prompt2="%B%U${tmp_prompt2}%u%b"
  tmp_rprompt="%B%U${tmp_rprompt}%u%b"
 
  tmp_sprompt="%B%U${tmp_sprompt}%u%b"
fi

PROMPT=$tmp_prompt
PROMPT2=$tmp_prompt2
RPROMPT=$tmp_rprompt
SPROMPT=$tmp_sprompt

# SSH logined
[ -n "${REMOTEHOST}${SSH_CONNECTION}" ] &&
  PROMPT="%{${fg[white]}%}${HOST%%.*} ${PROMPT}"
;

### Title (user@hostname) ###
case "${TERM}" in
  (kterm*|xterm*|)
    precmd() {
      echo -ne "\033]0;${USER}@${HOST%%.*}\007"
    }
    ;;
esac

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# rbenv
if [ -d ${HOME}/.rbenv  ] ; then
  export PATH="${HOME}/.rbenv/bin:${HOME}/.rbenv/shims:${PATH}"
  eval "$(rbenv init -)"
fi

if [ -f ${HOME}/google-cloud-sdk/path.zsh.inc ]; then
  source "${HOME}/google-cloud-sdk/path.zsh.inc"
fi
if [ -f /Users/shingt/google-cloud-sdk/completion.zsh.inc ]; then
  source "${HOME}/google-cloud-sdk/completion.zsh.inc"
fi

# ------------------------------
# Functions
# ------------------------------

# ghq + peco (http://weblog.bulknews.net/post/89635306479/ghq-peco-percol)
function peco-src () {
  local selected_dir=$(ghq list --full-path | peco --query "$LBUFFER")
  if [ -n "$selected_dir" ]; then
    BUFFER="cd ${selected_dir}"
    zle accept-line
  fi
  zle clear-screen
}
zle -N peco-src
bindkey '^]' peco-src

function history-all { history -E 1 }

function open-pull-request () {
    merge_commit=$(ruby -e 'print (File.readlines(ARGV[0]) & File.readlines(ARGV[1])).last' <(git rev-list --ancestry-path $1..master) <(git rev-list --first-parent $1..master))
    if git show $merge_commit | grep -q 'pull request'
    then
        pull_request_number=$(git log -1 --format=%B $merge_commit | sed -e 's/^.*#\([0-9]*\).*$/\1/' | head -1)
        url="`hub browse -u`/pull/${pull_request_number}"
    fi
    open $url
}

# See: http://qiita.com/__hage/items/db024acea35575121b25
function tmux-remake-socket () {
    if [ ! $TMUX ]; then
        return
    fi
    tmux_socket_file=`echo $TMUX|awk -F, '{print $1}'`
    if [ ! -S $tmux_socket_file ]; then
        mkdir -m700 `dirname $tmux_socket_file` 2> /dev/null
        killall -SIGUSR1 tmux
    else
        echo tmux unix domain socket exists! nothing to do.
    fi
    unset tmux_socket_file
}

function peco-select-history() {
    typeset tac
    if which tac > /dev/null; then
        tac=tac
    else
        tac='tail -r'
    fi
    BUFFER=$(fc -l -n 1 | eval $tac | peco --query "$LBUFFER")
    CURSOR=$#BUFFER
    zle redisplay
}
zle -N peco-select-history
bindkey '^r' peco-select-history

function peco-find-file() {
    if git rev-parse 2> /dev/null; then
        source_files=$(git ls-files)
    else
        source_files=$(find . -type f)
    fi
    selected_files=$(echo $source_files | peco --prompt "[find file]")

    result=''
    for file in $selected_files; do
        result="${result}$(echo $file | tr '\n' ' ')"
    done

    BUFFER="${BUFFER}${result}"
    CURSOR=$#BUFFER
    zle redisplay
}
zle -N peco-find-file
bindkey '^q' peco-find-file

# ------------------------------
# Aliases
# ------------------------------

# Global
alias -g b='`git branch | peco | sed -e "s/^\*[ ]*//g"`'
alias -g R='`git remote | peco --prompt "GIT REMOTE>" | head -n 1`'

## For `git checkout -b LOCAL REMOTE`
alias -g LR='`git branch -a | peco --query "remotes/ " --prompt "GIT REMOTE BRANCH>" | head -n 1 | sed "s/remotes\/[^\/]*\/\(\S*\)/\1 \0/"`'

alias opr='open-pull-request'

# ------------------------------
# Others
# ------------------------------

# zplug

export ZPLUG_HOME=/opt/homebrew/opt/zplug
if [[ -f $ZPLUG_HOME/init.zsh ]]; then
    export ZPLUG_LOADFILE=~/.zsh.d/zplug.zsh
    source $ZPLUG_HOME/init.zsh

    if ! zplug check --verbose; then
        printf "Install? [y/N]: "
        if read -q; then
            echo; zplug install
        fi
        echo
    fi
    zplug load
fi

[ -f ~/.zshrc.local ] && source ~/.zshrc.local

export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"
