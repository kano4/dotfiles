export LANG=ja_JP.UTF-8

autoload -U compinit
compinit

PROMPT="%/%% "
PROMPT2="%_%% "

HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
setopt hist_ignore_dups
setopt share_history

setopt auto_pushd
setopt correct
setopt nolistbeep

export PATH=/usr/local/bin:$PATH
alias sudo="sudo PATH=$PATH"

# Alias
alias ls="ls --color"
alias ll="ls -l --color"
alias la="ls -a --color"
alias lf="ls -F --color"

alias clc='clear'
alias v='vim'
alias e='emacs -nw'
alias g="git"

alias r186="rvm use 1.8.6"
alias r187="rvm use 1.8.7"
alias r191="rvm use 1.9.1"
alias r192="rvm use 1.9.2"
alias rj="rvm use jruby"
alias ree="rvm use ree"
alias rbmark="rvm use 1.8.6,1.8.7,1.9.1,1.9.2,ruby-head,ree benchmark"

alias r2="rvm use 1.8.7@rails2"
alias r30="rvm use 1.9.2@rails3.0"
alias r31="rvm use 1.9.2@rails3-pre"

alias be="bundle exec"
alias rspec="rspec -c"
alias cuke="cucumber"

alias scala='nocorrect scala'
alias nvm='nocorrect nvm'
alias sass='nocorrect sass'
