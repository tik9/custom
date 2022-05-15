alias cg='cat .gitignore'
alias ga='git add .'
alias gaa='git add'
alias gb='git branch' 
alias gls='git ls-files|less' 
alias gm='git merge' 
alias grs='git restore'
alias gs='git status --long'
alias gsh='git show'

alias gr='git remote -v'

function gw {
    git commit -am "$1"
    $(gp)
}

function gh {
    git commit -am "$1"
    $(gh)
}

function webserve { if [ $PWD = $HOME/tik ] ; then sh test/test.sh servergh ;fi }

# checkout - merge
# alias gcenv="file=.env;git checkout $(git rev-list -n 1 HEAD -- $file)^ -- $file"
alias gch='git checkout .'
alias gci='git checkout main'
alias gcm='git checkout master' 
alias gmm='git merge master' 


# commit
alias gc='git add .;git commit -am'
alias gic='git commit -am'

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
alias gh='git push heroku && sh test/test.sh serverhe'
alias gp='git push && webserve'
alias gpu='git push --set-upstream origin master'
