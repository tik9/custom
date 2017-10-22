PROMPT='%{$fg[cyan]%}%m: %{$fg[yellow]%} $(get_pwd) %{$reset_color%}→ '

function get_pwd() {
  echo "${PWD/$HOME/~}"
}
