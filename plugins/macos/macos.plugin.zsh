
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

# pbcopy
alias an='echo Hallo, ich würde ihn für 30 € nehmen, bitte melden falls er für den genannten Preis nicht genommen wird.|pbcopy'
alias ar='echo Timo Körner, Bergstr. 15, 85120 Hepberg | pbcopy'
alias em='ec user153015@gmail.com | pbcopy'
alias ib='ec de39 5001 0517 5447 5823 49 | pbcopy'
alias ib2='ec de63721 500 0000 5052 4271 | pbcopy'
alias nr='ec 015739598220 | pbcopy'


function cb { echo "$@" |pbcopy }

function cc { `$@` |pbcopy }

function wifi_get { /System/Library/PrivateFrameworks/Apple80211.framework/Resources/airport -I | awk -F: '/ SSID/{print $2}' }

function os_ver { sw_vers -productVersion }

b=$0
a=(${(s|custom/plugins/macos/|)b})
echo $a[2] loaded
