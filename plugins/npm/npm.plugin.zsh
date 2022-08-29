
alias ca='less package.json'
alias ce='cat .env'
alias nc='npx cypress open'
alias ni='npm i'
alias nin='npm info'
alias nig='npm i -g'
alias nl="npm list"
alias nlg="sudo npm list -g"
alias no="npm outdated"
alias npm="npm --no-fund"
alias np="npm"
alias nu="npm update"
alias nun="npm uninstall"
alias nv="npm -v"
alias nw="npm run watch"
alias p="npx run-func"


function nn { npm info $(1) | sed -n -e '2{p;q}' :}
