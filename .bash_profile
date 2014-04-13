# bash_profile

if [ -f ~/.bashrc ]; then
  source ~/.bashrc
fi

# Setting PATH for Python 2.7
# The orginal version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/2.7/bin:${PATH}"
export PATH

export PATH=/usr/local/sbin:$PATH
export PATH=/usr/local/bin:$PATH
export PATH=/sbin:$PATH
export PATH=/bin:$PATH
export PATH=/opt/local/bin:/opt/local/sbin:$PATH

ANDROIDNDK_HOME=~/android-ndk-r8b
PATH=$PATH:${ANDROIDNDK_HOME}

export CLICOLOR=1
export LSCOLORS=DxGxcxdxCxegedabagacad

# jenkins
export PATH=~/mypath:$PATH

# node.js
export PATH=/usr/local/share/npm/bin:$PATH
export NODE_PATH=/usr/local/lib/node
export PATH=/usr/local/share/npm/lib/node_modules:$PATH
export PATH=/usr/local/share/npm/bin/node-dev:$PATH

# Opencv for python
export PYTHONPATH="/usr/local/lib/python2.7/site-packages:$PYTHONPATH"

# tex
export PATH=/usr/texbin:$PATH

# perlbrew
if [ -f ~/perl5/perlbrew/etc/bashrc ]; then
  source ~/perl5/perlbrew/etc/bashrc
fi

# SPTK
export PATH=/usr/local/SPTK/bin:$PATH

# mysql
export PATH=$PATH:/usr/local/mysql/bin

# gem
export PATH=$PATH:~/.rbenv/shims/gem

if [ `uname` = "Darwin" ]; then
  # postgres
  export PATH=$PATH:/Applications/Postgres93.app/Contents/MacOS/bin
  eval "$(rbenv init -)"
fi
 
