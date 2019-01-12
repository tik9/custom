#source ~/.zprofile; echo $ghtoken
gitdat=--date=format:'%A, %d.%m.%Y %H:%M'

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


function gt(){
	dir=$(_check)

	 git commit -am "$@"
	 git push
	git log --stat $gitdat | head -10
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


function grset(){
	git remote set-url origin git@github.com:tik9/$1
	git config --list
}


function u {
	cd $(_check)
	git log --stat $gitdat | head -n 10
	out=`git pull`
	echo $out
	if [ $out != 'Bereits aktuell.' ];then
		git log --stat $gitdat | head -n 10
	fi
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

alias gdca='git diff --cached'

alias gf='git config --list'
alias gg='$(_check); git log --stat $gitdat'

alias gig='b .gitignore'
alias gin='git init'

alias go='$(_check); git log --stat -p $gitdat'

alias gre='git remote'
alias grv='git remote -v'

alias gs='$(_check); git show'

alias gu='$(_check); git push; a'
alias n='$(_check); git log | head -n5 |tail -n3'
