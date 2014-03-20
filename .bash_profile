# bash_profile

if [ -f ~/.bashrc ]; then
  source ~/.bashrc
fi

# Setting PATH for Python 2.7
# The orginal version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/2.7/bin:${PATH}"
export PATH
eval "$(rbenv init -)"

export PATH=/usr/local/sbin:$PATH
export PATH=/usr/local/bin:$PATH
export PATH=/sbin:$PATH

##
# Your previous /Users/shin/.bash_profile file was backed up as /Users/shin/.bash_profile.macports-saved_2012-09-24_at_11:06:33
##

# MacPorts Installer addition on 2012-09-24_at_11:06:33: adding an appropriate PATH variable for use with MacPorts.
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
# Finished adapting your PATH environment variable for use with MacPorts.

eval "$(rbenv init -)"

ANDROIDNDK_HOME=/Users/shin/android-ndk-r8b
PATH=$PATH:${ANDROIDNDK_HOME}

export CLICOLOR=1
export LSCOLORS=DxGxcxdxCxegedabagacad

# jenkins
export PATH=/Users/shin/mypath:$PATH

# node.js
export PATH=/usr/local/share/npm/bin:$PATH
export NODE_PATH=/usr/local/lib/node
export PATH=/usr/local/share/npm/lib/node_modules:$PATH
export PATH=/usr/local/share/npm/bin/node-dev:$PATH

#[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# For opencv for python
export PYTHONPATH="/usr/local/lib/python2.7/site-packages:$PYTHONPATH"

# tex
export PATH=/usr/texbin:$PATH

# perlbrew
source /Users/shin/perl5/perlbrew/etc/bashrc

# SPTK
export PATH=/usr/local/SPTK/bin:$PATH

# mysql
export PATH=$PATH:/usr/local/mysql/bin

eval "$(rbenv init -)"

# gem
#export GEM_HOME=/Users/shin/.rvm/gems
export PATH=$PATH:/Users/shin/.rbenv/shims/gem

# postgres
export PATH=$PATH:/Applications/Postgres93.app/Contents/MacOS/bin




