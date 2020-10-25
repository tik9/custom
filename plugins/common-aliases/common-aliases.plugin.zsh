home=/home/tk
sprache=en
cv=$home/cv
cvo=$cv/output
output=anschreiben_ey

ps_profile_pfad=/mnt/c/Users/User/Documents/WindowsPowerShell

ca=~/.oh-my-zsh/custom/plugins/common-aliases/common-aliases.plugin.zsh
js=$cv/media/js.js

function se_ag {
	sed -i "/ags=\[/a {j:'$1',\na:'$2'}," $cv/media/ags.js
}

function se_bew { # firma sprache
	rm $output
	sed -i 's/^output=anschreiben_.*$/output=anschreiben_'$1'/' $ca 
	sed -i "s/^sprache=.*$/sprache=$2/" $ca
	# sed -i "s/^sprache=.*$/sprache=$2/" $js

	cp $cv/anschreiben_$2.md $cv/anschreiben_$1.md
	code $cv/anschreiben_$1.md
}

function a {

	#output=cv_en
	
	#output=`ls -t $cv | head -1`
	#output=${output%.md}
	
	echo $output
	output_md=$cv/$output.md
	html_out=$cvo/$output.html
	pandoc $output_md -o $html_out -s
	
	# wkhtmltopdf $html_out $home/$output.pdf

	# ch $html_out
	# qp $home/$output.pdf

}

# alias/Funktionen
alias ag='alias | grep'
alias cho='chown t'
alias co=code
alias d='declare -f'
alias m='alias -m'
alias si='sudo -i'
alias t='type'

# apache
conf=/etc/apache2/sites-available/mein.conf
cu='curl localhost'

#calendar
alias cal='ncal -A2'
alias da=date

#cds
alias cv=~/cv
alias c2=$home/cv
alias dv=$home/devilbox
alias hw=$home
alias ml=~/ml
alias lt=~/lt
alias lt2=$home/lt
alias o=$ZSH_CUSTOM
alias oh=$ZSH


# zsh
alias e="exec zsh"
alias p=ps
alias pa='ec $PATH'
alias pa_wi='/mnt/c/Windows/system32/cmd.exe /c echo %path%'
alias pa_def='export PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games'
alias plu='ec $plugins'
alias x=exit


alias c=cat
alias cc='xclip -selection clipboard'
alias ec=echo
alias di=dict
alias grep='grep --color=auto'
alias key="ssh-keygen -q -t rsa -N '' -f ~/.ssh/id_rsa <<<y 2>&1 >/dev/null"
alias ma=man
alias pm='sudo pm-suspend'
alias pw=pwd
alias ra='vlc -I curses http://provisioning.streamtheworld.com/pls/CKFRAM.pls'
alias s='sudo -i'
alias li='lt;less'
alias z='service network-manager restart'


function bc_ {
  echo "$@" | bc -l
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


function ch {
	#~ --auto-open-devtools-for-tabs
	chromium-browser  $1 &
}


function g {
	sudo geany $1 &
}

function ic {
	ipa=$(ip addr show wlp2s0)
	 echo $ipa | sed -n 's/\s\{4\}inet\s\(192\.168\.[0-9]\{2\}\.[0-9]\{3\}\).*/\1/p'
	 #~ inet \(192\.168\.43\.[0-9]*\).*/\1/p
}

function lx {
	lximage-qt $1 &	
}


function pd {
	#output=$cv/cv_de
	bew=bewerbung.pdf
	pdfunite $home/$output.pdf $home/cv_$bew $home/$bew
	qp $home/$bew

}


function plu_f {
	sed -i 's/.*plugins=(.*/plugins=(common-aliases debian git zsh-autosuggestions zsh-syntax-highlighting)/' ~/.zshrc
}


function q(){
	output=test100.zip
	wget http://speedtest.wdc01.softlayer.com/downloads/$output --output-document=/dev/null
}

function qp {
	qpdfview $1 &
}

function qpd {
	start=''
	ziel=''
	qpdf $start --pages . 2-6 -- $ziel
}

function wlans {
	iwlist wlan0 scan | $(sed -n 's/ESSID:"\(.*\)"/\1/p;s/Quality=\([0-9][0-9]\/[0-9][0-9]\).*/\1/p')
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
alias -g CA="2>&1 | cat -A"

alias dud='du -d 1 -h'
alias duf='du -sh *'
alias fd='find . -type d -name'
alias ff='find . -type f -name'

alias h=$home
alias hi=history
alias hgrep="fc -El 0 | grep"
alias psf='ps -f'


# zsh is able to auto-do some kungfoo
# depends on the SUFFIX :)
autoload -Uz is-at-least
if is-at-least 4.2.0; then
  # open browser on urls
  if [[ -n "$BROWSER" ]]; then
    _browser_fts=(htm html de org net com at cx nl se dk)
    for ft in $_browser_fts; do alias -s $ft=$BROWSER; done
  fi

  _editor_fts=(cpp cxx cc c hh h inl asc txt TXT tex)
  for ft in $_editor_fts; do alias -s $ft=$EDITOR; done

  if [[ -n "$XIVIEWER" ]]; then
    _image_fts=(jpg jpeg png gif mng tiff tif xpm)
    for ft in $_image_fts; do alias -s $ft=$XIVIEWER; done
  fi

  _media_fts=(ape avi flv m4a mkv mov mp3 mpeg mpg ogg ogm rm wav webm)
  for ft in $_media_fts; do alias -s $ft=mplayer; done

  #read documents
  alias -s pdf=qpdfview
  alias -s md=geany

  #list whats inside packed file
  alias -s zip="unzip -l"
  alias -s rar="unrar l"
  alias -s tar="tar tf"
  alias -s tar.gz="echo "
  alias -s ace="unace l"
fi

# Make zsh know about hosts already accessed by SSH
zstyle -e ':completion:*:(ssh|scp|sftp|rsh|rsync):hosts' hosts 'reply=(${=${${(f)"$(cat {/etc/ssh_,~/.ssh/known_}hosts(|2)(N) /dev/null)"}%%[# ]*}//,/ })'
