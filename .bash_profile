# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs

PATH=$PATH:$HOME/bin

export PATH
export PATH="$HOME/.rbenv/bin:$PATH:/usr/local/go/bin"
eval "$(rbenv init -)"
#source ~/perl5/perlbrew/etc/bashrc
