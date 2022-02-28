alias ga='git add .'
alias gb='git branch' 

alias grs='git restore .'
alias gs='git status --long'
alias gst='git status'
alias gsh='git show'

alias grv='git remote -v'

function gw {
    git add .
    git commit -m 'commit from tik/t--pc'
    $(gp)
}

# checkout

alias gcm='git checkout master' 
alias gci='git checkout main'

# commit
alias gc="git commit -am"
alias gic="git commit -am 'commit from wsltik/t--pc'"

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
alias gp='git push'
alias gpu='git push --set-upstream origin master'
