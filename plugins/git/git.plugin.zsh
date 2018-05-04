#source ~/.zprofile; echo $ghtoken

zstyle -s ":vcs_info:git:*:-all-" "command" _omz_git_git_cmd
: ${_omz_git_git_cmd:=git}


function ghd(){
	curl -X DELETE -H "Authorization: token `echo $token_del`" https://api.github.com/repos/tik9/$1
}

function ghs(){
	curl -v -H "Authorization: token `echo $token_rep`" https://api.github.com
}

function ghc(){
	curl -i -H 'Authorization: token `echo $token_rep`' \
    -d '{ \
        "name": "b", \
        "auto_init": true, \
        "private": false, \
      }' \
    https://api.github.com/tik9/repos
}

function _check(){
	dir=$ZSH_CUSTOM
	if git rev-parse --git-dir > /dev/null 2>&1;then
		dir=`git rev-parse --show-toplevel`
	fi	
	echo $dir
}


function gco(){
	git commit -am "$@"
	git status
}


function gi(){
	dir=$(_check)

	 git add . 
	 git commit -m "$@"
	 git push
	git log --stat|head -10
}


function gl(){
	dir=$(_check)
	
	ec in $dir
	cd $dir
	out=`git pull`
	echo $out
	if [[ $dir = $ZSH_CUSTOM ]] && [ $out != 'Bereits aktuell.' ];then
		exec zsh
	fi
}

function grs(){
	dir=$(_check)
	echo $dir
	curl https://api.github.com/repos/tik9/$dir | grep size
}


function grset(){
	git remote set-url origin git@github.com:tik9/$1
	git config --list
}


alias a='$(_check); git status'

alias adc='git rm -r --cached'
	
alias cg='c .gitignore'
alias g='$(_check); git diff; git status'
alias ga='$(_check); git add --all'

alias gcam='git commit -a -m'
alias gcf='git config --list --show-origin'
alias gcg='b .git/config'
alias gcl='git clone --recursive'

alias gclean='git clean -dnx'

alias gcm='git checkout master'

alias gd='$(_check);git diff'
alias gdca='git diff --cached'
alias gdo='git diff origin'

alias gf='git config --list'
alias gg='$(_check); git log --stat'

alias gig='b .gitignore'
alias gin='git init'
alias gk='curl https://api.github.com/users/tik9/keys | less'

alias go='$(_check); git log --stat -p'

alias gre='git remote'
alias gra='git remote add'
alias grh='git reset HEAD; a'
alias gru='git remote update'
alias grv='git remote -v'

alias gsb='git status -sb'
alias gs='$(_check); git show'
alias gsl='git shortlog --format=format:%cI -e'
alias gst='git stash; a'
alias gstl='git stash list'
alias gstp='git stash pop; gstl'
alias gsts='git stash show -p'

alias gt='git checkout -- .; git pull'
alias gu='$(_check); git push; a'

alias u='cd $(_check);git log --stat | head -n 10'
