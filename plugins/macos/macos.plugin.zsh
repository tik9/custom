
eth=en0
wintf=en1


# bluetooth
alias b=blueutil
alias bt='blueutil -p toggle'

# net
alias et="ipconfig getifaddr $eth"
alias wi="ipconfig getifaddr $wintf"
alias off-w="networksetup -setairportpower WI-FI off"
alias on-w="networksetup -setairportpower WI-FI on"
alias wl='/System/Library/PrivateFrameworks/Apple80211.framework/Versions/A/Resources/airport scan'

alias adr='echo timo körner, Bergstr. 15, 85120 Hepberg|pbcopy'
alias nr='ec 01573 9598 220|pbcopy'

function cb { echo "$@" |pbcopy }

function cc { `$@` |pbcopy }

function wifi_get { /System/Library/PrivateFrameworks/Apple80211.framework/Resources/airport -I | awk -F: '/ SSID/{print $2}' }


b=$0
a=(${(s|custom/plugins/macos/|)b})
echo $a[2] loaded
