lsb=`lsb_release -i|cut -d: -f2|sed -e 's/[[:blank:]]//'`

dowDir=/home/t/Downloads
home2=/root

arc=`uname -a |cut -d' ' -f 14`

function ac(){
	apt-cache show $1 |less
}


function am(){
	amixer get Master |sed -n 5p |cut -d ' ' -f6 |sed -e 's/\[\([1-9][1-9]%\)]/\1/'
}

function amix(){
	if [[ -n $1 ]];then
	arg=10%$1
	else ;echo zero Argumente; arg=30% ; fi;
	amixer -q sset Master $arg
	am
}

function apt-history () {
  case "$1" in
    install)
      zgrep --no-filename 'install ' $(ls -rt /var/log/dpkg*)
      ;;
    upgrade|remove)
      zgrep --no-filename $1 $(ls -rt /var/log/dpkg*)
      ;;
    liste)
      zgrep --no-filename '' $(ls -rt /var/log/dpkg*)
      ;;
    *)
      echo " e.g liste - Listet dpkg logs"
      ;;
  esac
}


function b(){
	if [[ $(lsb) = Ubuntu ]]; then; /root/src/src_geany-1.28/usr/bin/geany $1 &
	else;vim;fi
}


function ci(){
		`$@` | xclip -selection clipboard
}

function cj(){
		echo $@ |xclip -selection clipboard
}

function co(){
		xclip -o -selection clipboard
}


function ma(){
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



function q(){
	datei=test100.zip
	wget http://speedtest.wdc01.softlayer.com/downloads/$datei --output-document=/dev/null
}

function sess(){
	sed -i "s/\(cd = { 'sessionid':\).*/\1 \'$1\'}/" soup.py
	ec \'$1\'
}


#apt
alias acp='apt-cache policy' 
alias acse='apt-cache search'
alias agli='apt list --installed'
# List available updates only
alias aglu='sudo apt-get -u upgrade --assume-no'
alias apg='sudo apt-get'            # age - but without sudo
alias aga='sudo apt-get autoclean' # aac
alias agar='sudo apt-get autoremove -y'
alias agc='sudo apt-get clean'     # adc
alias agp='sudo apt-get purge'    # ap
alias agu='sudo apt-get update'   # ad
alias agud='sudo apt-get update && sudo apt-get full-upgrade' #adu
alias agug='sudo apt-get upgrade' # ag
alias aguu='sudo apt-get update && sudo apt-get upgrade'      #adg
alias allpkgs='dpkg --get-selections | grep -v deinstall'
alias in='sudo apt-get install'  
alias pkgsu="apt list --upgradable "
alias rem='apt-get remove'   # ar


alias a+="amix +"
alias a-="amix -"
alias abi="abiword"
alias -g da=/home/pi/django

alias gp='gpicview'
alias hi='hibernate'
alias km='killall mplayer'
alias lsb='ec $lsb'
alias mu='mutt'

alias -s pdf=mupdf

alias s='pm-suspend'
alias sp='su pi'
alias -g xs='| xclip -selection clipboard'
alias z='/etc/init.d/networking restart; we; dt'
