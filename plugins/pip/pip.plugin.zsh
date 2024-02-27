
alias pa='pip uninstall -y'
alias ph='pip show'
alias pi='pip install'
alias pl='pip list'
alias pli='pip list |less'
alias po='pip list --outdated'
alias pu='pip install --upgrade'


function plistout { 
  pip list --outdated --format=json | python3 -c "import json, sys; print('\n'.join([x['name'] for x in json.load(sys.stdin)]))"
}


function pipu {
pip3 list --outdated --format=json | jq -r '.[] | "\(.name)==\(.latest_version)"' | xargs -n1 pip3 install --upgrade
}

b=$0
a=("${(s|custom/plugins/pip/|)b}")
echo $a[2] loaded

# echo $0 loaded
