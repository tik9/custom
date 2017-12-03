if [ $os != "CYGWIN_NT-6.1" ]; then
	PROMPT='%{$fg[cyan]%}%m %{$fg[yellow]%} %(4~|.../%3~|%~) - %{$fg[cyan]%}$(get_ssi) - $(git_super_status) %{$reset_color%}→ '
else
	PROMPT='%{$fg[cyan]%}%m %{$fg[yellow]%} %(4~|.../%3~|%~) - %{$fg[cyan]%} %{$reset_color%}→ '
fi

get_ssi(){
	sed -e 's/^"//' -e 's/"$//' <<< `iwgetid | awk '{print }'|cut -f2 -d:`
}

