#!/usr/bin/perl
$*=1;
open(INPUT,"<$ARGV[0]") or die;
@input_array=<INPUT>;
close(INPUT);
$input_scalar=join("",@input_array);
$input_scalar =~ s/\\begin{sage}( (?: (?!end{sage}). )*?>>.*?)\\end{sage}/\\begin{sagein}$1\\end{sagein}/gsx;
open(OUTPUT,">$ARGV[0]") or die;
print(OUTPUT $input_scalar);
close(OUTPUT);
