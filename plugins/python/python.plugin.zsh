
# Entferne python kompilierter byte-code im aktuellen Verzeichnis oder in einer Verzeichnisliste
function pyclean() {
    ZSH_PYCLEAN_PLACES=${*:-'.'}
    find ${ZSH_PYCLEAN_PLACES} -type f -name "*.py[co]" -delete
    find ${ZSH_PYCLEAN_PLACES} -type d -name "__pycache__" -delete
}

kid(){
		if [ -z "$1" ]; then
	echo `basename $0` "Port: 0 oder 1"
	return
	fi
	kill $(netstat -lnp | grep 800$1 | awk "{print $7}" | cut -d"/" -f 1)

}

# Finde python Dateien
alias pyfind='find . -name "*.py"'


# Grep
alias pygrep='grep --include="*.py"'

function p3(){
	if [ $os != "CYGWIN_NT-6.1" ]; then

		python3 $@
	else
		python $@;fi
}

alias py='/root/progr/pycharm/bin/pycharm.sh&'
alias pg="g $pg"


#pip
alias pdn='pipdeptree --package'
alias pdr='pipdeptree -r --package'
alias pi='p3 -m pip install'
alias pui='pip3 uninstall -y'
alias pis='p3 -m pip show'
alias pp='p3 -m pip list lp'
alias req='pi -r requirements.txt'
