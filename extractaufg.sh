#!/bin/bash
spath=`grep -RIi $1 notebooks.sagenb/home/*/*/*.pickle | sed -e 's/worksheet_conf.pickle.*/worksheet.html/g'`
perl -p0777e 's/({{{id=.*?\|).*?(}}})/$1\n$2/msg' $spath | perl -p0777e 's/({{{id=.*?\|)[id={}\|0-9\n]*/$1\n}}}\n/msg' > $1.txt

