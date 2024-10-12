pdfs(){
    files=$(ls $HOME/*.pdf)
    new_file1=$(ls $HOME/*.pdf|head -1)
    
    new_file2=$(basename $new_file1)
    new_file=${new_file2::-5}

    privat=$HOME/Documents/privat
    # united=$privat/united.pdf
    # united2=$HOME/united2.pdf    
    
    # pdfunite $files $united

    # rm $HOME/*.pdf
    
    # ps2pdf -dPDFSETTINGS=/ebook $united $united2
    
    
    # mv $united2 $united && mv $united $privat/$new_file.pdf
    # open $privat/$new_file.pdf
    ls -lh $privat/$new_file.pdf

}
pdfs


mvfile(){
    file=$(ls -t $HOME/downloads/* | head -1)
    if echo $file | grep -q Honorar ; then
        mv $file $HOME/documents/steuer/studienkreis
        return
    fi
    echo no file found

}
# mvfile