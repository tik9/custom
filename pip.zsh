alias pip=pip3

function pli { pip list |less }
function pin { pip install $1}
function plo { pip list --outdated}
function pre { pip uninstall $@}
function psh { pip show $1 }
function pu { pip install --upgrade $1 }
# function python { python3}

function pipu {
    pip list --outdated --format=freeze | grep -v '^\-e' | cut -d = -f 1  | xargs -n1 pip3 install -U
}

b=$0
a=("${(s|custom/|)b}")
echo $a[2] loaded

# echo $0 loaded