
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

alias dv='p3 -c "import django;print(django.get_version())"'
alias p3="python3"
alias py='/root/progr/pycharm/bin/pycharm.sh&'
alias pg="g $custom/plugins/python/python.plugin.zsh"


# python django
alias cm="dm compilemessages"
alias dcd="cd ~/django"
alias dk='dcd;kid 0;dr'
alias dm='p3 manage.py'
alias dr='dm runserver'
alias mi="dm migrate"
alias mk="dm makemigrations"
alias mm="dm makemessages"

alias z="dcd;dr"


#pip
alias pdn='pipdeptree --package'
alias pdr='pipdeptree -r --package'
alias pi='p3 -m pip install'
alias pui='pip3 uninstall -y'
alias pis='p3 -m pip show'
alias pp='p3 -m pip list lp'
alias req='pi3 -r requirements.txt'
