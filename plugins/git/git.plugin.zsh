
alias cg='cat .gitignore'
alias cog='code .gitignore'
alias ga='git add .'
alias gc='git commit -am'
alias gd='git diff'
alias gi='git ls-files|less' 
alias gl='git pull' 
alias grv='git remote -v'
alias gs='git status --long'
alias gw='git show'

function gp {
    git commit -am "$1"
    git push
}

# log
alias gg='git log -1 --date=format:"%Y/%m/%d" --format="%ad"'
alias go='git log --stat'