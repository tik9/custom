
pdfs(){
    privat=$HOME/Documents/privat
    output=$HOME/united.pdf
    output2=$HOME/united2.pdf
    file=$(ls $HOME/*.pdf)
    # echo $file
    pdfunite $file $output
    # ls $HOME
    ps2pdf -dPDFSETTINGS=/ebook $output $output2
    # rm $output
    # mv $output2 $output
    mv $output $privat
    ls -l $privat
}
# pdfs


mvfile(){
    file=$(ls -t $HOME/downloads/* | head -1)

    for file in $HOME/downloads/*.pdf ; do
    if echo $file | grep -q Honorar ; then
        mv $file $HOME/documents/steuer/studienkreis
        return
    fi
    done
    echo no file found
}
# mvfile