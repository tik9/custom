soup=$dp/soup.py

function p3(){
	if [ $os != "CYGWIN_NT-6.1" ]; then

		python3 $@
	else
		python $@;fi
}

function pd(){
	for p in $@;do
		pipdeptree -r --package $p |less
		echo "\n"
		pip show $p
	done
}

function p2 {
	pip install $1 --upgrade
}


function pug {
	pip list --outdated --format=freeze | grep -v '^\-e' | cut -d = -f 1  | xargs -n1 pip install -U
}

function sess(){
	((!$#))&& echo kein Arg ||
	sed -i "s/\(cd = { 'sessionid':\).*/\1 \'$1\'}/" $soup
	ec \'$1\'
	p3 $soup
}


alias iy='ipython'
alias pyc='/root/progr/pycharm/bin/pycharm.sh&'

#pip
alias kp='kill python3'
alias pdt='pipdeptree --package'
alias pdr='pipdeptree -r --package'
alias pe='pip search'
alias pis='pip show'
alias pi='pip3 install'
alias pl='pip3 list | less'
alias pu='pip uninstall -y'
alias po='pip list --outdated f'
alias pll='pip list f'
alias sp2='c $soup | sed -n 4p'
