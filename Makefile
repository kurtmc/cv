.PHONY: pdf spellcheck

pdf:
	pdflatex kurt_cv.tex  && mupdf kurt_cv.pdf
spellcheck:
	aspell --personal=./.aspell.en.pws --lang=en_GB --mode=tex check kurt_cv.tex
