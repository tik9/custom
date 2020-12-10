alias pip=pip3
# function pip3 { pip3.exe $@}
function pli { pip list |more }
function pi { pip install $1}
function plo { pip list --outdated}
function pre { pip uninstall $1}
function python { python3}

function pipu {
    pip list --outdated --format=freeze | grep -v '^\-e' | cut -d = -f 1  | xargs -n1 pip install -U
}