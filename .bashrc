# bashrc

export PATH=/usr/local/sbin:$PATH
export PATH=/usr/local/bin:$PATH
export PATH=/opt/lo/bin:$PATH
export PATH=/sbin:$PATH
export PATH=/usr/sbin:$PATH

export PATH=/usr/texbin:$PATH           # tex
export PATH=/usr/local/SPTK/bin:$PATH   # SPTK
export PATH=~/.rbenv/shims/gem:$PATH    # gem

# node.js
export PATH=/usr/local/share/npm/bin:$PATH
export NODE_PATH=/usr/local/lib/node
export PATH=/usr/local/share/npm/lib/node_modules:$PATH
export PATH=/usr/local/share/npm/bin/node-dev:$PATH
export PATH=$HOME/.nodebrew/current/bin:$PATH

# mysql
export PATH=/usr/local/mysql/bin:$PATH
export PATH=/usr/bin/mysql_config:$PATH

export LANGUAGE=ja_JP.UTF-8
export LC_ALL=ja_JP.UTF-8
export CLICOLOR=1
export LSCOLORS=DxGxcxdxCxegedabagacad

# https://github.com/google/google-api-ruby-client/issues/253#issuecomment-169957139
export SSL_CERT_FILE=/usr/local/etc/openssl/cert.pem

# git
if [ -f /usr/local/etc/bash_completion.d/git-prompt.sh ] && [ -f /usr/local/etc/bash_completion.d/git-completion.bash ]; then
  source /usr/local/etc/bash_completion.d/git-prompt.sh
  source /usr/local/etc/bash_completion.d/git-completion.bash
  GIT_PS1_SHOWDIRTYSTATE=true
  export PS1='\[\033[32m\]\u@\h\[\033[00m\]:\[\033[34m\]\w\[\033[31m\]$(__git_ps1)\[\033[00m\]\$ '
fi

# For ffmpeg
LD_LIBRARY_PATH=/usr/local/lib
PKG_CONFIG_PATH=/usr/local/lib/pkgconfig

if [ `uname` = "Darwin" ]; then
  # Setting PATH for Python 2.7
  # The orginal version is saved in .bash_profile.pysave
  PATH="/Library/Frameworks/Python.framework/Versions/2.7/bin:${PATH}"
  export PATH
  export PATH=/usr/local/sbin:$PATH
  export PATH=/usr/local/bin:$PATH
  export PATH=/sbin:$PATH
  export PATH=/bin:$PATH
  export PATH=/opt/local/bin:/opt/local/sbin:$PATH

  # OpenCV for python
  export PYTHONPATH="/usr/local/lib/python2.7/site-packages:$PYTHONPATH"

  ANDROIDNDK_HOME=~/android-ndk-r8b
  PATH=$PATH:${ANDROIDNDK_HOME}

  # postgres
  export PATH=$PATH:/Applications/Postgres93.app/Contents/MacOS/bin
  eval "$(rbenv init -)"

  alias cla11='clang++ -std=c++11 -stdlib=libc++'

  # Heroku Toolbelt
  export PATH="/usr/local/heroku/bin:$PATH"

  # Change iterm2 background 
#  alias ssh=~/bin/ssh-host-color

#elif [ `uname` = "Linux" ]; then
fi

if [ `which go 2> /dev/null` ]; then
  export GOPATH=$HOME
  export PATH=$PATH:$GOROOT/bin:$GOPATH/bin
fi

if [ -f ~/perl5/perlbrew/etc/bashrc ]; then
  source ~/perl5/perlbrew/etc/bashrc
fi

alias be="bundle exec"
alias perldoc='perldoc5.12'
# perl module version check
alias pmversion='perl -le '"'"'for $module (@ARGV) { eval "use $module"; print "$module ", ${"$module\::VERSION"} || "not found" }'"'"
alias tm='tmux'
alias tma='tmux attach'
alias tml='tmux list-window'
alias g='git'
alias sap='envchain aws sap'
alias -g b='`git branch | peco | sed -e "s/^\*[ ]*//g"`'

# For ssh agent-forwarding
if [ `uname` = "Darwin" ]; then
  if [[ -s ~/.ssh/id_rsa ]] ; then ssh-add ~/.ssh/id_rsa ; fi
  if [[ -s ~/.ssh/id_dsa ]] ; then ssh-add ~/.ssh/id_dsa ; fi
fi

eval "$(hub alias -s)"

propen() {
    local current_branch_name=$(git symbolic-ref --short HEAD | xargs perl -MURI::Escape -e 'print uri_escape($ARGV[0]);')
    git config --get remote.origin.url | sed -e "s/^.*[:\/]\(.*\/.*\).git$/https:\/\/github.com\/\1\//" | sed -e "s/$/pull\/${current_branch_name}/" | xargs open
}
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
