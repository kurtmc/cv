# This script takes a pdf as input and serpates it into 2 pdfs The first pdf is
# the original pdf excluding the last page and the second pdf is the last page
# The first argument is the name of the original pdf, then next argument is the
# name of the pdf excluding the last page and the final argument is the name of
# the last page

pdfseparate "$1" temp_%d
LAST=$(ls temp_[0-9] | awk -F "_" '
function max(x) {
	i=0;
	for (val in x) {
		if (i<=x[val]) {
			i=x[val];
		}
	}
	return i;
}

{
	a[$2]=$2;
	next
}

END {
	maximum=max(a);
	print maximum
}')

pdfunite $(ls temp_[1-$((LAST - 1))]) "$2"
cp temp_$LAST "$3"

rm temp_[0-9]
