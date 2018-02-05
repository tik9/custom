
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
	git commit -m "$@"
	git status
}

compdef _gc gc


function gi(){
	dir=$(_check)

	 git add . 
	 git commit -m "$@"
	 #echo $out
	 #Everything up-to-date

	 git push
	git log --stat|head -10
}


function gl(){
	dir=$(_check)
	
	ec in $dir
	cd $dir
	out=`git pull`
	ec $out
	#git show
	if [[ $dir = $ZSH_CUSTOM ]] && [ $out != 'Bereits aktuell.' ];then
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

alias gf='git config --list'

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
alias grba='git rebase --abort'
alias grh='git reset HEAD'
alias grset='git remote set-url'
alias grs='curl https://api.github.com/repos/tik9/custom | grep size'
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
