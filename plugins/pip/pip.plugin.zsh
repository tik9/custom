
alias par='pip uninstall -y'
alias pi='pip install'
alias pli='pip list |less'
alias po='pip list --outdated'
alias psh='pip show'
alias pu='pip install --upgrade'


function pipu { pip list --outdated --format=freeze | grep -v '^\-e' | cut -d = -f 1  | xargs -n1 pip3 install -U }


# Update all installed packages
function pipupall {
  # non-GNU xargs does not support nor need `--no-run-if-empty`
  local xargs="xargs --no-run-if-empty"
  xargs --version 2>/dev/null | grep -q GNU || xargs="xargs"
  pip list --outdated --format freeze | cut -d= -f1 | ${=xargs} pip install --upgrade
}

b=$0
a=("${(s|custom/plugins/pip/|)b}")
echo $a[2] loaded

# echo $0 loaded
