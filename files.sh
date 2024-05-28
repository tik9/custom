
unzip(){
    downloads=$HOME/downloads
    cd $downloads
    find ./ -name \*.zip -exec unzip {} \
    rm -f *.zip
}

pdfs(){
    privat=$HOME/Documents/privat
    united_pdf=$privat/united.pdf
    united=$HOME/$united_pdf
    united2=$HOME/united2.pdf

    new_file=dienstaufsicht.pdf
    
    files=$(ls $HOME/*.pdf)
    
    pdfunite $files $united
    #  && 
    # rm $HOME/*.pdf
    
    # ls -lh $united
    
    ps2pdf -dPDFSETTINGS=/ebook $united $united2
    
    # ls -lh $united2
    
    mv $united2 $united && mv $united $privat
    cd $privat
    mv $united_pdf $privat/$new_file      
    open $privat/$new_file

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