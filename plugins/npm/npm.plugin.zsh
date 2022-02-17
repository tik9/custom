alias n=npm
alias nog='npm i -g'
alias noi='npm i'
alias nr='npm run'

(( $+commands[npm] )) && {
  rm -f "${ZSH_CACHE_DIR:-$ZSH/cache}/npm_completion"

  _npm_completion() {
    local si=$IFS
    compadd -- $(COMP_CWORD=$((CURRENT-1)) \
                 COMP_LINE=$BUFFER \
                 COMP_POINT=0 \
                 npm completion -- "${words[@]}" \
                 2>/dev/null)
    IFS=$si
  }
  compdef _npm_completion npm
}


# npm package names are lowercase
# Thus, we've used camelCase for the following aliases:

alias npmO="npm outdated"

alias npmU="npm update"

alias npmV="npm -v"

alias npmL="npm list"

# List top-level installed packages
alias npmL0="npm ls --depth=0"

# Run npm scripts
alias npmR="npm run"

alias npmi="npm info"
