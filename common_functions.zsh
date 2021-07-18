
# cp
function cpc { cp $o/common_functions.zsh $ph/common_functions.ps1 }
function cpg { cp $o/plugins/git/git.plugin.zsh $ph/git.ps1 }

# node
function nd { npm run dev }
function nl { npm ls }
function ng { npm ls -g }
function nofu { npm config set fund false --global }


#set location
function ... { cd ../.. }
function .. { cd .. }
function be { cd $be }
function cv { cd $cv }
function cy { cd $cy }
function fb { cd $fb }
function gt { cd $gt }
function ho { cd $ho }
function o { cd $o }
function ph { cd $ph }


function dn { echo $dn }
function ipf { echo $ipf }
function ll { ls | more }
function pw { pwd}
function ws { more $ws}
