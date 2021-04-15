# echo $hostname
if [ $hostname = 'wsl' ];then
	ho=/mnt/c/Users/User ; 
ph=$ho/Documents/WindowsPowerShell
cs=$ho/appdata/roaming/code/user
	else ho=$HOME;
ph=$ho/.config/powershell
cs=$ho/.config/Code/User	
	fi

echo $ho

plu=$ZSH_CUSTOM/plugins

be=$ho/bewerbung
ca=$ph/Microsoft.PowerShell_profile.ps1
cf=$ZSH_CUSTOM/common_functions.zsh
cv=$ho/tik9.github.io.git
cy=$ho/cpython
ga=$ho/game
gt=$ho/git

myd=$ho/documents
o=$ZSH_CUSTOM
rt=$ho/rest-test
ws=$ho/workspace.code-workspace

#node
alias n=npm
alias nog='npm i -g'
alias noi='npm i'
alias nr='npm run'

# alias/Funktionen
alias a='alias -m'
alias ag='alias | grep'
alias d='declare -f'
alias p="echo $plugins"
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

alias -g cc='|xclip -selection clipboard'
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
alias -g zshrc=~/.zshrc


function bc_ { echo "$@" | bc -l }

function chr { /snap/bin/chromium  $1 &  }

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

alias -g gr='|grep'
alias -g L='|less'

alias fd='find . -type d -name'
alias ff='find . -type f -name'
alias pg='ps -ef |grep'

alias -s pdf=SumatraPDF.exe
