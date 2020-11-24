function ga { git add --all }
function gb { git branch }

function gc { git commit -a -m $1 }
function cg { git commit -a -m $args }

function gd { git diff }
function gdc { git diff --cached }

function gg { git log }

function gstart {

}

function gi {
    ga
    gc $1
    gpu
}

function gll { git pull }
function glg { git log --stat }
function glum { git pull upstream master }
function gm { git commit -m }

function gpu { git push }
function gpus { git push --set-upstream origin master }
function grs { git restore . }
function gs { git status }
function gsh { git show }
function grv { git remote -v }

function gsq {
    # git rebase -i HEAD~5

    git reset --hard HEAD~2
    git merge --squash HEAD@{1}
    git commit
}

function gini {

    git init
    git add .
    git commit -m "first commit"
    git remote add origin https://github.com/tik9/psrandom.git
    git push -u origin master
}