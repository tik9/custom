
# ls
alias l='ls -lFh'     #Größe, Typ
alias la='ls -lAFh'   #lange liste, fast alles
alias lart='ls -1Fcart'
alias ldot='ls -ld .*'
alias lr='ls -tRFh'   #sortiert nach Datum,rekursiv,Typ,human readable
alias lt='ls -ltFh'   #long list,sorted by date,show type,human readable
alias ll='ls -l'      #lange liste
alias lS='ls -1FSsh'
alias lrt='ls -1Fcrt'
alias lsh="ls -halt --full-time"

alias zshrc='g ~/.zshrc' 

alias grep='grep --color'
alias sgrep='grep -R -n -H -C 5 --exclude-dir={.git,.svn,CVS} '

alias ta='tail -f'

# Command line head / tail
alias -g H='| head'
alias -g T='| tail'
alias -g G='| grep'
alias -g LL="2>&1 | less"
alias -g CA="2>&1 | cat -A"
alias -g NE="2> /dev/null"
alias -g NUL="> /dev/null 2>&1"
alias -g P="2>&1| pygmentize -l pytb"

alias dud='du -d 1 -h'
alias duf='du -sh *'
alias fd='find . -type d -name'
alias ff='find . -type f -name'

alias his='history'
alias hgrep="fc -El 0 | grep"
alias pf='ps -f'
alias sortnr='sort -n -r'
alias unexport='unset'


# zsh is able to auto-do some kungfoo
# depends on the SUFFIX :)
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

  #Lese Dokumente
  alias -s pdf=mupdf
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
