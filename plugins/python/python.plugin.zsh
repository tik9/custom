alias pyfind='find . -name "*.py"'

# Remove python compiled byte-code in either current directory or in a
# list of specified directories
function pyclean() {
    ZSH_PYCLEAN_PLACES=${*:-'.'}
    find ${ZSH_PYCLEAN_PLACES} -type f -name "*.py[co]" -delete
    find ${ZSH_PYCLEAN_PLACES} -type d -name "__pycache__" -delete
}

alias pygrep='grep --include="*.py"'
alias py='/root/progr/pycharm/bin/pycharm.sh&'


# python django
alias d0='d1;d2;dr'
alias d2='kill $(netstat -lnp| grep 8000|awk "{print $7}"|cut -d"/" -f 1)'
alias dr='wsgi/openshift/manage.py runserver&'
alias dr2='wsgi/openshift/manage.py'
alias d1="cd /root/dj3"
alias pm3="pm runserver&"
alias pm="./manage.py"
alias pms="pm diffsettings |le"

#pip
alias pi3='pip3 install'
alias pi2='pip2 install'
alias pui2='pip2 uninstall'
alias pui3='pip3 uninstall'
alias pl2='pip2 list'
alias pl3='pip3 list'
