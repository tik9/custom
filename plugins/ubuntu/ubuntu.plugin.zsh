
lsb=`lsb_release -i|cut -d: -f2|sed -e 's/[[:blank:]]//'`

dowDir=/home/t/Downloads
mteDir=/root/git/mte

arc=`uname -a |cut -d' ' -f 14`

function b(){	
	/root/src/src_geany-1.28/usr/bin/geany $1 &
}

function ci(){
		echo "$1"|xclip
}

function co(){
		xclip -o
}

function mp(){
	mupdf $1 &
}


function q(){
	# zeige WLAN ssid (iwget)
		iwgetid -r;printf "\n";
	datei=test100.zip

	trap int_trap INT
	echo Ctrl-C zum Beenden des downloads $datei

	wget http://speedtest.wdc01.softlayer.com/downloads/$datei --output-document=/dev/null
	
	echo Ende
}


alias abi="abiword"
alias acd='apt-cache depends'

alias acp='apt-cache policy' 
compdef _acp acp='apt-cache policy'

alias acs='apt-cache show'
alias acse='apt-cache search'
compdef _acs acse='apt-cache search'


alias afs='apt-file search --regexp'
compdef _afs afs='apt-file search --regexp'

alias agli='apt list --installed'
compdef _agli agli='apt list --installed'

# List available updates only
alias aglu='sudo apt-get -u upgrade --assume-no'
compdef _aglu aglu='sudo apt-get -u upgrade --assume-no'

alias ags='apt-get source'  
compdef _ags ags='apt-get source'

alias afu='sudo apt-file update'
compdef _afu afu='sudo apt-file update'
alias arc="echo $arc"

alias hi='sudo hibernate'

#alias lsb='ec $lsb'

alias -s pdf=mupdf

alias ppap='sudo ppa-purge'
compdef _ppap ppap='sudo ppa-purge'
alias s='sudo pm-suspend'

#apt get
alias apg='sudo apt-get'            # age - but without sudo
alias aga='sudo apt-get autoclean' # aac
alias agb='sudo apt-get build-dep' # abd
alias agc='sudo apt-get clean'     # adc
alias agd='sudo apt-get dselect-upgrade' # ads
alias agi='sudo apt-get install'  # ai
alias agp='sudo apt-get purge'    # ap
alias agr='sudo apt-get remove'   # ar
alias agu='sudo apt-get update'   # ad
alias agud='sudo apt-get update && sudo apt-get full-upgrade' #adu
alias agug='sudo apt-get upgrade' # ag
alias aguu='sudo apt-get update && sudo apt-get upgrade'      #adg
alias agar='sudo apt-get autoremove'

compdef _ag apg='sudo apt-get'
compdef _aga aga='sudo apt-get autoclean'
compdef _agb agb='sudo apt-get build-dep'
compdef _agc agc='sudo apt-get clean'
compdef _agd agd='sudo apt-get dselect-upgrade'
compdef _agi agi='sudo apt-get install'
compdef _agp agp='sudo apt-get purge'
compdef _agr agr='sudo apt-get remove'
compdef _agu agu='sudo apt-get update'
compdef _agud agud='sudo apt-get update && sudo apt-get full-upgrade'
compdef _agug agug='sudo apt-get upgrade'
compdef _aguu aguu='sudo apt-get update && sudo apt-get upgrade'
compdef _agar agar='sudo apt-get autoremove'

# Alle Kernels löschen bis auf den Aktuellen
alias kclean='sudo aptitude remove -P ?and(~i~nlinux-(ima|hea) \
	?not(~n`uname -r`))'

# print all installed packages
alias allpkgs='dpkg --get-selections | grep -v deinstall'
alias pkgsu="apt list --upgradable "


# apt-add-repository with automatic install/upgrade of the desired package
# Usage: aar ppa:xxxxxx/xxxxxx [packagename]
# If packagename is not given as 2nd argument the function will ask for it and guess the default by taking
# the part after the / from the ppa name which is sometimes the right name for the package you want to install
aar() {
	if [ -n "$2" ]; then
		PACKAGE=$2
	else
		read "PACKAGE?Type in the package name to install/upgrade with this ppa [${1##*/}]: "
	fi
	
	if [ -z "$PACKAGE" ]; then
		PACKAGE=${1##*/}
	fi
	
	sudo apt-add-repository $1 && sudo apt-get update
	sudo apt-get install $PACKAGE
}

# Prints apt history
# Usage:
#   apt-history install
#   apt-history upgrade
#   apt-history remove
#   apt-history rollback
#   apt-history list
# Based On: http://linuxcommando.blogspot.com/2008/08/how-to-show-apt-log-history.html
apt-history () {
  case "$1" in
    install)
      zgrep --no-filename 'install ' $(ls -rt /var/log/dpkg*)
      ;;
    upgrade|remove)
      zgrep --no-filename $1 $(ls -rt /var/log/dpkg*)
      ;;
    rollback)
      zgrep --no-filename upgrade $(ls -rt /var/log/dpkg*) | \
        grep "$2" -A10000000 | \
        grep "$3" -B10000000 | \
        awk '{print $4"="$5}'
      ;;
    list)
      zgrep --no-filename '' $(ls -rt /var/log/dpkg*)
      ;;
    *)
*      echo "Parameters:"
      echo " install - Lists all packages that have been installed."
      echo " upgrade - Lists all packages that have been upgraded."
      echo " remove - Lists all packages that have been removed."
      echo " rollback - Lists rollback information."
      echo " list - Lists all contains of dpkg logs."
      ;;
  esac
}

# Kernel-package building shortcut
kerndeb () {
    # temporarily unset MAKEFLAGS ( '-j3' will fail )
    MAKEFLAGS=$( print - $MAKEFLAGS | perl -pe 's/-j\s*[\d]+//g' )
    print '$MAKEFLAGS set to '"'$MAKEFLAGS'"
	appendage='-custom' # this shows up in $ (uname -r )
    revision=$(date +"%Y%m%d") # this shows up in the .deb file name

    make-kpkg clean

    time fakeroot make-kpkg --append-to-version "$appendage" --revision \
        "$revision" kernel_image kernel_headers
}

# List packages by size
function apt-list-packages {
    dpkg-query -W --showformat='${Installed-Size} ${Package} ${Status}\n' | \
    grep -v deinstall | \
    sort -n | \
    awk '{print $1" "$2}'
}
