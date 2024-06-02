export JAVA_HOME=/opt/graalvm-jdk-21.0.3+7.1/Contents/Home
export MAVEN_HOME=/opt/apache-maven-3.9.7

export CC=$(which clang)                         # ...for CMake
export CXX=$(which clang++)                      # ...for CMake
export CCACHE_DIR=${HOME}/tmp/ccc                # ...for ccache
export PATH=/opt/local/bin:/opt/local/sbin:$PATH # ...for MacPorts
export PATH=${JAVA_HOME}/bin:$PATH               # ...for GraalVM
export PATH=${MAVEN_HOME}/bin:$PATH              # ...for Maven

export AZG_HOME=${HOME}/asd
export PATH=${AZG_HOME}:$PATH                    # ...for amake
export PATH=${AZG_HOME}/bin:$PATH                # ...for AnzoGraph
export PATH=${AZG_HOME}/devtools:$PATH           # ...for AnzoGraph
export PATH=${AZG_HOME}/tools/bin:$PATH          # ...for AnzoGraph
export PATH=.:$PATH                              # ...for cwd
export USER_CONFIG=${AZG_HOME}/settings.txt      # ...for config

export PS1="[%~ %j %?]\$ "                       # ...display prompt
export GREP_OPTIONS='--color=auto'               # ...grep highlighting

alias ll="ls -l"
alias la="ls -alh"

alias showa="cd ~; ll -rtd asd*; cd -"
function switch() { cd ~; rm -f asd; ln -s "asd.${1}" "asd"; ll -d asd; cd -; }

alias emacs="emacs -nw"

alias a="time amake -DAMCC_DEBUG=1"
alias ao="time amake -o -DAMCC_DEBUG=1"
alias s="time amake -o -DAMCC_DEBUG=1 run"
alias rl="time amake -o -DAMCC_DEBUG=1 run sp2b.loaded"
alias t="time amake -o -DAMCC_DEBUG=1 run checkin"

alias f="amake -o -DAMCC_DEBUG=1 -grep"
alias fp="amake -o -DAMCC_DEBUG=1 -pgrep"
alias ff="find . -name"

alias q="azgi -c"
alias qf="azgi -f"
alias qfe="azgi -c \"set plan_nprint to 1\" -f"

alias kx="killall -9 azg azg_go azgmgrd"
alias tfx="time tfd -DTF_KC_DIR=/kc/tfdata"

# alias gitclone='git clone ssh://bitbucket.cambridgesemantics.com:7999/sc/sparqlverse.git'
function gitclone() { git clone ${HOME}/asd.origin ${1}; cd ${1}; git remote set-url origin ssh://git@bitbucket.cambridgesemantics.com:7999/sc/sparqlverse.git; }

alias gitlog='git --no-pager log --format=format:"------------------------------------------------%n%h | %an | %cd%n%n  %s%n%n%b%n"'
alias gitsum='git --no-pager log --format="tformat:%h  %Cred%ci%Creset  %<(15)%an - %s"'
alias gitdiff='git --no-pager diff --ignore-space-at-eol -b -w' 
alias gitdiffx='git --no-pager diff'
alias gitstash='git --no-pager stash'
alias gitshow='git --no-pager show'
alias gitgraph='git --no-pager log --graph --oneline --decorate'

alias mntkc="sudo mount -o nolocks -t nfs 10.102.0.56:/kc /opt/kc"

function spike() { azgi -f ${AZG_HOME}/source/tools/qspike.rq -arg ${AZG_HOME}/internal.0 -arg ${1} -nohead -max_colwid 1000 > /tmp/spikeme.sh && chmod a+x /tmp/spikeme.sh && /tmp/spikeme.sh; }
