#PROMPT='%{$fg[cyan]%}%m: %{$fg[yellow]%} $(get_pwd) %{$reset_color%}→ '
PROMPT='%B%m%~%b$(git_super_status) %# '

function get_pwd() {
  echo "${PWD/$HOME/~}"
}
