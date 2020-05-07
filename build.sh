function buildPDF() {
    book=${1%.tex}
    pdflatex $book.tex
    rm *.aux *.log *.toc
    mv $book.pdf ../pdf/
}


# Clear out the current output pdf folder
rm pdf/*

cd tex
  
for book in $(ls); do
    if [ ${book: -4} == ".tex" ]; then
        buildPDF $book
    fi
done

