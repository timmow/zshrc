# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="timmower"
export EDITOR=vim

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want disable red dots displayed while waiting for completion
# DISABLE_COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)

plugins=(gitfast brew phing svn fasd bundler vagrant tmux virtualenv virtualenvwrapper fabric)
export CLICOLOR=1
source $ZSH/oh-my-zsh.sh
source ~/.zsh_aliases
fpath=($fpath $(brew --prefix)/share/zsh-completions)


setopt interactive_comments
setopt dotglob

# Customize to your needs...
cdpath=(. /sites/personaldev/tmower) 

function extractrpm
{
	if [ ! -z $1 ]; then
		rpm2cpio $1 | cpio -idmv
	fi
}

function publish_dashboard
{
	if [ ! -z $1 ]; then
		sh -c "cd ~/src/fabric-scripts && ~/.virtualenvs/fabric-scripts/bin/fab production performanceplatform.publish_dashboard:$1"
	fi
}

[[ -s $HOME/.tmuxinator/scripts/tmuxinator ]] && source $HOME/.tmuxinator/scripts/tmuxinator
fpath=($HOME/.zsh/func $fpath)
typeset -U fpath
export PAGER=less
mcd() { mkdir -p "$@" && cd "$_"; }
gcd() { mkdir -p "$@" && cd "$_" && git init; }
# Ignore pyc and backup files when tab completing
zstyle ':completion:*:(all-|)files' ignored-patterns "(*.pyc|*~)"
export PYTHONSTARTUP=$HOME/.pythonrc.py

GPG_AGENT=$(which gpg-agent)
GPG_TTY=`tty`
export GPG_TTY

if [ -f ${GPG_AGENT} ]; then
    . ~/.bash_gpg
fi

if [[ -a ~/.secrets ]]; then
    source ~/.secrets
fi
export TF_VAR_AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID
export TF_VAR_AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY
export TF_VAR_GCE_INTEROPERABILITY_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID
export TF_VAR_GCE_INTEROPERABILITY_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY
export TF_VAR_GCE_INTEROPERABILITY_HOST=s3-eu-west-1.amazonaws.com
