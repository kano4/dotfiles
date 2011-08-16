# Load RVM into a shell session *as a function*
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"

PATH=$PATH:/usr/local/src/ns-allinone-2.34/ns-2.34
PATH=$PATH:/usr/local/src/ns-allinone-2.34/nam-1.14
PATH=$PATH:/usr/local/src/ns-allinone-2.34/ns-2.34/bin
PATH=$PATH:/usr/local/src/ns-allinone-2.34/xgraph-12.1

source ~/.nvm/nvm.sh
#nvm use "v0.4.8"

export JENKINS_HOME=/var/lib/jenkins
