if [[ $HOST == 't--pc' ]];then
function pip { pip3 $@}
else
    function pip { pip3.exe $@}
fi

function pli { pip list |more }
function pi { pip install $1}
function plo { pip list --outdated}
function pre { pip uninstall $@}
function psh { pip show $1 }
function pu { pip install --upgrade $1 }
# function python { python3}

function pipu {
    pip list --outdated --format=freeze | grep -v '^\-e' | cut -d = -f 1  | xargs -n1 pip3 install -U
}

echo $0 loaded