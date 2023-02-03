
alias pa='pip uninstall -y'
alias ph='pip show'
alias pi='pip install'
alias pl='pip list'
alias pli='pip list |less'
alias po='pip list --outdated'
alias pu='pip install --upgrade'


function pipu { 
  pip --disable-pip-version-check list --outdated --format=json | python -c "import json, sys; print('\n'.join([x['name'] for x in json.load(sys.stdin)]))"
}


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
