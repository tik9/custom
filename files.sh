
pdfs(){
    united_pdf=united.pdf
    privat=$HOME/Documents/privat
    united=$HOME/$united_pdf
    united2=$HOME/united2.pdf
    files=$(ls $HOME/*.pdf)
    
    pdfunite $files $united
    
    # ls -lh $united
    
    ps2pdf -dPDFSETTINGS=/ebook $united $united2
    
    # ls -lh $united2
    
    mv $united2 $united && mv $united $privat
    
    # ls -lh $privat/$united_pdf

    rm $HOME/*.pdf
}
pdfs


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