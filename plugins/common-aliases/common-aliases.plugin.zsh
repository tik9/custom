home_wsl=/home/tk

ca=$ZSH_CUSTOM/plugins/common-aliases/common-aliases.plugin.zsh
cs=.config/Code/User
cs=/mnt/c/Users/User/appdata/roaming/code/user
cv=~/cv
cvo=$cv/output
doks=$home_wsl/doks
fa=Cu
ho=/mnt/c/Users/User
myd=$home_wsl/documents
oh=$ZSH
output=anschreiben_$fa
prof_home=$ho/Documents/WindowsPowerShell
sprache=en
zsh_cu=$ZSH_CUSTOM

# alias/Funktionen
alias ag='alias | grep'
alias cho='chown t'
alias d='declare -f'
alias m='alias -m'
alias si='sudo -i'
alias t='type'

alias -g ca=$ca 
cu='curl localhost'

#cds
alias cv=$cv
alias c2=$hw/cv
alias g=/gt


# code
alias co=code
alias coc='code $ca'
alias cop='code $prof_home/Microsoft.PowerShell_profile.ps1'

# zsh
alias e="exec zsh"
alias pa='ec $PATH'
alias pa_wi='/mnt/c/Windows/system32/cmd.exe /c echo %path%'
alias pa_def='export PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games'
alias plu='ec $plugins'
alias x=exit


alias c=cat
alias cc='xclip -selection clipboard'
alias ec=echo
alias grep='grep --color=auto'
alias key="ssh-keygen -q -t rsa -N '' -f ~/.ssh/id_rsa <<<y 2>&1 >/dev/null"
alias ma=man
alias pm='sudo pm-suspend'
alias pr='code /mnt/c/Users/User/documents/WindowsPowerShell/Microsoft.PowerShell_profile.ps1'
alias pw=pwd
alias ra='vlc.exe -I curses http://provisioning.streamtheworld.com/pls/CKFRAM.pls'
alias s='sudo -i'
alias z='service network-manager restart'

function cp_key {
	root_ip=192.168.178
	final_ip=root@$root_ip.36
	source_ip=$root_ip.38
	id_rsa=/root/id_rsa.pub
	id_rsa_src=.ssh/id_rsa.pub
	ssh $source_ip -p8022 "./exp p scp -o 'StrictHostKeyChecking no' $id_rsa_src $final_ip:$id_rsa" 
	ssh $final_ip "rm $id_rsa"
	ssh $final_ip 'cat /root/id_rsa.pub >> .ssh/authorized_keys'
	ss_ak $final_ip
}


function ss_ak {
	ssh $@ 'cat .ssh/authorized_keys'
}

function bc_ { echo "$@" | bc -l }

function se_bew { # firma sprache
    #    rm $output
		job="$2"
		fa=$1
		fa_kurz=${fa:0:2}

       sed -i "/ags=\[/a \n" $cv/media/ags.js
    #    sed -i "/ags=\[/a {a:'$fa',\nj:'$job'}," $cv/media/ags.js
		# sed  -i 's/^fa=.*$/fa='$fa_kurz'/' $ca

        if [ -n $3 ]; then; sed -i "s/^sprache=.*$/sprache=$3/" $ca ; fi

        # cp $cv/anschreiben_$sprache.md $cv/anschreiben_$fa_kurz.md
        # code $cv/anschreiben_$fa_kurz.md
 }

function a {
    #    output=cv_en
       #output=${output%.md}
       output=`ls -t $cv | head -1`;neu=${output:0:-3};md=$cv/$neu.md;html=$cvo/$neu.html;pandoc $md -o $html -s
	   ch $html
}

function find_ex {
	if [ -z "$2" ]; then
	# print $2
	ex=''; else
	# print $2 'else'
	ex=$2; fi
	# echo $ex
	find / -path $ex -prune -false -o -name $1
}


function ch { chromium-browser  $1 &  }

function ge { sudo geany $1 }

function ic {
	geraet=wlp2s0
	geraet=eth0
	declare -A ip_ar=( [o1]=3 [o2]=2 [o3]=3 [o4]=2)

	echo ${ip_ar[o1]}

	ipa=$(ip addr show $geraet)
	 echo $ipa | sed -n 's/\s\{4\}inet\s\([0-9]\{3\}\.[0-9]\{2\}\.[0-9]\{3\}\.[0-9]\{2\}\).*/\1/p'
	 #~ inet \(192\.168\.43\.[0-9]*\).*/\1/p
}

function lx { lximage-qt $1 & }

function pd {
	#output=$cv/cv_de
	bew=bewerbung.pdf
	pdfunite $hw/$output.pdf $hw/cv_$bew $hw/$bew
	qp $hw/$bew
}

function plu_f {
	sed -i 's/.*plugins=(.*/plugins=(common-aliases debian git zsh-autosuggestions zsh-syntax-highlighting)/' ~/.zshrc
}


function q(){ wget http://speedtest.wdc01.softlayer.com/downloads/test100.zip --output-document=/dev/null }

function qp { qpdfview $1 & }

function qpd { start=''; ziel=''; qpdf $start --pages . 2-6 -- $ziel }

function wlans {
	iwlist wlan0 scan | $(sed -n 's/ESSID:"\(.*\)"/\1/p;s/Quality=\([0-9][0-9]\/[0-9][0-9]\).*/\1/p')
}

function visud { $us=git ; sed '$a'$us' ALL=(ALL) NOPASSWD:ALL' /etc/sudoers }

alias l='ls -lFh'     #size,show type,human readable
alias la='ls -lAFh'   #long list,show almost all,show type,human readable
alias lr='ls -tRFh'   #sorted by date,recursive,show type,human readable
alias ldot='ls -ld .*'
alias lS='ls -1FSsh'
alias lart='ls -1Fcart'
alias lrt='ls -1Fcrt'

alias -g zshrc=~/.zshrc

alias le='less'

# Command line head / tail shortcuts
alias -g H=|head
alias -g T=|tail
function g {
	grep $@ -r |less
}

alias -g gr='|grep'
alias -g L='|less'
alias -g LL="2>&1 | less"

alias dud='du -d 1 -h'
alias duf='du -sh *'
alias fd='find . -type d -name'
alias ff='find . -type f -name'
alias hgrep="fc -El 0 | grep"
alias hi=history

alias -s pdf=SumatraPDF.exe
alias -s tar='tar tf'