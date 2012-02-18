#!/bin/bash
sws=$1
dummy=$(basename $1)
basen=$(echo $dummy | cut -d'.' -f1)
tar xjf $1
perl -p0777e 's/({{{id=.*?\|).*?(}}})/$1\n$2/msg' sage_worksheet/worksheet.html | perl -p0777e 's/({{{id=.*?\|)[id={}\|0-9\n]*/$1\n}}}\n/msg' > $basen.txt
rm -r sage_worksheet
