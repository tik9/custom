
alias n='pnpm'
alias nl="pnpm list"
alias nlg="sudo pnpm list -g"
alias nig='pnpm i -g'
alias ni='pnpm i'
alias no="pnpm outdated"
alias nv="pnpm -v"
alias nu="pnpm update"


# pnpm package names are lowercase
# Thus, we've used camelCase for the following aliases:

# List top-level installed packages
alias npmL0="pnpm ls --depth=0"

# Run pnpm scripts
alias npmR="pnpm run"

alias npmi="pnpm info"
