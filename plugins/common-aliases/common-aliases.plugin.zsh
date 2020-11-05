home=/home/tk
cv=~/cv
ca=~/.oh-my-zsh/custom/plugins/common-aliases/common-aliases.plugin.zsh
sprache=Success
cvo=$cv/output
fa=Cu
output=anschreiben_Cu

ps_profile_pfad=/mnt/c/Users/User/Documents/WindowsPowerShell

# alias/Funktionen
alias ag='alias | grep'
alias cho='chown t'
alias co=code
alias d='declare -f'
alias m='alias -m'
alias si='sudo -i'
alias t='type'

alias -g ca=$ZSH_CUSTOM/plugins/common-aliases/common-aliases.plugin.zsh 
cu='curl localhost'

#calendar
alias cal='ncal -A2'
alias da=date

#cds
alias cs=.config/Code/User
alias cv=$cv
alias c2=$home/cv
alias ml=~/ml
alias lt=~/lt
alias lt2=$home/lt
alias o=$ZSH_CUSTOM
alias oh=$ZSH

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


function bc_ { echo "$@" | bc -l }

function se_bew { # firma sprache
    #    rm $output
		job="$2"
		fa=$1
		fa_kurz=${fa:0:2}

       sed -i "/ags=\[/a \n" $cv/media/ags.js
    #    sed -i "/ags=\[/a {a:'$fa',\nj:'$job'}," $cv/media/ags.js
		# sed  -i 's/^fa=.*$/fa='$fa_kurz'/' $ca

        # sed -i 's/^output=anschreiben_.*$/output=anschreiben_'$fa_kurz'/' $ca

        if [ -n $3 ]; then; sed -i "s/^sprache=.*$/sprache=$3/" $ca ; fi
       # echo output $output

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

function g { sudo geany $1 }

function ic {
	geraet=wlp2s0
	ipa=$(ip addr show $geraet)
	 echo $ipa | sed -n 's/\s\{4\}inet\s\(192\.168\.[0-9]\{2\}\.[0-9]\{3\}\).*/\1/p'
	 #~ inet \(192\.168\.43\.[0-9]*\).*/\1/p
}

function lx { lximage-qt $1 & }

function pd {
	#output=$cv/cv_de
	bew=bewerbung.pdf
	pdfunite $home/$output.pdf $home/cv_$bew $home/$bew
	qp $home/$bew
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

function visud {
	sed '$agit ALL=(ALL) NOPASSWD:ALL' /etc/sudoers
}

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
alias -g gr='|grep'
alias -g L='|less'
alias -g LL="2>&1 | less"

alias dud='du -d 1 -h'
alias duf='du -sh *'
alias fd='find . -type d -name'
alias ff='find . -type f -name'
alias hi=history
alias hgrep="fc -El 0 | grep"

alias -s pdf=SumatraPDF.exe
alias -s tar='tar tf'