
alias g='git log --stat'
alias ga='git add .'
alias gc='git commit -am'
alias gd='git diff'
alias gs='git status --long'
alias gw='git show'

function gp {
    git commit -am "$1"
    git push
}