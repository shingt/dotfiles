# bashrc

export PATH=/usr/local/sbin:$PATH
export PATH=/usr/local/bin:$PATH
export PATH=/sbin:$PATH
export PATH=/usr/sbin:$PATH
export PATH=~/.rbenv/shims/gem:$PATH
export PATH=~/Library/Python/2.7/bin:$PATH
export PATH=~/google-cloud-sdk/bin:$PATH

# node.js
export PATH=/usr/local/share/npm/bin:$PATH
export NODE_PATH=/usr/local/lib/node

export LANGUAGE=ja_JP.UTF-8
export LC_ALL=ja_JP.UTF-8
export CLICOLOR=1
export LSCOLORS=DxGxcxdxCxegedabagacad

# https://github.com/google/google-api-ruby-client/issues/253#issuecomment-169957139
export SSL_CERT_FILE=/usr/local/etc/openssl/cert.pem

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

# python
if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi
# Workaround: Not sure why but when tmux is luanched PYTHONPATH is automatically set.
unset PYTHONPATH

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

