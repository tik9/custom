
alias ca='less package.json'
alias ce='cat .env'
alias ni='npm i'
alias nig='npm i -g'
alias nl="npm list"
alias nlg="sudo npm list -g"
alias no="npm outdated"
alias npm="npm --no-fund"
alias np="npm"
alias nr="npm run"
alias nu="npm update"
alias nun="npm uninstall"
alias nv="npm -v"
alias nw="npm run watch"


function nn { npm info $(1) | sed -n -e '2{p;q}' :}
