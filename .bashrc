# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
  . /etc/bashrc
fi

# User specific aliases and functions
source ~/.git-completion.sh
PS1="\w\$(__git_ps1 [%s]) \$ "

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

alias c='clear'
alias f='fg'
alias v='vim'
alias e='emacs -nw'
alias g='git'

PATH=$PATH:~/ns-allinone-2.34/ns-2.34
PATH=$PATH:~/ns-allinone-2.34/nam-1.14
PATH=$PATH:~/ns-allinone-2.34/ns-2.34/bin
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
