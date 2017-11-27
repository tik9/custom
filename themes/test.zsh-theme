PROMPT='%{$fg[cyan]%}%m %{$fg[yellow]%} %(4~|.../%3~|%~) - %{$fg[cyan]%}$(get_ssi) - $(git_super_status) %{$reset_color%}→ '
#PROMPT="%n@%m %(4~|.../%3~|%~) - test_int %# "


get_ssi(){
	sed -e 's/^"//' -e 's/"$//' <<< `iwgetid | awk '{print }'|cut -f2 -d:`
}

test_int(){
wget -q --spider http://google.com
	if [ $? -eq 0 ];then
		echo internet
	fi
}
