
# fswatch -o . | xargs -I{} ./files.sh

# bash --version
down="$HOME/downloads"

mv_files(){
    
    file=$(ls -t $down/* | head -1)

    # if [[ $file == *.zip ]]; then
    if [ ${file: -4} == .zip ]; then
        dir_new=$down/nachhilfe/lukas/$(date '+%d%m')
        # echo new $dir_new
        mkdir $dir_new
        unzip -o $file -d $dir_new
        rm $file
    elif echo $file|grep -q Honorar ; then
        # echo stkr
        mv $file $down/steuer/studienkreis
    elif echo $file|grep -q Gutschrift; then
        mv $file $down/steuer/heytim
        # echo heytim
    fi
}

mv_files