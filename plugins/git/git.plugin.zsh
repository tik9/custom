
zstyle -s ":vcs_info:git:*:-all-" "command" _omz_git_git_cmd
: ${_omz_git_git_cmd:=git}


function _check(){
	dir=$ZSH_CUSTOM
	if git rev-parse --git-dir > /dev/null 2>&1;then
		dir=.
	fi	
	echo $dir
}

function current_branch() {
  git_current_branch
}
# The list of remotes
function current_repository() {
  if ! $_omz_git_git_cmd rev-parse --is-inside-work-tree &> /dev/null; then
    return
  fi
  echo $($_omz_git_git_cmd remote -v | cut -d':' -f 2)
}
# Pretty log messages
function _git_log_prettily(){
  if ! [ -z $1 ]; then
    git log --pretty=$1
  fi
}
# Warn if the current branch is a WIP
function work_in_progress() {
  if $(git log -n 1 2>/dev/null | grep -q -c "\-\-wip\-\-"); then
    echo "WIP!!"
  fi
}


function gc(){
	#Aufruf: gc --m1 foo
	zparseopts -A ARGUMENTS m: m2:

	#mh=$1
#int a = (b == 5) ? c : d;
 [[ -n $ARGUMENTS[-m] ]] && mh=$ARGUMENTS[-m] || mh="$1"

	printf 'Argument mh ist "%s"\n' "$mh"
	git commit -am "$mh"
	git status
}

compdef _gc gc


function gi(){
		zparseopts -A ARGUMENTS m: mzt: m2h: m2t:

	#mh[1]=$ARGUMENTS[-mzh]
	#mt[1]=$ARGUMENTS[-mzt]
	#mh[2]=$ARGUMENTS[-m2h]
	
	dir=$(_check)

	 [[ -n $ARGUMENTS[-m] ]] && mh=$ARGUMENTS[-m] || mh="$1"

	#echo "${mh[$i]} ${mt[$i]} $dir"

	 cd $dir
 	ec hole $dir

	 #git add . 
	 git commit -am ${mh} 
	 #-m ${mt[$i]}
	 git push
}

compdef _gc gc

function gl(){
	dir=$(_check)
	
	ec hole $dir
	cd $dir
	git pull
	if [[ $dir = $ZSH_CUSTOM ]];then
		exec zsh
	fi
	
	git log --stat | head -n 15
}


alias a='gs'
alias g='git diff'
alias ga='git add --all;a'

alias gb='b $gb'
alias gb2='b $gb3'

alias gbr='git branch'
alias gba='git branch -a'

alias gcam='git commit -a -m'
alias gcf='git config --list --show-origin'
alias gcg='b .git/config'
alias gcl='git clone --recursive'
alias gclean='git clean -dnx'
alias gcm='git checkout master'
alias gcmsg='git commit -m'
alias gco='git .git/config'
alias gcount='git shortlog -sn'
compdef gcount=git

alias gd='$(_check);git diff'
alias gdca='git diff --cached'

function gdv() { git diff -w "$@" | view - }

compdef _git gdv=git-diff

alias gdw='git diff --word-diff'

alias gf='git config --list'

function gfg() { git ls-files | grep $@ }
compdef gfg=grep

alias glg='git log'

function ggf() {
[[ "$#" != 1 ]] && local b="$(git_current_branch)"
git push --force origin "${b:=$1}"
}

compdef _git ggf=git-checkout

function ggl() {
if [[ "$#" != 0 ]] && [[ "$#" != 1 ]]; then
	git pull origin "${*}"
else
	[[ "$#" == 0 ]] && local b="$(git_current_branch)"
	git pull origin "${b:=$1}"
fi
}

compdef _git ggl=git-checkout


function ggp() {
	if [[ "$#" != 0 ]] && [[ "$#" != 1 ]]; then
		git push origin "${*}"
	else
		[[ "$#" == 0 ]] && local b="$(git_current_branch)"
		git push origin "${b:=$1}"
	fi
}

compdef _git ggp=git-checkout


alias gg='git log --stat -p'
alias ggpush='git push origin $(git_current_branch)'

compdef _git ggpush=git-checkout

function ggpnp() {
	if [[ "$#" == 0 ]]; then
	ggl && ggp
	else
	ggl "${*}" && ggp "${*}"
	fi
}
compdef _git ggpnp=git-checkout

function ggu() {
	[[ "$#" != 1 ]] && local b="$(git_current_branch)"
	git pull --rebase origin "${b:=$1}"
}
compdef _git ggu=git-checkout
alias ggpur='ggu'
compdef _git ggpur=git-checkout

alias ghh='git grep "<<<<<<< HEAD"'
alias gig='b .gitignore'
alias gignored='git ls-files -v | grep "^[[:lower:]]"'
alias gin='git init'

alias glgg='git log --graph'
alias glgm='git log --graph --max-count=10'
alias glol="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
alias glola="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --all"
alias glp="_git_log_prettily"
compdef _git glp=git-log

function gls(){
	git log $1 --stat
}

compdef _gitlog gls
alias go='`_check`;git log'
alias gpu='git push;a'
alias gpsum='git push --set-upstream origin master'
alias gpv='git push -v'

alias gre='git remote'
alias gra='git remote add'
alias grb='git rebase'
alias grba='git rebase --abort'
alias grbc='git rebase --continue'
alias grset='git remote set-url'
alias grt='cd $(git rev-parse --show-toplevel || echo ".")'
alias gru='git remote update'
alias grv='git remote -v'

alias gs='git status'
alias gsb='git status -sb'
alias gsh='git show'
alias gsps='git show --pretty=short --show-signature'
alias gst='git stash;a'
alias gstl='git stash list'
alias gstp='git stash pop;gstl'
alias gsts='git stash show -p'

alias gt='git checkout'

alias gu='git pull'
alias gunignore='git update-index --no-assume-unchanged'
alias gunwip='git log -n 1 | grep -q -c "\-\-wip\-\-" && git reset HEAD~1'
alias gupv='git pull --rebase -v'

alias gwch='git whatchanged -p --abbrev-commit --pretty=medium'

alias u='cd $(_check);git log --stat | head -n 10'
