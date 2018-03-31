lsb=`lsb_release -i|cut -d: -f2|sed -e 's/[[:blank:]]//'`

dowDir=/home/t/Downloads

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



#apt
alias acp='apt-cache policy' 
alias acs='apt-cache search'
alias ali='apt list --installed'
# List available updates only
alias aar='sudo apt autoremove -y'
alias ap='sudo apt purge'    
alias au='sudo apt update'   
alias aud='sudo apt update && sudo apt full-upgrade'
alias aug='sudo apt upgrade' 
alias auu='sudo apt update && sudo apt upgrade'   
alias allpkgs='dpkg --get-selections | grep -v deinstall'
alias in='sudo apt install'  
alias pkgsu="apt list --upgradable "
alias rem='apt remove'  


alias a+="amix +"
alias a-="amix -"
alias abi="abiword"
alias gp='gpicview'
alias hi='hibernate'
alias km='killall mplayer'
alias lsb='ec $lsb'
alias mu='mutt'

alias -s pdf=mupdf

alias s='pm-suspend'
alias -g xs='| xclip -selection clipboard'
alias z='/etc/init.d/networking restart; i; dt'
