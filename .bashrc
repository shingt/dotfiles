# bashrc

#if [ -f `brew --prefix`/etc/bash_completion ]; then
#    . `brew --prefix`/etc/bash_completion
#fi

export PATH=/usr/local/sbin:$PATH # for Homebrew
export PATH=/usr/local/bin:$PATH  # for Homebrew
export PATH=/opt/lo/bin:$PATH

export PATH=/sbin:$PATH
export PATH=/usr/sbin:$PATH

if [ `uname` = "Darwin" ]; then
  #mac用のコード
  # git settings
  source /usr/local/git/contrib/completion/git-completion.bash
  alias cla11='clang++ -std=c++11 -stdlib=libc++'
  alias tmux="TERM=screen-256color-bce tmux"
elif [ `uname` = "Linux" ]; then
  #Linux用のコード
  echo 'set linux-specific configuration in  bashrc if you want.'
fi

GIT_PS1_SHOWDIRTYSTATE=true
export PS1='\[\033[32m\]\u@\h\[\033[00m\]:\[\033[34m\]\w\[\033[31m\]$(__git_ps1)\[\033[00m\]\$ '

# ffmpeg
LD_LIBRARY_PATH=/usr/local/lib
PKG_CONFIG_PATH=/usr/local/lib/pkgconfig

alias perldoc='perldoc5.12'

# perl module version check
alias pmversion='perl -le '"'"'for $module (@ARGV) { eval "use $module"; print "$module ", ${"$module\::VERSION"} || "not found" }'"'"
