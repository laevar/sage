#!/bin/bash
#sed -i  's/\(includegraphics.*\){\(.*\)$/\1{figures\/\2/g' $1/$1.tex
sed -i 's/begin{mupad}/begin{sage}/g' ${1}/${1}.tex
sed -i 's/end{mupad}/end{sage}/g' ${1}/${1}.tex

