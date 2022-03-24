function pli { pip list |less }
function pin { pip install $1}
function plo { pip list --outdated}
function pre { pip uninstall $@}
function psh { pip show $1 }
function pu { pip install --upgrade $1 }

function pipunall {
  # non-GNU xargs does not support nor need `--no-run-if-empty`
  local xargs="xargs --no-run-if-empty"
  xargs --version 2>/dev/null | grep -q GNU || xargs="xargs"
  pip list --format freeze | cut -d= -f1 | ${=xargs} pip uninstall
}
function pipu {
    pip list --outdated --format=freeze | grep -v '^\-e' | cut -d = -f 1  | xargs -n1 pip3 install -U
}

function pipdep {
    PACKAGE=$1
    pip download $PACKAGE -d /tmp --no-binary :all:-v 2>&1 \
    | grep Collecting \
    | cut -d' ' -f2 \
    | grep -Ev "$PACKAGE(~|=|\!|>|<|$)"
}

b=$0
a=("${(s|custom/|)b}")
echo $a[2] loaded

# echo $0 loaded