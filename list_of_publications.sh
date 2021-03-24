rm list_of_publications.md

echo "# Preprints" > list_of_publications.md && \
pandoc -s --citeproc -t gfm preprints.md | sed 's/<p>//g' | sed 's/<\/p>//g' | sed 's/Nederbragt, A. J./**Nederbragt, A. J.**/g' >> list_of_publications.md

echo "# Peer-reviewed publications"
echo "# Peer-reviewed publications" >> list_of_publications.md && \
pandoc -s --citeproc -t gfm peer-reviewed.md | sed 's/<p>//g' | sed 's/<\/p>//g' | sed 's/Nederbragt, A. J./**Nederbragt, A. J.**/g' | sed 's/Nederbragt, L./**Nederbragt, L.**/g' >> list_of_publications.md

echo "# Conference contributions"
echo "# Conference Contributions" >> list_of_publications.md && \
pandoc -s --citeproc -t gfm conference_contributions.md | sed 's/<p>//g' | sed 's/<\/p>//g' | sed 's/Nederbragt, A. J./**Nederbragt, A. J.**/g' >> list_of_publications.md

echo "# Book chapters"
echo "# Book chapters" >> list_of_publications.md && \
pandoc -s --citeproc -t gfm book-chapters.md | sed 's/<p>//g' | sed 's/<\/p>//g' | sed 's/Nederbragt, A. J./**Nederbragt, A. J.**/g' >> list_of_publications.md

echo "# Thesis"
echo "# Thesis" >> list_of_publications.md && \
pandoc -s --citeproc -t gfm thesis.md | sed 's/<p>//g' | sed 's/<\/p>//g' | sed 's/Nederbragt, A. J./**Nederbragt, A. J.**/g' >> list_of_publications.md

echo "# Software publications"
echo "# Software publications" >> list_of_publications.md && \
pandoc -s --citeproc -t gfm software.md | sed 's/<p>//g' | sed 's/<\/p>//g' | sed 's/Nederbragt, A. J/**Nederbragt, A. J**/g' >> list_of_publications.md

echo "# Published lesson materials"
echo "# Published lesson materials" >> list_of_publications.md && \
pandoc -s --citeproc -t gfm lesson-materials.md | sed 's/<p>//g' | sed 's/<\/p>//g' | sed 's/Nederbragt, L./**Nederbragt, L.**/g' >> list_of_publications.md

## hack to fix <div> <\div> tags

mv list_of_publications.md list_of_publications.md.bak
cat list_of_publications.md.bak | grep -v '<div' | grep -v '</div>' | grep -v 'line-spacing' > list_of_publications.md

echo "# Creating PDF"
# added workaround for "Argument of \paragraph has an extra }." error
# as per https://stackoverflow.com/questions/42916124/not-able-to-use-titlesec-with-markdown-and-pandoc
pandoc --variable subparagraph -H format.sty -V fontsize=12pt -o list_of_publications.pdf --citeproc list_of_publications.md && open list_of_publications.pdf
