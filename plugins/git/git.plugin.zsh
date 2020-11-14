function ga { git add --all}
function gb { git branch}

function gc { git commit -a -m $1 }
function cg { git commit -a -m $args}

function gd { git diff }

function gg { git log }

function gi {
    ga
    gc $1
    gpu
}

function glgo { git log --oneline --graph }
function gll { git pull }
function gls { git log --stat }
function glum { git pull upstream master }
function gm { git commit -m }

function gpu { git push }

function gs { git status }
function gsh { git show }
