
# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

#################################################
# Display
#################################################

# set up common aliases
alias la="ls -al"
alias lsd="ls -alhd"

# set up prompt
export PS1="[\h:\w \j]\$ "
# export PS1='# '

# set up emacs default size
# alias e="emacs -geometry 90x74+0+0"
alias emacs="emacs -nw"

export GREP_OPTIONS='--color=auto'

#################################################
# Development
#################################################

export LD_LIBRARY_PATH=/opt/odbc64/lib
export ODBCINI=/usr/local/etc/odbc.ini
export ODBCSYSINI=/usr/local/etc

# padb
# export PGPORT=5439
# export PGDATA="/home/paraccel/padb/data/pg"
# export XEN_MEMORY_SEGMENT_KEY=20848

# want cores up to 70 MBs
ulimit -c 70000 

# ccache
export CCACHE_DIR=/home/brian/tmp/ccc

# development
#alias s="jmake all;amake -f run"
#alias q="psql dev -c"
#alias qf="psql dev -f"
#alias qfe="psql dev -c \"set force_explain to on\" -f"
#alias xentest="~/padb/test/tools/psql_query.py -f"

alias s="amake all -DCOMPILE_SYS -DCOMPILE_ENV -f run"
alias rc="amake all -DCOMPILE_SYS -DCOMPILE_ENV -DCOMPILE_TESTS -f run basic.queries"
alias rc1="amake all -DCOMPILE_SYS -DCOMPILE_ENV -DCOMPILE_TESTS -DNON_SIMULATED -f run basic.queries"
alias rc2="amake all -DCOMPILE_SYS -DCOMPILE_ENV -DCOMPILE_TESTS -DMEMCHECK -f run basic.queries"
alias rl="amake all -DCOMPILE_SYS -DCOMPILE_ENV -f run sp2b.loaded"
alias f="amake -grep"
alias fp="amake -pgrep"
alias q="isbx -c"
alias qf="isbx -f"
alias kx="killall -9 sbx sbx_go mongod"
alias spike="sh /home/paraccel/asd/src/tools/spike.sh"
alias sbxtest="~/asd/src/tools/isbx_query.py -f"

alias qlog="isbx -f ~/asd/src/tools/qlog.rq"
function qsum() { isbx -f ~/asd/src/tools/qsum.rq -set query=${1}; }
function qcom() { isbx -f ~/asd/src/tools/qcompile.rq -set query=${1}; }


# canonical postgres
# alias qx="psql bchu -h 192.168.1.53 -p 5432 -U postgres -c"
# alias gengold="psql_query.py -d bchu -s 192.168.1.53 -p 5432 -u postgres -g -n -f"




# directory manipulation
alias showp="cd ~; ll -d padb*; cd -"
alias showa="cd ~; ll -rtd asd*; cd -"
alias ff="find . -name"

function switch()
{
  cd ~
  rm -f padb
  rm -f asd
  ln -s "asd.${1}" "padb"
  ln -s "asd.${1}" "asd"
  ll -d padb
  cd -;
}



# svn
export SVN_EDITOR='emacs -nw'
function svndiff () { svn diff --diff-cmd /usr/bin/diff -x "--minimal -w -U 3" $@ | colordiff | less -R -p" [0-9] @@"; }
function ediff () { svn diff --diff-cmd /usr/bin/diff -x "--minimal -w -U 3" $@; }
alias checkout="svn co https://sparqlrepo/svn/asd/trunk"

# git
alias gitlog='git --no-pager log --format=format:"------------------------------------------------%n%h | %an | %cd%n%n  %s%n%n%b%n"'
alias gitsum='git --no-pager log --format="tformat:%h  %Cred%ci%Creset  %<(15)%an - %s"'
alias gitdiff='git --no-pager diff --ignore-space-at-eol -b -w' 



# testing
export PYTHONPATH=$HOME/xen_qa/gauntlet
alias mntlogs="sudo mount -t nfs qa.paraccel.com:/gtlogs /gauntlet_logs"
alias mntdata="sudo mount -t nfs qa.paraccel.com:/qa_data /test_data"
alias mntrel="sudo mount -t nfs qa.paraccel.com:/pareleases /paraccel_releases"

# sudo umount /test_data
# sudo umount /gauntlet_logs


# Purify
# source ~/dl/rational/purifyplus_setup.sh



PATH=/usr/lib/ccache:$PATH:/sbin:/usr/sbin:$HOME/bin:$HOME/asd/drel/bin:$HOME/asd:$HOME/asd/src/tools:~/asd/drel/lib/clang/bin:.


