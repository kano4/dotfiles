# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
  . /etc/bashrc
fi

# User specific aliases and functions
source ~/.git-completion.sh
PS1="\w\$(__git_ps1 [%s]) \$ "

alias c='clear'
alias f='fg'
alias v='vim'
alias e='emacs -nw'
alias g='git'
