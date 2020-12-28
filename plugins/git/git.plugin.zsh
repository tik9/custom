function ga { git add --all }
function gb { git branch }

function gc { git commit -a -m $1 }
function cg { git commit -a -m $args }

function gd { git diff }
function gdc { git diff --cached }

function gg { git log }

function gic { git commit -am 'commit'}

function giwf {
    ga
    git commit -m 'commit from function giwf'
    gpu
}

function gll { git pull }
function glg { git log --stat }
function glum { git pull upstream master }

function gpu { git push }
function gpus { git push --set-upstream origin master }
function grs { git restore . }
function gs { git status }
function gsh { git show }

function gstart {
    git init
    git add README.md
    git commit -m "first commit"
    git push -u origin master

}

function grv { git remote -v }

function gsq {
    git rebase -i HEAD~3

    # git reset --hard HEAD~2
    # git merge --squash HEAD@{1}
    # git commit
}

function glt { git ls-tree -r master --name-only }