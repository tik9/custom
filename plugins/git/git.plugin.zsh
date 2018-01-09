
zstyle -s ":vcs_info:git:*:-all-" "command" _omz_git_git_cmd
: ${_omz_git_git_cmd:=git}


function _check(){
	dir=$ZSH_CUSTOM
	if git rev-parse --git-dir > /dev/null 2>&1;then
		dir=`pwd`
	fi	
	echo $dir
}


function gc(){
	zparseopts -A ARGUMENTS m:

	#int a = (b == 5) ? c : d;
	[[ -n $ARGUMENTS[-m] ]] && mh=$ARGUMENTS[-m] || mh=$@

	printf 'Argument mh ist "%s"\n' "$mh"
	git commit -am "$mh"
	git status
}

compdef _gc gc


function gi(){
		zparseopts -A ARGUMENTS m: mzt: m2h: m2t:

	#mh[1]=$ARGUMENTS[-mzh]
	
	dir=$(_check)

	 [[ -n $ARGUMENTS[-m] ]] && mh=$ARGUMENTS[-m] || mh=$@

	if -z git rev-parse --git-dir > /dev/null 2>&1;then
		cd $ZSH_CUSTOM
		ec "(wechsle zu) $ZSH_CUSTOM"
	fi
	 git add . 
	 git commit -am ${mh} 
	 git push
	git log --stat|head -10
}

compdef _gc gc


function gl(){
	dir=$(_check)
	
	ec hole $dir
	cd $dir
	git pull
	git show
	if [[ $dir = $ZSH_CUSTOM ]];then
		exec zsh
	fi
	
	#git log --stat | head -n 15
}


alias a='$(_check); git status'

alias adc='git rm -r --cached'

function adg(){
	echo $1 >> .gitignore; git status
}
	
alias cg='c .gitignore'
alias g='$(_check); git diff; git status'
alias ga='$(_check); git add --all'

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
alias gg='git log --graph --oneline --decorate --all
'
alias glp='$(_check); git log -p'

alias go='`_check`;git log'
alias gp='$(_check);git push;a'
alias gpsum='git push --set-upstream origin master'

alias gre='git remote'
alias gra='git remote add'
alias grb='git rebase'
alias grba='git rebase --abort'
alias grset='git remote set-url'
alias grs='curl https://api.github.com/repos/tik9/custom | grep size'
alias grt='cd $(git rev-parse --show-toplevel || echo ".")'
alias gru='git remote update'
alias grv='git remote -v'

alias gsb='git status -sb'
alias gs='$(_check); git show'
alias gst='git stash; a'
alias gstl='git stash list'
alias gstp='git stash pop; gstl'
alias gsts='git stash show -p'

alias gt='git checkout -- .;git status'
alias gu='find . -mindepth 1 -maxdepth 2 -type d -print -exec git -C {} pull \;'

alias i='$(_check); git log --stat'
alias n='$(_check); git log --stat -p'

alias u='cd $(_check);git log --stat | head -n 10'
