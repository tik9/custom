lsb=`lsb_release -i|cut -d: -f2|sed -e 's/[[:blank:]]//'`

dowDir=/home/t/Downloads
home2=/root

arc=`uname -a |cut -d' ' -f 14`
us=/media/t/INTENSO/

# z. B. apt-history install
# http://linuxcommando.blogspot.com/2008/08/how-to-show-apt-log-history.html
function apt-history () {
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
      echo " list - Lists all contains of dpkg logs."
      ;;
  esac
}

function am(){
	amixer get Master |sed -n 5p |cut -d ' ' -f6 |sed -e 's/\[\([1-9][1-9]%\)]/\1/'
}

function amix(){
	
	amixer -q sset Master 3%$1; am
}


function b(){
	if [[ $(lsb) = Ubuntu ]]; then; /root/src/src_geany-1.28/usr/bin/geany $1 &
	else;vim;fi
}


function ci(){
		echo `$@`|xclip -selection clipboard
}

function cj(){
		echo $@ |xclip -selection clipboard
}

function co(){
		xclip -o -selection clipboard
}


function mai(){
	zparseopts -A arg b: t: a:
		
	printf "Subject:$2\n\"${@:3}\"" |msmtp $1
	#printf "Subject:$arg[-b]\n${arg[-t]}" |msmtp $arg[-a]
	
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
	cd -  
}
compdef _ml ml


function mp(){
	mupdf $1 &
}


function pe(){
	sed -i "s/\(^plugins=\).*/\1(common-aliases git git-prompt ubuntu zsh-autosuggestions $1)/" $zr
	exec zsh && plu
}


function q(){
	# zeige WLAN ssid (iwget)
	datei=test100.zip

	trap int_trap INT
	echo Ctrl-C zum Beenden des downloads $datei
	wget http://speedtest.wdc01.softlayer.com/downloads/$datei --output-document=/dev/null

}

#apt
alias acp='apt-cache policy' 
alias acs='apt-cache show'
alias acse='apt-cache search'
alias agli='apt list --installed'
# List available updates only
alias aglu='sudo apt-get -u upgrade --assume-no'
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
alias allpkgs='dpkg --get-selections | grep -v deinstall'
alias in='sudo apt-get install'  
alias pkgsu="apt list --upgradable "
alias rem='sudo apt-get remove'   # ar

#Mail
alias mu='mutt'
alias ma='mail'


alias a+="amix +"
alias a-="amix -"
alias abi="abiword"
alias -g da=/home/pi/django

alias hi='hibernate'
alias km='killall mplayer'
alias lsb='ec $lsb'

alias -s pdf=mupdf

alias s='sudo pm-suspend'
alias sp='su pi'
alias -g us='$us'
alias z='/etc/init.d/networking restart; we'
