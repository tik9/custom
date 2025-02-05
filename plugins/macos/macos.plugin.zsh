
eth=en0
wintf=en1


# bluetooth
alias b=blueutil
alias bt='blueutil -p toggle'

# net
alias et="ipconfig getifaddr $eth"
alias n=networkQuality
alias off-w="networksetup -setairportpower WI-FI off"
alias on-w="networksetup -setairportpower WI-FI on"
alias wi="ipconfig getifaddr $wintf"
alias wl='/System/Library/PrivateFrameworks/Apple80211.framework/Versions/A/Resources/airport scan'

# pbcopy
alias an='echo Hallo, ich würde es für 50 € nehmen, bitte nur melden falls der Preis in Frage kommt.|pbcopy'
alias adr='echo Timo Körner, Bergstr. 15, 85120 Hepberg | pbcopy'
alias em='ec user153015@gmail.com | pbcopy'
alias em2='ec timo@tik1.net | pbcopy'
alias fn='ec 08456 9524 297|pbcopy'
alias ib='ec de39 5001 0517 5447 5823 49 | pbcopy'
alias nr='ec 015739598220 | pbcopy'
alias nh='ec Hallo, ich bin der Mathe Nachhilfelehrer. Kannst du bitte für den gemeinsamen Termin zusätzliche Unterlagen mit Eingrenzung der Aufgaben für meine Vorbereitung mailen. Die Unterlagen vom Studienkreis - wenn geschickt - habe ich. Bitte zusätzlichen Stoff mailen wenn 1. vorhanden UND 2. für die erste Stunde wichtig ist. | pbcopy'


alias s='open -b com.apple.systempreferences'
alias osv=sw_vers
alias cpu='sysctl -n machdep.cpu.brand_string'



function cp_mount {
    usb=CCCOMA_X86FRE_DE-DE_DV9 
    cp $1 /Users/thome/.mounty/$usb
}


function wifi_get { /System/Library/PrivateFrameworks/Apple80211.framework/Resources/airport -I | awk -F: '/ SSID/{print $2}' }

function os_ver { sw_vers -productVersion }

function psp {
    all_files=(*)
    new_file=${all_files[1]::-5}
    big=${new_file}_big.pdf
    # ec ${new_file}_big.pdf
    pdfunite *.pdf $big &&
    ps2pdf -dPDFSETTINGS=/ebook $big ${new_file}.pdf &&
    files_nr=(*<0-9>*(.))
    
    # clean it
    # rm $big && rm $files_nr

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
