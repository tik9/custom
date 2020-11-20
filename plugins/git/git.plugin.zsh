function ga { git add --all }
function gb { git branch }

function gcam { git commit -a -m $1 }
function cg { git commit -a -m $args }

function gd { git diff }
function gdc { git diff --cached }

function gg { git log }

function gi {
    ga
    gcam $1
    gpu
}

function gll { git pull }
function glg { git log --stat }
function glum { git pull upstream master }
function gm { git commit -m }

function gpu { git push }

function gs { git status }
function gsh { git show }

function gsq {
    git rebase -i HEAD~5

    # git reset --hard HEAD~5
    # git merge --squash HEAD@ { 1 }
    # git commit
}