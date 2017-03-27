
# Entferne python kompilierter byte-code im aktuellen Verzeichnis oder in einer Verzeichnisliste
function pyclean() {
    ZSH_PYCLEAN_PLACES=${*:-'.'}
    find ${ZSH_PYCLEAN_PLACES} -type f -name "*.py[co]" -delete
    find ${ZSH_PYCLEAN_PLACES} -type d -name "__pycache__" -delete
}


alias dv='p3 -c "import django;print(django.get_version())"'
alias p3="python3"
alias py='/root/progr/pycharm/bin/pycharm.sh&'
alias pg="g $custom/plugins/python/python.plugin.zsh"


# python django
alias dcd="cd ~/django"
alias dg='p3 -c "import django; print(django.get_version())"'
alias dk='dcd;kid ;dr'
alias -g dm='p3 myproject/manage.py'
alias dr='p3 dm runserver&'
alias kid='kill $(netstat -lnp | grep 8000 | awk "{print $7}" | cut -d"/" -f 1)'

alias mk="p3 dm makemigrations"
alias mi="p3 dm migrate"

alias z="dcd;dr"


#pip
alias pd='pipdeptree --package'
alias pdr='pipdeptree -r --package'
alias pi='p3 -m pip install'
alias pui='pip3 uninstall -y'
alias pis='p3 -m pip show'
alias pl='p3 -m pip list'
alias req='pi3 -r requirements.txt'
