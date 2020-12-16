
# code
function ca { code $ca }
function cf { code $cf}
function dat { code $dat }
function gim { code $gim }

# cp
function cpcf { cp $zsh_cu/common_functions.zsh $ph/common_functions.ps1 }
function cpg { cp $plu/git/git.plugin.zsh $ph\git.ps1 }
function cpr { cp $zsh_cu/Readme.md $ph }
function cppi { cp $zsh_cu/pip.zsh $ph/pip.ps1 }

function cplw {
    dat=$1
    neu=${dat:0:-4}
    echo neu $neu
    cp $zsh_cu/$1 $prof_home/$neu.ps1
}
# ls
function l { ls}
function ll { ls |more }

#set location
function ... { cd ..\.. }
function .. { cd .. }
function cs { cd $cs }
function cv { cd $cv }
function dok { cd $hw/doks }
function fs { cd $fs }
function gt { cd $gt }
function ho { cd $ho }
function hw { cd $hw }
function lt { cd $lt }
function ml { cd $ml }
function myd { cd $myd }
function mu { cd $mu }
function o { cd $zsh_cu }
function oh { cd $oh }
function ph { cd $ph }
function pl { cd $pl }
function plu { cd $plu }
function pr { cd $pr }
function pw { pwd}
function tm { cd $tm }