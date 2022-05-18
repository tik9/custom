
alias ca='cat package.json'
alias nf="npm info"
alias ni='npm i'
alias nig='npm i -g'
alias nl="npm list"
alias nlg="sudo npm list -g"
alias no="npm outdated"
alias npm="npm --no-fund"
alias nr="npm run"
alias nu="npm update"
alias nun="npm uninstall"
alias nv="npm -v"


# npm package names are lowercase
# Thus, we've used camelCase for the following aliases:
# List top-level installed packages
alias np0="npm ls --depth=0"

function nn {
    # npm info $1 | sed -n 3p
    npm info $(1) | sed -n -e '2{p;q}'
}
