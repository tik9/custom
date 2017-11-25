PROMPT='%{$fg[cyan]%}%m %{$fg[yellow]%} $(get_pwd) - %{$fg[cyan]%}$(get_ssi) - $(git_super_status) %{$reset_color%}→ '
#PROMPT='%B%m%~%b$(git_super_status) %# '

function get_pwd() {
  echo "${PWD/$HOME/~}"
}
get_ssi(){
	sed -e 's/^"//' -e 's/"$//' <<< `iwgetid | awk '{print }'|cut -f2 -d:`
}
