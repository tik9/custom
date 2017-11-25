#zmodload zsh/zutil

zstyle -s ":vcs_info:git:*:-all-" "command" _omz_git_git_cmd
: ${_omz_git_git_cmd:=git}

#
# Funktionen
#

# The name of the current branch
# Back-compatibility wrapper for when this function was defined here in
# the plugin, before being pulled in to core lib/git.zsh as git_current_branch()
# to fix the core -> git plugin dependency.
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
	zparseopts -A ARGUMENTS -m1: -m2:

	m1=$ARGUMENTS[--m1]
	m2=$ARGUMENTS[--m2]

	printf 'Argument m1 ist "%s"\n' "$m1"
	printf 'Argument m2 ist "%s"\n' "$m2"
	git commit -am "$m1" -m "$m2"
}

compdef _gitcommit gc


function gi(){
	
		zparseopts -A #ARGUMENTS m1h:m1t: m2h:m2t:

	m1h=$ARGUMENTS[-m1h]
	#m1t=$ARGUMENTS[-m1t]
	#m2h=$ARGUMENTS[-m2h]
	#m2t=$ARGUMENTS[-m2t]
#	for dir in mte/my-app arduino; do
	i=1
	#for dir in ~/vs/vs $ZSH_CUSTOM; do
echo $(m{$i}h) 
# m"$i"t 
	echo $dir
	# cd $dir
	#git status
	 git add . 
	 git commit -am "$1"
	 #h -m m"$i"t 
	 git push
	#i++
#	done
#cd
}

compdef _gitCommitSimple gi

function gl(){
	#for dir in $ZSH_CUSTOM; do
		
	if [ $# -eq 0 ];then
		echo keine Argumente
		return
	fi
		
	ec hole ~/$1..
	#ec hole $ZSH_CUSTOM..
	cd ~/$1
	#cd $ZSH_CUSTOM
	git pull
	if [[ $1 = $ZSH_CUSTOM ]];then
		exec zsh
	fi
	#done
}

mg(){
	dir= ~/mte
	cd $dir
}

# Aliase

alias a='gs'
alias ga='git add --all'
alias gal='git config --get-regexp alias'
alias gapa='git add --patch'

alias gb='git branch'
alias gba='git branch -a'
alias gbda='git branch --merged | command grep -vE "^(\*|\s*master\s*$)" | command xargs -n 1 git branch -d'
alias gbl='git blame -b -w'
alias gbnm='git branch --no-merged'
alias gbr='git branch --remote'

alias gc!='git commit -v --amend'

alias gcam='git commit -a -m'
alias gcb='git checkout -b'
alias gcf='git config --list --show-origin'
alias gcg='git config --global'
alias gcl='git clone --recursive'
alias gclean='git clean -fd'
alias gcm='git checkout master'
alias gcmsg='git commit -m'
alias gco='g .git/config'
alias gcount='git shortlog -sn'
compdef gcount=git

alias gd='git diff'
alias gdca='git diff --cached'
alias gdct='git describe --tags `git rev-list --tags --max-count=1`'
alias gdt='git diff-tree --no-commit-id --name-only -r'

function gdv() { git diff -w "$@" | view - }

compdef _git gdv=git-diff

alias gdw='git diff --word-diff'

alias gf='git fetch'

function gfg() { git ls-files | grep $@ }
compdef gfg=grep

alias gg='git config --list'

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

alias ggpull='git pull origin $(git_current_branch)'
compdef _git ggpull=git-checkout

function ggp() {
	if [[ "$#" != 0 ]] && [[ "$#" != 1 ]]; then
		git push origin "${*}"
	else
		[[ "$#" == 0 ]] && local b="$(git_current_branch)"
		git push origin "${b:=$1}"
	fi
}

compdef _git ggp=git-checkout


alias ggpl='g $ggpl'

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
alias gignore='git update-index --assume-unchanged'
alias gignored='git ls-files -v | grep "^[[:lower:]]"'
alias gin='git init'

alias glg='git log --stat -p'
alias glgg='git log --graph'
alias glgm='git log --graph --max-count=10'
alias glol="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
alias glola="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --all"
alias glp="_git_log_prettily"
compdef _git glp=git-log


alias gpu='git push'
compdef _git gpoat=git-push
alias gpsum='git push --set-upstream origin master'
alias gpv='git push -v'

alias gre='git remote'
alias gra='git remote add'
alias grb='git rebase'
alias grba='git rebase --abort'
alias grbc='git rebase --continue'
alias grh='git reset HEAD'
alias grset='git remote set-url'
alias grt='cd $(git rev-parse --show-toplevel || echo ".")'
alias grv='git remote -v'

alias gs='git status'
alias gsb='git status -sb'
alias gsh='git show'
alias gsps='git show --pretty=short --show-signature'
alias gst='git stash'
alias gstl='git stash list'
alias gstp='git stash pop'
alias gsts='git stash show -p'

alias gu='git pull'
alias gunignore='git update-index --no-assume-unchanged'
alias gunwip='git log -n 1 | grep -q -c "\-\-wip\-\-" && git reset HEAD~1'
alias gupv='git pull --rebase -v'

alias gwch='git whatchanged -p --abbrev-commit --pretty=medium'
alias gwip='git add -A; git rm $(git ls-files --deleted) 2> /dev/null; git commit -m "--wip--"'

alias i='git'
alias k='git log --stat | head -n 15'

function n(){
	git log $1 --stat
}

compdef _gitlog n

alias ogp='o;gi'
alias ogl='o;gl'
