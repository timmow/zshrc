PROMPT='%{$fg_bold[red]%}☃  $(showhost)%{$fg_bold[green]%}%p %{$fg[cyan]%}%c %{$fg_bold[blue]%}$(git_prompt_info)%{$fg_bold[blue]%} % %{$reset_color%}'

ZSH_THEME_GIT_PROMPT_PREFIX="git:(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}✗%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"

function showhost {
	host=`hostname | cut -d- -f1`
	if [[ $host =~ 'bfb1$' ]] ; then
		print "%{$fg_bold[magenta]%}$REALNAME"
	elif [[ $host =~ 'bfb$' ]] ; then
		print "%{$fg_bold[yellow]%}$REALNAME"
	elif [[ $host =~ 'frr$' ]] ; then
		print "%{$fg_bold[red]%}$REALNAME"
	fi
}
