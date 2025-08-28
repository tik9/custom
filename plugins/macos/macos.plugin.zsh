
eth=en0
wintf=en1


# bluetooth
alias bt='blueutil -p toggle'

# net
alias et="ipconfig getifaddr $eth"
alias ne=networkQuality
alias off-w="networksetup -setairportpower WI-FI off"
alias on-w="networksetup -setairportpower WI-FI on"
alias wi="ipconfig getifaddr $wintf"
alias wl='/System/Library/PrivateFrameworks/Apple80211.framework/Versions/A/Resources/airport scan'

# pbcopy
alias an='echo Hallo, ich würde es für 50 € nehmen, bitte nur melden falls der Preis in Frage kommt.|pbcopy'
alias adr='echo Timo Körner, Bergstr. 15, 85120 Hepberg | pbcopy'
alias em='ec user153015@gmail.com | pbcopy'
alias em2='ec timo@tik1.net | pbcopy'
alias es='ec studienkreis.timo.koerner@gmail.com | pbcopy'
alias fn='ec 08456 9524 297|pbcopy'
alias ib='ec de39 5001 0517 5447 5823 49 | pbcopy'
alias nr='ec 0157 3959 8220 | pbcopy'
alias nh='ec Hallo, ich bin der neue Mathe Nachhilfelehrer. Kannst du bitte für den gemeinsamen Termin  Unterlagen für die Vorbereitung mailen. | pbcopy'
alias nh2='ec Hallo, ich biete Online Nachhilfe per google meet. Der Preis ist 18 € für 45 Minuten. Das Material als Pdf oder Bild bitte über Whatsapp schicken mit einem Terminvorschlag für die erste Stunde an 0157 3959 8220 | pbcopy'

alias st='ec Die Adresse ist Alte Landstraße 8, 85101 Lenting. Es gibt oberhalb bzw. nördlich eine Baustelle, die Zufahrt zum Haus ist an der Gaststätte Hofmark vorbei, also von Süden|pbcopy'


#cpu, system
alias cpu='sysctl -n machdep.cpu.brand_string'
alias os=sw_vers
alias s='open -b com.apple.systempreferences'



function cp_mount {
    usb=CCCOMA_X86FRE_DE-DE_DV9 
    cp $1 /Users/thome/.mounty/$usb
}


function wifi_get { /System/Library/PrivateFrameworks/Apple80211.framework/Resources/airport -I | awk -F: '/ SSID/{print $2}' }

function cc {
    echo "$@"|pbcopy
}

function unzip_ {
    downl=$HOME/downloads
    icloud="iCloud Photos"
    cd $downl
    rm -rf $icloud
    unzip $icloud.zip
    open $icloud/IMG*
}

b=$0
a=(${(s|custom/plugins/macos/|)b})
echo $a[2] loaded
