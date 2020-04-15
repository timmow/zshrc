PROMPT='%{$fg_bold[red]%}☃ $(exit) $(showhost) $(virtualenv_prompt_info)%{$fg_bold[green]%}%p %{$fg[cyan]%}%c %{$fg_bold[blue]%}$(git_prompt_info)%{$fg_bold[blue]%} % %{$reset_color%}'

ZSH_THEME_GIT_PROMPT_PREFIX="git:(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}✗%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"

function showhost {
	host=$(<~/.box_name)
	print "%{$fg_bold[magenta]%}$host"
	if [[ $host =~ 'bfb1$' ]] ; then
		print "%{$fg_bold[magenta]%}$host"
	fi
}

function exit {
  if [ "$?" != 0 ] ; then
    echo -e " X "
  fi
}
