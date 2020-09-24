# alias/Funktionen
alias ag='alias | grep'
alias d='declare -f'
alias m='alias -m'
alias si='sudo -i'
alias t='type'

#calendar
alias ca='ncal -A2'
alias da='date'

# zsh
alias e="exec zsh"
alias plu='ec $plugins'
alias x=exit

#cds
alias cv=~/cv
alias cv2=/home/t/cv
alias ml=~/ml
alias lt=~/lt
alias lt2=/home/t/lt
alias o=$ZSH_CUSTOM
alias pm='sudo pm-suspend'


alias c=cat
alias cc='xclip -selection clipboard'
alias ec=echo
alias di=dict
alias key="ssh-keygen -q -t rsa -N '' -f ~/.ssh/id_rsa <<<y 2>&1 >/dev/null"
alias ma=man
alias pw=pwd
alias qp=qpdfview
alias ra='vlc -I curses http://provisioning.streamtheworld.com/pls/CKFRAM.pls'
alias s=pm-suspend
alias li='lt;less php/php-quiz.md'
alias v=vi
alias z='service network-manager restart'


cv=/home/t/cv
cvo=$cv/output

function ch {
	#~ --auto-open-devtools-for-tabs
	chromium-browser  $1 &
}

function cpa {
	
	ag=p3
	cp $cv/anschreiben.md $cv/anschreiben_$ag.md

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

function p {

	datei=
	datei=anschreiben_$datei
	datei=cv_en
	datei=`ls -t $cv | head -1`
	datei=${datei%.md}
	echo $datei
	#return
	input=$cv/$datei.md
	output=$cvo/$datei.html
	pandoc $input -o $output -s; 
	#~ killall chrome; 
	ch $output

}

function q(){
	datei=test100.zip
	
	wget http://speedtest.wdc01.softlayer.com/downloads/$datei --output-document=/dev/null
}


function wlans {
	iwlist wlan0 scan | $(sed -n 's/ESSID:"\(.*\)"/\1/p;s/Quality=\([0-9][0-9]\/[0-9][0-9]\).*/\1/p')
}


# Advanced Aliases.

# ls, the common ones I use a lot shortened for rapid fire usage
alias l='ls -lFh'     #size,show type,human readable
alias la='ls -lAFh'   #long list,show almost all,show type,human readable
alias lr='ls -tRFh'   #sorted by date,recursive,show type,human readable
alias ldot='ls -ld .*'
alias lS='ls -1FSsh'
alias lart='ls -1Fcart'
alias lrt='ls -1Fcrt'

alias zshrc='${=EDITOR} ~/.zshrc'

alias grep='grep --color'
alias sgrep='grep -R -n -H -C 5 --exclude-dir={.git,.svn,CVS} '

alias le='less'

# Command line head / tail shortcuts
alias -g H='| head'
alias -g T='| tail'
alias -g G='| grep'
alias -g L="| less"
alias -g LL="2>&1 | less"
alias -g CA="2>&1 | cat -A"
alias -g NE="2> /dev/null"
alias -g NUL="> /dev/null 2>&1"

alias dud='du -d 1 -h'
alias duf='du -sh *'
alias fd='find . -type d -name'
alias ff='find . -type f -name'

alias h='history'
alias hgrep="fc -El 0 | grep"
alias help='man'
alias psf='ps -f'
alias sortnr='sort -n -r'
alias unexport='unset'

#~ alias rm='rm -i'
#~ alias cp='cp -i'
#~ alias mv='mv -i'

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
  alias -s pdf=acroread
  alias -s ps=gv
  alias -s dvi=xdvi
  alias -s chm=xchm
  alias -s djvu=djview

  #list whats inside packed file
  alias -s zip="unzip -l"
  alias -s rar="unrar l"
  alias -s tar="tar tf"
  alias -s tar.gz="echo "
  alias -s ace="unace l"
fi

# Make zsh know about hosts already accessed by SSH
zstyle -e ':completion:*:(ssh|scp|sftp|rsh|rsync):hosts' hosts 'reply=(${=${${(f)"$(cat {/etc/ssh_,~/.ssh/known_}hosts(|2)(N) /dev/null)"}%%[# ]*}//,/ })'
