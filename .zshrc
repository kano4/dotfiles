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

# Alias
alias ls="ls --color"
alias la="ls -a --color"
alias lf="ls -F --color"

alias r2="rvm use 1.8.7@rails2"
alias r3="rvm use system"
alias r31="rvm use 1.9.2@rails3-pre"

PATH=$PATH:/usr/local/src/ns-allinone-2.34/ns-2.34
PATH=$PATH:/usr/local/src/ns-allinone-2.34/nam-1.14
PATH=$PATH:/usr/local/src/ns-allinone-2.34/ns-2.34/bin
PATH=$PATH:/usr/local/src/ns-allinone-2.34/xgraph-12.1
