#!/bin/bash
for einh in einheit0* ; do
  echo $einh
  cd $einh
  cp $einh.tex ${einh}_handout.tex
  sed -i 's/\(notes=hide\)/\1,handout/' ${einh}_handout.tex
  xelatex  ${einh}_handout.tex
  xelatex  ${einh}_handout.tex
  cd ..
done
