
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

PS1="\u@\h:\w> "

cd $HOME/git/sg-gcard

export PATH=/usr/bin/X11:$PATHexport PATH=/usr/sbin:$PATH
export PATH=/sbin:$PATH
export PATH=/var/qmail/bin:$PATH
export PATH=/usr/local/apache/bin:$PATH
export PATH=$HOME/bin:$PATH
export PATH=$HOME/script/tool:$PATH
export PATH=$HOME/script/daemon:$PATH
export PATH=.:$PATH

export CVSROOT=cvsadmin@moba-cvs:/home/cvsadmin/cvsrep
export CVS_RSH=ssh

source $HOME/.aliases
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
export PERL_CPANM_OPT="--local-lib=~/extlib"
export PERL5LIB="$HOME/extlib/lib/perl5:$HOME/extlib/lib/perl5/i386-linux-thread-multi:$PERL5LIB"

alias gcard='cd /home/game/git/sg-gcard/'
alias migration='cd /home/game/git/sg-gcard/script2/gcard/migration'

alias restart='sudo apachectl restart'
function gcc_db(){
	PARAM=$1
	if [ -z "$PARAM" ]; then
		PARAM="BAK"
	fi
	echo "GCARD_$PARAM";
	`mbga-mysqlconn GCARD_$PARAM`
}

function gcc2_db(){
	PARAM=$1
	if [ -z "$PARAM" ]; then
		PARAM="BAK"
	fi
	echo "GCARD2_$PARAM";
	`mbga-mysqlconn GCARD2_$PARAM`
}

function gcc_s_db(){
	NUM=$1
	PARAM=$2
	if [ -z "$PARAM" ]; then
		PARAM="BAK"
	fi
	echo "GCARDSHARD${NUM}_$PARAM";
	`mbga-mysqlconn GCARDSHARD${NUM}_$PARAM`
}

source ~/.git-completion.bash
PS1='[\u@\h \[\e[0;32m\]\w\[\e[00m\]$(__git_ps1 " \[\e[0;35m\](%s)\[\e[00m\]")]\$ '

#source $HOME/users/deguchi/.bashrc
export PATH=$HOME/.nodebrew/current/bin:$PATH

# スクロールロック CTRL+s 無効化
stty stop undef

eval "$(hub alias -s)"

export BROWSER=iterm

# historyコマンドに実行日時を表示
export HISTTIMEFORMAT='%Y-%m-%d %T%z '

# tmuxのウィンドウ間でhistoryを共有
function share_history {
	history -a
	history -c
	history -r
}
PROMPT_COMMAND='share_history'
shopt -u histappend
