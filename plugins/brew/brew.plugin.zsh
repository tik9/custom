
# brew
alias ad='brew update && brew outdated'
alias al='brew ls'
alias ar='brew uninstall'
alias a='brew info'
alias au='brew upgrade && brew cleanup'
alias auf='brew upgrade --formula'
alias auc='brew upgrade --cask && brew cleanup'
alias in='brew install'

function des { brew desc --eval-all $1 | cut -d: -f2|awk '{$1=$1;print}' ;}

function pkg_remote_size {
  pkg=$(brew info --json=v1 $1 | jq -r '.[0].bottle.stable.files.arm64_monterey.url')
  curl -s -I -H 'Authorization: Bearer QQ==' $pkg | grep -i content-length|cut -d: -f2|xargs| tr -d '\r'|gnumfmt --to iec
}

function pkg_size {
  brew list --formula | xargs brew info |sed 's|/opt/homebrew/Cellar/||'| sort -k1 |egrep --color '\d*\.\d*(KB|MB|GB)' ;}


b=$0
a=(${(s|custom/plugins/brew/|)b})
echo $a[2] loaded
