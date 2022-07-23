
alias cg='cat .gitignore'
alias ga='git add .'
alias gaa='git add'
alias gb='git branch' 
alias gi='git ls-files|less' 
alias gr='git remote -v'
alias grm='git rm --cached'
alias grs='git restore'
alias gs='git status --long'
alias gsp='git stash pop'
alias gt='git stash'

function gcenv { file=.env && git checkout $(git rev-list -n 1 HEAD -- $file)^ -- $file }

function gcp { git commit -am "$1" && $(gp) }


function webserve_he { git commit -am "$1" && git push heroku && sh test/test.sh serverhe }

# checkout - merge
alias gci='git checkout main'
alias gcm='git checkout master' 
alias gmm='git merge master' 


# commit
alias gic='git add . && git commit -am'
alias gc='git commit -am'

function deploy_gh {
    # git rm --cached .env
    grm .env
    gc '.env removed'
    gp
}

function gcp {
    git commit -am "$1"
    git push
}

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
