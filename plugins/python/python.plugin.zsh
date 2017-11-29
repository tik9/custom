
# Entferne python kompilierter byte-code im aktuellen Verzeichnis oder in einer Verzeichnisliste
function pyclean() {
    ZSH_PYCLEAN_PLACES=${*:-'.'}
    find ${ZSH_PYCLEAN_PLACES} -type f -name "*.py[co]" -delete
    find ${ZSH_PYCLEAN_PLACES} -type d -name "__pycache__" -delete
}

alias kid=	'kill $(netstat -lnp | grep 8000 | awk "{print $6}" | cut -d"/" -f 1)'


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
alias pb="b $pg"
alias pp='pr3 python' # grep ps nach python

#pip
alias pdn='pipdeptree --package'
alias pdr='pipdeptree -r --package'
alias pi='p3 -m pip install'
alias pui='pip3 uninstall -y'
alias pis='p3 -m pip show'
alias ppl='p3 -m pip list n2'
alias req='pi -r requirements.txt'
