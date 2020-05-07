function buildPDF() {
    # Cut ".tex" from the end of the file
    book=${1%.tex}
    # Create the pdf name without underscores
    echo $book
    echo $(echo $book | sed 's/_/ /g')
    pdf=$(echo $book | sed 's/_/ /g')
    # Create the pdf file, cleanup the mess, and move the pdf to the pdf dir
    pdflatex $book.tex
    rm *.aux *.log *.toc *.fls *.gz *.fdb_latexmk
    mv $book.pdf "../pdf/$pdf.pdf"
}

function renamePDF() {
    pdf=$(echo $1 | sed 's/_/ /g')
    return $pdf
}

# Clear out the current output pdf folder
rm pdf/*

cd tex

for book in $(ls); do
    if [ ${book: -4} == ".tex" ]; then
        buildPDF $book
    fi
done
