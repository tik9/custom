alias ga='git add .'
alias gb='git branch' 

alias grs='git restore .'
alias gs='git status --long'
alias gsh='git show'

alias gr='git remote -v'

function gw {
    git add .
    git commit -m "$1"
    $(gp)
}

function gh {
    git add .
    git commit -m "$1"
    $(gh)
}

# checkout - merge
alias gcm='git checkout master' 
alias gci='git checkout main'
alias gmm='git merge master' 

# commit
alias gc="git add .;git commit -am"
alias gic="git add .;git commit -am 'commit from wsltik/t--pc'"

# diff
alias gd='git diff'
alias gdc='git diff --cached'

# log
alias g1='git log -1'
alias gg='git log -1 --date=format:"%Y/%m/%d" --format="%ad"'
alias go='git log --stat'

# pull
alias gl='git pull' 

# push
alias gh='git push heroku'
alias gp='git push'
alias gpu='git push --set-upstream origin master'
