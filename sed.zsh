function ak {
	ssh $@ 'cat .ssh/authorized_keys'
}


function bew { # firma sprache
    #    rm $output
		job="$2"
		fa=$1
		fa_kurz=${fa:0:2}

       sed -i "/ags=\[/a \n" $cv/media/ags.js
    #    sed -i "/ags=\[/a {a:'$fa',\nj:'$job'}," $cv/media/ags.js
		# sed  -i 's/^fa=.*$/fa='$fa_kurz'/' $ca

        if [ -n $3 ]; then; sed -i "s/^sprache=.*$/sprache=$3/" $ca ; fi

        # cp $cv/anschreiben_$sprache.md $cv/anschreiben_$fa_kurz.md
        # code $cv/anschreiben_$fa_kurz.md
 }

function gh {
	sed 's/\(\s*url.*\)\(gith.*$\)/\1@'$1'\2/' .git/config
}

function ic {
	geraet=wlp2s0
	geraet=eth0
	declare -A ip_ar=( [o1]=3 [o2]=2 [o3]=3 [o4]=2)

	echo ${ip_ar[o1]}

	ipa=$(ip addr show $geraet)
	 echo $ipa | sed -n 's/\s\{4\}inet\s\([0-9]\{3\}\.[0-9]\{2\}\.[0-9]\{3\}\.[0-9]\{2\}\).*/\1/p'
	 #~ inet \(192\.168\.43\.[0-9]*\).*/\1/p
}

function pls {
# input=$( echo $1| tr -d '[:space:]')
input=$( echo $1| sed -e 's/ /_/g')
$input=$($input | tr '[:upper:]' '[:lower:]')
str="| [$1](https://github.com/tik9/pluralsight/blob/master/$input.md) | ok |"

echo $str
}

function plu_f {
	sed -i 's/.*plugins=(.*/plugins=(common-aliases debian git zsh-autosuggestions zsh-syntax-highlighting)/' ~/.zshrc
}


function visud { $us=git ; sed '$a'$us' ALL=(ALL) NOPASSWD:ALL' /etc/sudoers }

function wlans {
	iwlist wlan0 scan | $(sed -n 's/ESSID:"\(.*\)"/\1/p;s/Quality=\([0-9][0-9]\/[0-9][0-9]\).*/\1/p')
}
