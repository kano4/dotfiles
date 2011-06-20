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

alias r2="rvm use 1.8.7@rails2"
alias r3="rvm use system"
alias r31="rvm use 1.9.2@rails3-pre"

alias scala='nocorrect scala'
alias nvm='nocorrect nvm'
alias sass='nocorrect sass'
