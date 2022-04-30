alias ad='brew update && brew outdated'
alias ai='brew ls'
alias ar='brew uninstall'
alias au='brew upgrade && brew cleanup'
alias auf='brew upgrade --formula'
alias auc='brew upgrade --cask && brew cleanup'
alias in='brew install'

function pkg_remote_size {
  pkg=$(brew info --json=v1 $1 | jq -r '.[0].bottle.stable.files.arm64_monterey.url')
  curl -s -I -H 'Authorization: Bearer QQ==' $pkg | grep -i content-length|cut -d: -f2|xargs| tr -d '\r'|gnumfmt --to iec
}

function pkg_size {
  brew list --formula | xargs brew info |sed 's|/opt/homebrew/Cellar/||'| sort -k1 |egrep --color '\d*\.\d*(KB|MB|GB)'
}

function brews() {
  local formulae="$(brew leaves | xargs brew deps --installed --for-each)"
  local casks="$(brew list --cask)"

  local blue="$(tput setaf 4)"
  local bold="$(tput bold)"
  local off="$(tput sgr0)"

  echo "${blue}==>${off} ${bold}Formulae${off}"
  echo "${formulae}" | sed "s/^\(.*\):\(.*\)$/\1${blue}\2${off}/"
  echo "\n${blue}==>${off} ${bold}Casks${off}\n${casks}"
}

b=$0
a=(${(s|custom/plugins/brew/|)b})
echo $a[2] loaded
