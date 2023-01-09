
wifi=moto;wifi1=timo; wifi2=huawei

wifipass=$(cat $ZSH/custom/.env)

eth=en0
wintf=en1
cu="$HOME/Library/Application Support/Code/User"


# net
alias et="ipconfig getifaddr $eth"
alias wi="ipconfig getifaddr $wintf"
alias off-w="networksetup -setairportpower WI-FI off"
alias on-w="networksetup -setairportpower WI-FI on"
alias wl='/System/Library/PrivateFrameworks/Apple80211.framework/Versions/A/Resources/airport scan'

function cb { echo "$@" |pbcopy }

function cc { echo `$@` |pbcopy }

function wifi_set { networksetup -setairportnetwork $wintf $wifi $wifipass}

function wifi_get { /System/Library/PrivateFrameworks/Apple80211.framework/Resources/airport -I | awk -F: '/ SSID/{print $2}' }


b=$0
a=(${(s|custom/plugins/macos/|)b})
echo $a[2] loaded
