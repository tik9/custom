
# Entferne python kompilierter byte-code im aktuellen Verzeichnis oder in einer Verzeichnisliste
function pyclean() {
    ZSH_PYCLEAN_PLACES=${*:-'.'}
    find ${ZSH_PYCLEAN_PLACES} -type d -name "__pycache__" -delete
}

function p3(){
	if [ $os != "CYGWIN_NT-6.1" ]; then

		python3 $@
	else
		python $@;fi
}

alias kid="pkill python3"
alias pyc='/root/progr/pycharm/bin/pycharm.sh&'

#pip
alias pdn='pipdeptree --package'
alias pdr='pipdeptree -r --package'
alias pi='p3 -m pip install'
alias pui='pip3 uninstall -y'
alias pis='p3 -m pip show'
alias ppl='p3 -m pip list n2'
