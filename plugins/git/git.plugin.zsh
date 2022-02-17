function ga { git add . }
function gb { git branch }
function gcm { git checkout master }

function grs { git restore . }
function gs { git status }
function gsl { git status --long }
function gsh { git show }

function grv { git remote -v }

function gw {
    git add .
    git commit -m 'commit from tik/t--pc'
    gpu
}

# commit
function gcl { git commit -am $1 }
function gcw { git commit -am $args }
function gic { git commit -am 'commit from wsltik/t--pc'}

# diff
function gd { git diff }
function gdc { git diff --cached }
function gds { git diff --summary }
function gdl { git diff $1 }
function gdw { git diff $args }

# log
function gg { git log -1 --date=format:"%Y/%m/%d" --format="%ad" }
function go { git log --stat }

# pull
function gl { git pull }

# push
function gpu { git push }
function gpus { git push --set-upstream origin master }
