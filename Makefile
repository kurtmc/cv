file_no_ext=kurt_cv
cv_and_cover="Kurt McAlpine's CV and Cover Letter"
cv_only="Kurt McAlpine's CV only"
cover_only="Kurt McAlpines's cover letter only"

cv_and_cover:
	pdflatex $(file_no_ext).tex
	rm ./*.aux
	rm ./*.out
	rm ./*.log
	mv $(file_no_ext).pdf $(cv_and_cover).pdf

seperate_cv_coverletter:
	pdflatex $(file_no_ext).tex
	rm ./*.aux
	rm ./*.out
	rm ./*.log
	pdftk $(file_no_ext).pdf cat end-1 output temp.pdf
	pdftk temp.pdf cat end-2 output $(cv_only).pdf
	pdftk temp.pdf cat 1 output $(cover_only).pdf
	rm temp.pdf

clean:
	rm ./*.pdf
