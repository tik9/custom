function gb { git branch }

function gc { git commit -a -m $1 }
function gcp { git commit -a -m $args }
function ga { git add . }

function gic { git commit -am 'commit'}

function gll { git pull }

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

function gw {
    git add .
    git commit -m 'commit from tik'
    gpu
}

# log
function glg { git log --stat }
function glog { git log }
function gg { git log -1 --date=format:"%Y/%m/%d" --format="%ad" }

# diff

function gd { git diff }
function gdc { git diff --cached }
