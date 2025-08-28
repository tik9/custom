pdfs(){
    folder=$HOME/fol

    new_file=$(ls $HOME/*.pdf | head -1)
    full_length=$((${#new_file}-4))
    # full_length=$((23-4))
    files=$(ls $HOME/*.pdf | sort -n -k1.$full_length)
    
    basename_with_ext=$(basename $new_file)
    # basename_length=${#basename}
    new_file_base=${basename_with_ext::-4}
    echo $files $new_file_base $full_length
    
    united=$folder/united.pdf
    united2=$folder/united2.pdf    
    
    pdfunite $files $united

    # ls -lh $united

    # rm $HOME/*.pdf
    
    ps2pdf -dPDFSETTINGS=/ebook $united $united2
    # ls -lh $united2
    
    mv $united2 $united && mv $united $folder/$new_file_base.pdf
    # open $folder/$new_file_base.pdf

    # ls -lh $folder/$new_file_base.pdf

}
pdfs $@


mvfile(){
    file=$(ls -t $HOME/downloads/* | head -1)
    if echo $file | grep -q Honorar ; then
        mv $file $HOME/documents/steuer/studienkreis
        return
    fi
    echo no file found

}
# mvfile