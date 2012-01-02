export LANG=ja_JP.UTF-8
export EDITOR=vim

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
setopt cshnullglob

PATH=$PATH:/usr/local/src/ns-allinone-2.34/ns-2.34
PATH=$PATH:/usr/local/src/ns-allinone-2.34/nam-1.14
PATH=$PATH:/usr/local/src/ns-allinone-2.34/otcl-1.13
PATH=$PATH:/usr/local/src/ns-allinone-3.34/ns-2.34/bin
PATH=$PATH:/usr/local/src/sbt

PATH=$PATH:/usr/local/src/android-sdk-linux/tools

alias sudo="sudo PATH=$PATH"

if [ -f $HOME/.rvm/scripts/rvm ]; then
  [[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" # Load RVM function
fi

if [ -f $HOME/.rsm/rsm.sh ]; then
  source "$HOME/.rsm/rsm.sh"
fi

export PATH="$HOME/.my-scripts:$PATH"

# Alias
alias ls="ls --color=auto"
alias l="ls"
alias ll="ls -l"
alias la="ls -a"
alias lf="ls -F"

alias -g TELLME="&& say succeeded || say failed"
alias -g G="| grep"
alias -g H="| head"
alias -g L="| less -R"
alias -g W="| wc"
alias -g T="| tail"
alias -g ...="../.."
alias -g ....="../../.."
alias -g .....="../../../.."
alias -g ......="../../../../.."
alias -g .......="../../../../../.."

alias c='clear'
alias f='fg'
alias v='vim'
alias e='emacsclient'
alias g='git'
alias s='screen'

alias less="/usr/share/vim/vim73/macros/less.sh"

alias nkf-chk='nkf -g'
alias nkf-utf8='nkf -w --overwrite'
alias nkf-sjis='nkf -s --overwrite'
alias nkf-eucjp='nkf -e --overwrite'

alias be="bundle exec"
alias rspec="rspec -c"
alias cuke="cucumber"

alias rails='nocorrect rails'
alias scala='nocorrect scala'
alias nvm='nocorrect nvm'
alias sass='nocorrect sass'
alias ant='nocorrect ant'
