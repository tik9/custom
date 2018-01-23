arc=`uname -a |cut -d' ' -f 6`

home=c:/cygwin64/home/itdlz-koer
home2=/home/itdlz-koer
cHome=$home/.oh-my-zsh/custom

an=$cHome/$an2
co=$cHome/$co2
cy=$cHome/$cy2
dj=$cHome/$dj2
gi=$cHome/$gi2
lo=$cHome/login
oh=$cHome/oh-my-zsh.sh
re=$cHome/$re2
to=$cHome/todo
ub=$cHome/$ub2
zr=$home/.zshrc

#plugins
alias anb="b $an"
alias arb="b $ar"
alias cb="b $co"
alias -g com="$co"
alias cyb="b $cy"
alias gb="b $gi"
alias lb="b $lo"
alias ob="b $oh"
alias pb="b pom.xml"
alias tb="b $to"
alias ub="b $ub"
alias zb="b $zr"

bim=$(wmic OS get OSArchitecture)

dowDir=/cygdrive/C/Users/itdlz-koer/Downloads


function b(){	notepad++ $1 & }


function ci(){
		echo $1 > /dev/clipboard
}

function co(){
		cat /dev/clipboard
}

function ki(){
		pkill $1;
		echo "Prozesse mit $1 \n"
		ps -ef|grep $1
}

function m0(){
	 mvn compile
		 target/classes
	 java urlparser
}


function pe(){
	sed -i "s/\(^plugins=.*\))/\1 $1)/" $zr
	echo $plugins
	exec zsh
	echo $plugins
}


function q(){
	datei=test100.zip

	trap int_trap INT
	echo Ctrl-C zum Beenden des downloads $datei

	wget http://speedtest.wdc01.softlayer.com/downloads/$datei 
	
	if [ -f $datei ];then ; rm $datei; echo "$datei wird gelöscht"; fi	
	echo Ende
}

function sho(){apt-cyg show `echo $1`;}


alias agr='apt-cyg remove';
alias allpkgs='apt-cyg listall'
alias arc="echo $arc"

alias in='apt-cyg install'
alias j='ipconfig'

alias op='cygstart'
alias pd='cygcheck -c|less'
alias so='cp /cygdrive/c/Users/itdlz-koer/AppData/Roaming/Microsoft/Bibliography/sources.xml $un'
alias ter='mintty'
