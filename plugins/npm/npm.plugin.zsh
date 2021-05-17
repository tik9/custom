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

alias npmg="npm i -g "

# npm package names are lowercase
# Thus, we've used camelCase for the following aliases:

# Install and save to dependencies in your package.json
# npms is used by https://www.npmjs.com/package/npms
alias npmS="npm i -S "

# Install and save to dev-dependencies in your package.json
# npmd is used by https://github.com/dominictarr/npmd
alias npmD="npm i -D "

# Force npm to fetch remote resources even if a local copy exists on disk.
alias npmF='npm i -f'

# Execute command from node_modules folder based on current directory
# i.e npmE gulp
alias npmE='PATH="$(npm bin)":"$PATH"'

alias npmO="npm outdated"

alias npmU="npm update"

alias npmV="npm -v"

alias npmL="npm list"

# List top-level installed packages
alias npmL0="npm ls --depth=0"

alias npmst="npm start"

alias npmt="npm test"

# Run npm scripts
alias npmR="npm run"

alias npmI="npm init"

alias npmi="npm info"

alias npmSe="npm search"
