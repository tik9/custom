
# Remove python compiled byte-code in either current directory or in a
# list of specified directories
function pyclean() {
    ZSH_PYCLEAN_PLACES=${*:-'.'}
    find ${ZSH_PYCLEAN_PLACES} -type f -name "*.py[co]" -delete
    find ${ZSH_PYCLEAN_PLACES} -type d -name "__pycache__" -delete
}


alias dv='python -c "import django;print(django.get_version())"'
alias p3="ipython3"
alias py='/root/progr/pycharm/bin/pycharm.sh&'
alias pg="g $custom/plugins/python/python.plugin.zsh"


# python django
alias dcd="cd ~/django"
alias dg='p3 -c "import django; print(django.get_version())"'
alias dk='dcd;kill $(netstat -lnp | grep 8000 | awk "{print $7}" | cut -d"/" -f 1);dr'
alias dm='p3 wsgi/myproject/manage.py'
alias dr='p3 wsgi/myproject/manage.py runserver&'

alias ma='p3 wsgi/myproject/manage.py'
alias d1="cd ~/django"
alias mk="p3 wsgi/myproject/manage.py makemigrations"
alias mi="p3 wsgi/myproject/manage.py migrate"

alias z="dcd;dr"


#pip
alias pi3='p3 -m pip install'
alias p3i=pi3
alias pui3='pip3 uninstall -y'
alias pl3='p3 -m pip list'
alias req='pi3 -r requirements.txt'
