if [[ -n $ZSH_ENABLE_PROFILE ]]; then
  # set the trace prompt to include seconds, nanoseconds, script name and line
  # number
  if zmodload zsh/datetime; then 
    setopt promptsubst
    PS4='+$EPOCHREALTIME %N:%i> '
  elif [[ -n `which gdate` ]]; then
    # GNU date is required for nanosecond precision (%N). OS X doesn't
    # ship with that by default, so use gdate from coreutils in homebrew.
    PS4='+$(gdate "+%s.%N") %N:%i> '
  else
    PS4='+$(date "+%s.%N") %N:%i> '
  fi
  # save file stderr to file descriptor 3 and redirect stderr (including trace
  # output) to a file with the script's PID as an extension
  exec 3>&2 2>/tmp/startlog.$$
  # set options to turn on tracing and expansion of commands contained in the
  # prompt
  setopt xtrace prompt_subst
fi
# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh
setopt no_global_rcs

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

plugins=(git brew fasd bundler vagrant tmux virtualenv virtualevnwrapper fabric)
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

GPG_TTY=`tty`
export GPG_TTY

if [[ -a ~/.secrets ]]; then
    source ~/.secrets
fi
export TF_VAR_AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID
export TF_VAR_AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY
export TF_VAR_GCE_INTEROPERABILITY_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID
export TF_VAR_GCE_INTEROPERABILITY_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY
export TF_VAR_GCE_INTEROPERABILITY_HOST=s3-eu-west-1.amazonaws.com

compdef _pass paas-pass
zstyle ':completion::complete:paas-pass::' prefix "$HOME/.paas-pass"
paas-pass() {
  PASSWORD_STORE_DIR=$HOME/.paas-pass pass $@
}

compdef _pass paas-pass-high
zstyle ':completion::complete:paas-pass-high::' prefix "$HOME/.paas-pass-high"
paas-pass-high() {
  PASSWORD_STORE_DIR=$HOME/.paas-pass-high pass $@
}
if [[ -n $ZSH_ENABLE_PROFILE ]]; then
  # turn off tracing
  unsetopt xtrace
  # restore stderr to the value saved in FD 3
  exec 2>&3 3>&-
fi
