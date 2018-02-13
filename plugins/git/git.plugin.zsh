#source .zprofile;echo $ghtoken

zstyle -s ":vcs_info:git:*:-all-" "command" _omz_git_git_cmd
: ${_omz_git_git_cmd:=git}


function ghd(){
	curl -X DELETE -H "Authorization: token `echo $ghtoken`" https://api.github.com/repos/$1/$2
}

function ghs(){
	curl -v -H "Authorization: token `echo $ghtoken`" https://api.github.com
}

function _check(){
	dir=$ZSH_CUSTOM
	if git rev-parse --git-dir > /dev/null 2>&1;then
		dir=`pwd`
	fi	
	echo $dir
}

function adg(){
	echo $1 >> .gitignore; git status
}


function gc(){
	git commit -am "$@"
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
}

function grs(){
	curl https://api.github.com/repos/tik9/$1 | grep size
}

alias a='$(_check); git status'

alias adc='git rm -r --cached'
	
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
alias gcount='git shortlog -sne --format=format:%cI'

alias gd='$(_check);git diff'
alias gdca='git diff --cached'
alias gdo='git diff origin'

alias gf='git config --list'
alias gg='git log --graph --oneline --decorate --all'

alias gig='b .gitignore'
alias gignored='git ls-files -v | grep "^[[:lower:]]"'
alias gin='git init'

alias go='`_check`; git log'
alias gp='$(_check); git push; a'
alias gpsum='git push --set-upstream origin master'

alias gre='git remote'
alias gra='git remote add'
alias grh='git reset HEAD; a'
alias grset='git remote set-url origin git@github.com:tik9/'
alias gru='git remote update'
alias grv='git remote -v'

alias gsb='git status -sb'
alias gs='$(_check); git show'
alias gsl='git shortlog --format=format:%cI -e'
alias gss='git status -s | while read mode file; do echo $mode $file $(stat -c %y $file); done'
alias gst='git stash; a'
alias gstl='git stash list'
alias gstp='git stash pop; gstl'
alias gsts='git stash show -p'

alias gt='git checkout -- .; git pull'
alias gu='find . -mindepth 1 -maxdepth 2 -type d -print -exec git -C {} pull \;'

alias i='$(_check); git log --stat'
alias n='$(_check); git log --stat -p'

alias u='cd $(_check);git log --stat | head -n 10'
