
# code
function ca { code $ca }
function cf { code $cf}
function gim { code $gim }

# cp
function cpcf { cp $o/common_functions.zsh $ph/common_functions.ps1 }
function cpg { cp $plu/git/git.plugin.zsh $ph\git.ps1 }

# ls
function l { ls}
function ll { ls |more }

function vse { echo $(code --list-extensions)|tr ' ' '\n' > extensions.txt}

#set location
function ... { cd ..\.. }
function .. { cd .. }
function cs { cd $cs }
function cs2 { cd $cs2 }
function cv { cd $cv }
function fs { cd $fs }
function gt { cd $gt }
function hi { history }
function ho { cd $ho }
function hw { cd $hw }
function lt { cd $lt }
function ml { cd $ml }
function myd { cd $myd }
function mu { cd $mu }
function o { cd $o }
function oh { cd $oh }
function ph { cd $ph }
function pl { cd $pl }
function plu { cd $plu }
function pr { cd $pr }
function pw { pwd}
function tm { cd $tm }
function gh { cd $gh }
