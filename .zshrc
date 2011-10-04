export LANG=ja_JP.UTF-8

autoload -U compinit
compinit

PROMPT="%/%% "
PROMPT2="%_%% "

autoload -Uz vcs_info
zstyle ':vcs_info:*' formats '(%s)-[%b]'
zstyle ':vcs_info:*' actionformats '(%s)-[%b|%a]'
precmd () {
  psvar=()
  LANG=en_US.UTF-8 vcs_info
  [[ -n "$vcs_info_msg_0_" ]] && psvar[1]="$vcs_info_msg_0_"
}
RPROMPT="%1(v|%F{green}%1v%f|)"


HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
setopt hist_ignore_dups
setopt share_history

setopt auto_pushd
setopt correct
setopt nolistbeep

PATH=$PATH:/usr/local/src/ns-allinone-2.34/ns-2.34
PATH=$PATH:/usr/local/src/ns-allinone-2.34/nam-1.14
PATH=$PATH:/usr/local/src/ns-allinone-2.34/otcl-1.13
PATH=$PATH:/usr/local/src/ns-allinone-3.34/ns-2.34/bin

PATH=$PATH:/usr/local/src/sbt

export PATH=/usr/local/bin:$PATH
alias sudo="sudo PATH=$PATH"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" # Load RVM function

# Alias
alias ls="ls --color=auto"
alias ll="ls -l"
alias la="ls -a"
alias lf="ls -F"

alias c='clear'
alias f='fg'
alias v='vim'
alias e='emacsclient'
alias g='git'
alias s='screen'

alias r186="rvm use 1.8.6"
alias r187="rvm use 1.8.7"
alias r191="rvm use 1.9.1"
alias r192="rvm use 1.9.2"
alias rj="rvm use jruby"
alias ree="rvm use ree"
alias rbmark="rvm use 1.8.7,1.9.2 benchmark"

alias r2="rvm use 1.8.7@rails2"
alias r30="rvm use 1.9.2@rails3.0"
alias r31="rvm use 1.9.2@rails3-pre"

alias be="bundle exec"
alias rspec="rspec -c"
alias cuke="cucumber"

alias scala='nocorrect scala'
alias nvm='nocorrect nvm'
alias sass='nocorrect sass'
alias ant='nocorrect ant'
