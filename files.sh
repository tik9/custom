
    file=$(ls -t $HOME/downloads/* | head -1)

    if echo $file | grep -q Honorar ; then
        mv $file $HOME/documents/steuer/studienkreis
    else echo no file found
    fi