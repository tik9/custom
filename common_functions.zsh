
# cp
function cpc { cp $o/common_functions.zsh $ph/common_functions.ps1 }
function cpg { cp $plu/git/git.plugin.zsh $ph\git.ps1 }

# ls
function l { ls}
function ll { ls |more }

function vse { echo $(code --list-extensions)|tr ' ' '\n' > extensions.txt}

#set location
function ... { cd ..\.. }
function .. { cd .. }
function cs { cd $cs }
function cv { cd $cv }
function cy { cd $cy }
function ga { cd $ga }
function gt { cd $gt }
function hi { history }
function ho { cd $ho }
function hw { cd $hw }
function o { cd $o }
function ph { cd $ph }
function pw { pwd}
