#!/bin/bash
#sed -i  's/\(includegraphics.*\){\(.*\)$/\1{figures\/\2/g' $1.tex
#sed -i 's/begin{mupad}/begin{sage}/g' ${1}.tex
#sed -i 's/end{mupad}/end{sage}/g' ${1}.tex
#sed -i 's/end{Aufgabe}/end{aufg}/g' ${1}.tex
#sed -i 's/begin{Aufgabe}/begin{aufg}/g' ${1}.tex
sed -i 's/end{sage}/end{sageout}/g' ${1}.tex
sed -i 's/begin{sage}/begin{sageout}/g' ${1}.tex
#sed -i 's/end{sagein}/end{sagecommandline}/g' ${1}.tex
#sed -i 's/begin{sagein}/begin{sagecommandline}/g' ${1}.tex
