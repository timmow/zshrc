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
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want disable red dots displayed while waiting for completion
# DISABLE_COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git brew phing svn screen fasd)

export PERSONALDEV='/sites/personaldev/tmower/'
export S='svn://digital-source.bfb1.services.ipcdigital.co.uk/symfony'
export SVN='svn://digital-source.bfb1.services.ipcdigital.co.uk/'
export P=$PERSONALDEV/puppet
export G='/goodtoknow-redesign'
export W='/womanandhome-ida'
export N='/now-redesign'
export T='/trunk'
export B='/branches'
export R='/branches/releases'
export PATH=/usr/local/share/python:$PATH
source $ZSH/oh-my-zsh.sh
source ~/.zsh_aliases

setopt interactive_comments

# Customize to your needs...
cdpath=(. /sites/personaldev/tmower) 
export PATH=~/bin:$PATH
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
function extractrpm
{
	if [ ! -z $1 ]; then
		rpm2cpio $1 | cpio -idmv
	fi
}
