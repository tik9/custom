
lsb=`lsb_release -i|cut -d: -f2|sed -e 's/[[:blank:]]//'`

dowDir=/home/t/Downloads
home2=/root

arc=`uname -a |cut -d' ' -f 14`

function install(){
	xclip
}

function amix(){
	amixer -q sset Master 3%$1; amixer get Master |sed -n 5p |cut -d ' ' -f6
}


function b(){
	if [[ $(ip2 $svi) = $sv ]]; then; vim;else;/root/src/src_geany-1.28/usr/bin/geany $1 &
	fi
}


function ci(){
		echo $@|xclip -selection clipboard
}

function co(){
		xclip -o -selection clipboard
}


function mai(){
	zparseopts -A arg b: t: a:
		
	#printf "Subject:$arg[-b]\n${arg[-t]}" |msmtp $ad[$arg[-a]]
	printf "Subject:$arg[-b]\n${arg[-t]}" |msmtp $arg[-a]
	
	#test
	#printf "Subject:test betreff\ntest body eintrag" |msmtp $ad[tk]
	tail -n5 ~/.msmtp.log
}


function ma2(){
	if [ -z $1 ];then;echo Argument fehlt;return; fi
	cat email|msmtp $ad[$1] $ad[$2]	
	tail -n5 ~/.msmtp.log
}


function ml(){
	cd ~/musik
	ffprobe $1 2> >(grep Duration)
	mplayer $1  
}
compdef _ml ml


function mp(){
	mupdf $1 &
}

function mut(){
	#mutt -a $arg[-a] -s "$arg[-s]" -- $arg[-e] < $arg[-t]
	mutt -s "test" -- $ad[tk]
}

function pe(){
	sed -i "s/\(^plugins=\).*/\1(common-aliases git git-prompt ubuntu zsh-autosuggestions $1)/" $zr
	exec zsh && plu
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

#Mail
alias mm='c .msmtprc'
alias mu='mutt'
alias ma='mail'


alias a+="amix +"
alias a-="amix -"
alias abi="abiword"

alias acp='apt-cache policy' 

alias acs='apt-cache show'
alias acse='apt-cache search'

alias agli='apt list --installed'

# List available updates only
alias aglu='sudo apt-get -u upgrade --assume-no'

alias arc="echo $arc"

alias hi='hibernate'
alias km='killall mplayer'

alias -s pdf=mupdf
alias pi=gpicview

alias s='sudo pm-suspend'

#apt get
alias apg='sudo apt-get'            # age - but without sudo
alias aga='sudo apt-get autoclean' # aac
alias agb='sudo apt-get build-dep' # abd
alias agc='sudo apt-get clean'     # adc
alias agd='sudo apt-get dselect-upgrade' # ads
alias agp='sudo apt-get purge'    # ap
alias agu='sudo apt-get update'   # ad
alias agud='sudo apt-get update && sudo apt-get full-upgrade' #adu
alias agug='sudo apt-get upgrade' # ag
alias aguu='sudo apt-get update && sudo apt-get upgrade'      #adg
alias agar='sudo apt-get autoremove'
alias in='sudo apt-get install'  
alias rem='sudo apt-get remove'   # ar


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
