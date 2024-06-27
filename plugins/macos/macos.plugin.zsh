
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
alias an='echo Hallo, ich würde es für 50 € nehmen, bitte melden falls er für den genannten Preis nicht genommen wird.|pbcopy'
alias adr='echo Timo Körner, Bergstr. 15, 85120 Hepberg | pbcopy'
alias dep='ec 8030249059 | pbcopy'
alias em='ec user153015@gmail.com | pbcopy'
alias ib='ec de39 5001 0517 5447 5823 49 | pbcopy'
alias i2='ec de63 7215 0000 0050 5242 71 | pbcopy'
alias nr='ec 015739598220 | pbcopy'

function cp_mount {
    usb=CCCOMA_X86FRE_DE-DE_DV9 
    cp $1 /Users/thome/.mounty/$usb
}

function cb { echo "$@" |pbcopy }

function cc { `$@` |pbcopy }

function wifi_get { /System/Library/PrivateFrameworks/Apple80211.framework/Resources/airport -I | awk -F: '/ SSID/{print $2}' }

function os_ver { sw_vers -productVersion }

function psp {
    ps2pdf -dPDFSETTINGS=/ebook $1 $2 &&
    rm $1
}    

function unzip_ {
    downl=$HOME/downloads
    icloud="iCloud Photos"
    cd $downl
    unzip $icloud.zip
    open $icloud/IMG*
}

b=$0
a=(${(s|custom/plugins/macos/|)b})
echo $a[2] loaded
