hw='/home/tk'

# echo $HOST
if [[ $HOST == 'wsl' ]];then
	ho=/mnt/c/Users/User
ph=$ho/Documents/WindowsPowerShell
cs=$ho/appdata/roaming/code/user
	else 
	ho=$HOME
ph=$ho/.config/powershell
cs=$ho/.config/Code/User	
	fi

plu=$ZSH_CUSTOM/plugins

be=$ho/bewerbung
cv=$ho/tik9.github.io
cy=$ho/cpython
ga=$ho/game
gt=$ho/gman

myd=$ho/documents
o=$ZSH_CUSTOM
rt=$ho/rest-test
ws=$ho/workspace.code-workspace

# ifconfig
alias i=ifconfig
alias iu='dhclient enx00e04c680015'
alias iw='ifconfig wlp2s0 down'
alias pi='ping 8.8.8.8 -c2'

#node
alias n=npm
alias nog='npm i -g'
alias noi='npm i'
alias nr='npm run'

# alias/Funktionen
alias a='alias -m'
alias ag='alias | grep'
alias d='declare -f'
alias t=type

# termux
tp='termux-media-player play'
ts='termux-media-player stop'
tv='termux-volume music'
y=./ytdl


# progr
alias c=cat
alias co=code
alias na=nano


# zsh
alias e='exec zsh'
alias x=exit

function cc {
    echo $@ |xclip -selection clipboard
}

alias cu='curl localhost'
alias dh='df -h'
alias di=dict
alias dow=/home/tk/snap/chromium/1382/Downloads 
alias ec=echo
alias grep='grep --color=auto'
alias hif='history -E'
alias ma=man
alias pm='sudo pm-suspend'
alias s='sudo -i'
alias to=touch


function chr { /usr/bin/chromium  $1 &  }

function dos2u { for i in *;do if [[ -f $i ]]; then sed -i 's/\r$//' "$i"; fi; done }


function find_ex {
	if [ -z "$2" ]; then
	# print $2
	ex=''; else
	# print $2 'else'
	ex=$2; fi
	# echo $ex
	find / -path $ex -prune -false -o -name $1
}

function g { grep $@ -r |less }

function ge { geany $1& }

function lx { lximage-qt $1 & }
function np { grep -c ^processor /proc/cpuinfo; nproc }
function q(){ wget http://speedtest.wdc01.softlayer.com/downloads/test100.zip --output-document=/dev/null }

function qp { qpdfview $1 & }

function qpd { start=''; ziel=''; qpdf $start --pages . 2-6 -- $ziel }

alias le='less'

# Command line head / tail shortcuts
alias -g H='|head'
alias -g T='|tail'

alias -g gre=' | grep'
alias -g L=' | less'

alias fd='find . -type d -name'
alias ff='find . -type f -name'
alias pg='ps -ef |grep'

alias -s pdf=SumatraPDF.exe

echo $0 loaded