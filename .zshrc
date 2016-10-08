#
# Aliases
#

# Zsh
alias zshconfig="vim ~/.zshrc"
alias zshconf="vim ~/.zshrc"
alias zshreload="source ~/.zshrc"
alias ohmyzsh="vim ~/.oh-my-zsh"

# Util
alias tarmake='tar -cpzf'
alias untar='tar -xzf'
alias netusage='lsof -P -i -n | cut -f 1 -d " " | uniq'
alias ls='ls -a -F --color=auto'
alias grep='grep --color'

# Tmux
alias tnew='tmux new -s'

#
# Settings
#

# Load local machine specific settings
# This file contains at least the system PATH variable
source ~/.zshrc.local

# Path to your oh-my-zsh installation
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load
ZSH_THEME="robbyrussell"
#ZSH_THEME="robbyrussell"

# Disable auto-setting terminal title
DISABLE_AUTO_TITLE="true"

# Command execution time stamp format
HIST_STAMPS="dd/mm/yyyy"

# Oh-my-zsh updates interval
export UPDATE_ZSH_DAYS=7

# Load oh-my-zsh
source $ZSH/oh-my-zsh.sh

# Which plugins would you like to load (plugins in ~/.oh-my-zsh/plugins/*)
if [[ "$OSTYPE" == "linux-gnu" ]]; then
  plugins=(git ruby bundler rake pyenv pip tmux docker docker-compose node npm gulp bower)
elif [[ "$OSTYPE" == "darwin"* ]]; then
  plugins=(git ruby bundler rake pyenv pip tmux docker docker-compose brew node npm gulp bower)
else
  plugins=()
fi

# You may need to manually set your language environment
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='mvim'
fi

# Term
export TERM="screen-256color"

# Allows you to type Bash style comments on your command line
setopt interactivecomments

# Zsh spelling correction ON
setopt CORRECT

#
# Binaries
#

# Initialize root dir variables
if [[ "$OSTYPE" == "linux-gnu" ]]; then
  export RBENV_DIR="$HOME/.rbenv"
  export NVM_DIR="$HOME/.nvm"
  export PYENV_DIR="$HOME/.pyenv"
elif [[ "$OSTYPE" == "darwin"* ]]; then
  export RBENV_DIR=$(brew --prefix rbenv)
  export NVM_DIR="$HOME/.nvm" #$(brew --prefix nvm)
  export PYENV_DIR=$(brew --prefix pyenv)
fi

# Ruby
if [ -x $RBENV_DIR ]; then
  export PATH="$RBENV_DIR/bin:$PATH"
  export PATH="$RBENV_DIR/shims:$PATH"
  export PATH="$RBENV_DIR/plugins/ruby-build/bin:$PATH"
  eval "$(rbenv init -)"
fi

# Python
if [ -x $PYENV_DIR ]; then
  export PATH="$PYENV_DIR/bin:$PATH"
  export PATH="$PYENV_DIR/shims:$PATH"
  eval "$(pyenv init -)"
  export WORKON_HOME=~/.virtualenvs
  if [ -x /usr/local/bin/virtualenvwrapper.sh ]; then
  	source /usr/local/bin/virtualenvwrapper.sh
  fi
fi
# pip should only run if there is a virtualenv currently activated
export PIP_REQUIRE_VIRTUALENV=true
# use gpip to install a global package
gpip(){ PIP_REQUIRE_VIRTUALENV="" pip "$@" }

# Node.js
if [ -x $NVM_DIR ]; then
  [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
  ln -fs "$(which node)" /usr/local/bin/node
fi

# dircolors
if [ -x /usr/bin/dircolors ]; then
  test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
fi

# Powerline
# if [ -x $PYENV_DIR/shims/powerline-config ]; then
#   export POWERLINE_CONFIG_COMMAND=$PYENV_DIR/shims/powerline-config
#   py_version=$(python -c 'import platform; print(platform.python_version())')
#   py_major=$(python -c 'import sys; print(sys.version_info.major)')
#   py_minor=$(python -c 'import sys; print(sys.version_info.minor)')
#   export POWERLINE_ROOT=$PYENV_DIR/versions/$py_version/lib/python$py_major.$py_minor/site-packages/powerline
#   #powerline-daemon -q
#   #. $POWERLINE_ROOT/bindings/zsh/powerline.zsh
# fi

export PATH=/usr/local/bin:$PATH
export PATH="/usr/local/sbin:$PATH"
