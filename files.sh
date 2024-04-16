
pdfs(){
    united_pdf=united.pdf
    privat=$HOME/Documents/privat
    united=$HOME/$united_pdf
    united2=$HOME/united2.pdf
    files=$(ls $HOME/*.pdf)
    
    pdfunite $files $united && 
    # rm $HOME/*.pdf
    
    # ls -lh $united
    
    ps2pdf -dPDFSETTINGS=/ebook $united $united2
    
    # ls -lh $united2
    
    mv $united2 $united && mv $united $privat
    cd $privat
    ls -lh $privat/$united_pdf
    open $privat/$united_pdf

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