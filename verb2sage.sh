perl -i -pe 's/verb\+(.*?)\+/isage{$1}/g' $1
sed -i 's/>> //g' $1
