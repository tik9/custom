
alias cg='cat .gitignore'
alias ga='git add .'
alias gb='git branch' 
alias gc='git commit -am'
alias gd='git diff'
alias gi='git ls-files|less' 
alias gl='git pull' 
alias gp='git push'
alias gr='git remote -v'
alias gs='git status --long'
alias gsp='git stash pop'
alias gt='git stash'
alias gw='git show'

function gcp {
    git commit -am "$1"
    git push
}

# log
alias gg='git log -1 --date=format:"%Y/%m/%d" --format="%ad"'
alias go='git log --stat'