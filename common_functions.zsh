
# cp
function cpc { cp $o/common_functions.zsh $ph/common_functions.ps1 }
function cpg { cp $o/plugins/git/git.plugin.zsh $ph/git.ps1 }

# node
function nd { npm run dev }
function nl { npm ls }
function ng { npm ls -g }
function nofu { npm config set fund false --global }


function vse { echo $(code --list-extensions)|tr ' ' '\n' > extensions.txt}

#set location
function ... { cd ..\.. }
function .. { cd .. }
function cv { cd $cv }
function cy { cd $cy }
function gt { cd $gt }
function hi { history }
function ho { cd $ho }
function hw { cd $hw }
function i {  $i }
function o { cd $o }
function ph { cd $ph }
function pw { pwd}
function rt { cd $rt}
function ws { more $ws}
