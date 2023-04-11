
# fswatch -o . | xargs -I{} ./files.sh

# bash --version
doc="$HOME/documents"
down="$HOME/downloads"

mv_files(){
    
    file=$(ls -t $down/* | head -1)

    # if [ ${file: -5} == .jpeg ]; then
        # dir_new=$down/nachhilfe/name/$(date '+%d%m')
        # mkdir -p $dir_new
        # mv $file $dir_new

    # elif [[ $file == *.zip ]]; then
    if [ ${file: -4} == .zip ]; then
        dir_new=$down/nachhilfe/lukas/$(date '+%d%m')
        mkdir -p $dir_new
        unzip -o "$file" -d $dir_new
        rm "$file"
    elif echo $file | grep -q Honorar ; then
        mv $file $doc/steuer/studienkreis
    elif echo $file | grep -q Gutschrift; then
        mv $file $doc/steuer/heytim
    else echo no file found
    fi
}

mv_files