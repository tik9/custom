
# Entferne python kompilierter byte-code im aktuellen Verzeichnis oder in einer Verzeichnisliste
function pyclean() {
    ZSH_PYCLEAN_PLACES=${*:-'.'}
	find . -path '*/__pycache__/*' -delete
    find ${ZSH_PYCLEAN_PLACES} -type d -name "__pycache__" -delete
}

function p3(){
	if [ $os != "CYGWIN_NT-6.1" ]; then

		python3 $@
	else
		python $@;fi
}

function pd(){
	pipdeptree -r --package $1
	echo \n
	pip show $1
}

alias iy='ipython'
alias pyc='/root/progr/pycharm/bin/pycharm.sh&'

#pip
alias pdt='pipdeptree --package'
alias pdr='pipdeptree -r --package'
alias pi='p3 -m pip install'
alias pu='pip uninstall -y'
alias pis='pip show'
alias po='pip list --outdated f'
alias ppl='p3 -m pip list f'
