
# linuxify() {
    temppath="$(echo -E $1 | sed -E 's/([A-Z]):/\/mnt\/\L\1/g')"  # C: -> /mnt/c, E: -> /mnt/e
    temppath="$(echo -E $temppath | sed 's/\\/\//g')"  # backslash -> forward slash
    echo $temppath
# }

dirs=$HOME/.oh-my-zsh/custom/*

# ls $dirs

for dir in $dirs
do
    echo dir $dir
    for file in "$dir"/*
    do
        if [[ -f $file ]]
        then
        echo file $file
            # dos2unix "$file"
        fi
    done
done