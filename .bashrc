# bashrc

export PATH=$PATH:/usr/local/sbin
export PATH=$PATH:/usr/local/bin
export PATH=$PATH:/sbin
export PATH=$PATH:/usr/sbin
export PATH=$PATH:~/.rbenv/shims/gem
export PATH=$PATH:~/Library/Python/2.7/bin
export PATH=$PATH:~/google-cloud-sdk/bin

# node.js
export PATH=$PATH:/usr/local/share/npm/bin
export NODE_PATH=/usr/local/lib/node
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

# Android
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools

export LANGUAGE=ja_JP.UTF-8
export LC_ALL=ja_JP.UTF-8
export CLICOLOR=1
export LSCOLORS=DxGxcxdxCxegedabagacad
export GPG_TTY=$(tty)

## https://github.com/google/google-api-ruby-client/issues/253#issuecomment-169957139
#export SSL_CERT_FILE=/usr/local/etc/openssl/cert.pem

# http://mawatari.jp/archives/mac-provisioning-by-homebrew-and-ansible
export HOMEBREW_CASK_OPTS="--appdir=/Applications"

# git
if [ -f /usr/local/etc/bash_completion.d/git-prompt.sh ] && [ -f /usr/local/etc/bash_completion.d/git-completion.bash ]; then
  source /usr/local/etc/bash_completion.d/git-prompt.sh
  GIT_PS1_SHOWDIRTYSTATE=true
  export PS1='\[\033[32m\]\u@\h\[\033[00m\]:\[\033[34m\]\w\[\033[31m\]$(__git_ps1)\[\033[00m\]\$ '
fi

# fzf
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
# Use ag instead of find to respect .gitignore.
export FZF_DEFAULT_COMMAND='(ag -l -g "")'

# ffmpeg
LD_LIBRARY_PATH=/usr/local/lib
PKG_CONFIG_PATH=/usr/local/lib/pkgconfig

if [ `uname` = "Darwin" ]; then
  alias cla11='clang++ -std=c++11 -stdlib=libc++'

  # Heroku Toolbelt
  export PATH="/usr/local/heroku/bin:$PATH"
fi

# go
if [ `which go 2> /dev/null` ]; then
  export GOPATH=$HOME
  export PATH=$PATH:$GOROOT/bin:$GOPATH/bin
fi

# nvm
if type node > /dev/null 2>&1; then
  NODE_PATH=`which node`
  export PATH=$PATH:$NODE_PATH/../
fi

# python
if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi
# Workaround: Not sure why but when tmux is luanched PYTHONPATH is automatically set.
unset PYTHONPATH

# rust
if [[ -s $HOME/.cargo/env ]] ; then . "$HOME/.cargo/env" ; fi

alias be="bundle exec"
alias tm='tmux'
alias tma='tmux attach'
alias dl="docker ps -l -q"
alias g='git'
alias gcop='git branch -a --sort=-authordate | cut -b 3- | perl -pe '\''s#^remotes/origin/###'\'' | perl -nlE '\''say if !$c{$_}++'\'' | grep -v -- "->" | peco | xargs git checkout'
alias ag='ag --path-to-ignore ~/.ignore'

# For ssh agent-forwarding
if [[ -s ~/.ssh/id_rsa ]] ; then ssh-add ~/.ssh/id_rsa > /dev/null 2>&1 ; fi

propen() {
    local current_branch_name=$(git symbolic-ref --short HEAD | xargs perl -MURI::Escape -e 'print uri_escape($ARGV[0]);')
    git config --get remote.origin.url | sed -e "s/^.*[:\/]\(.*\/.*\).git$/https:\/\/github.com\/\1\//" | sed -e "s/$/pull\/${current_branch_name}/" | xargs open
}
