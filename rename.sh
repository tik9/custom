# echo $0

for f in $HOME/*.webm $HOME/*.mp4; do
    # $new= $f|sed -i 's/ //g'
    rename -v 's/ //g'  $f
    # rename -n "s/$HOME//" $f 
    rename -v 's|^(.{45}).*\.(.*)$|$1.$2|' $f
    # echo $f
done
