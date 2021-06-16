function ga { git add . }
function gb { git branch }

function gc { git commit -a -m $1 }
function gcp { git commit -a -m $args }

function gcl { git config --show-origin --list}
function gds { git diff --summary}

function gic { git commit -am 'commit'}

function gll { git pull }

function glum { git pull upstream master }

function gpu { git push }
function gpus { git push --set-upstream origin master }
function grs { git restore . }
function gs { git status }
function gsh { git show }
function gve { git --version }

function gstart {
    git init
    git add README.md
    git commit -m "first commit"
    git push -u origin master
}

function grv { git remote -v }

function gw {
    git add .
    git commit -m 'commit from tik'
    gpu
}

# log
function gg { git log -1 --date=format:"%Y/%m/%d" --format="%ad" }
function go { git log --stat }

# diff
function gd { git diff }
function gdc { git diff --cached }
function gds { git diff --summary }
