
wifi=moto;wifi1=timo; wifi2=huawei

wifipass=$(cat $ZSH/custom/env)

eth=en0
wintf=en1
cu="$HOME/Library/Application Support/Code/User"

alias pd="python $y/dict.py"
alias pic=$HOME/pictures
alias shr='printf "¯\_(ツ)_/¯" | pbcopy'


# net
alias et="ipconfig getifaddr $eth"
alias wi="ipconfig getifaddr $wintf"
alias off-w="networksetup -setairportpower WI-FI off"
alias on-w="networksetup -setairportpower WI-FI on"
alias wl='/System/Library/PrivateFrameworks/Apple80211.framework/Versions/A/Resources/airport scan'

function cb { echo "$@" |pbcopy }

function cc { echo `$@` |pbcopy }


function di {
  y=$HOME/cpython
  source $y/venv/bin/activate
  python3 $y/dict.py $1
}

function ppo { sudo lsof -nP -i4TCP:$1 | grep LISTEN;sudo lsof -i -P | grep LISTEN | grep :$1 }

function qp { qpdf --object-streams=generate --empty --pages *.pdf -- $1.pdf }

function wifi_set { networksetup -setairportnetwork $wintf $wifi $wifipass}

function wifi_get { /System/Library/PrivateFrameworks/Apple80211.framework/Resources/airport -I | awk -F: '/ SSID/{print $2}' }


# Remove .DS_Store files recursively in a directory, default .
function rmds() { find "${@:-.}" -type f -name .DS_Store -delete ;}

# Erases purgeable disk space with 0s on the selected disk
function freespace(){
  if [[ -z "$1" ]]; then
    echo "Usage: $0 <disk>"
    echo "Example: $0 /dev/disk1s1"
    echo
    echo "Possible disks:"
    df -h | awk 'NR == 1 || /^\/dev\/disk/'
    return 1
  fi

  echo "Cleaning purgeable files from disk: $1 ...."
  diskutil secureErase freespace 0 $1
}


b=$0
a=(${(s|custom/plugins/macos/|)b})
echo $a[2] loaded
