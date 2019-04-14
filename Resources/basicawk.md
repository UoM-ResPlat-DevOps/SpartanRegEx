As a data driven programming language `awk` is particularly good at understanding and manipulating text structured by fields - such as tables of rows and columns. 

The organisation of an AWK program follows the form: pattern { action }. This is sometimes structured with BEGIN and END which specify actions to be taken before any lines are read, and after the last line is read. 

The easiest and certainly one of the most common uses of awk is create reports from structured data; columns and rows are referenced by number and by default the space acts as the separator.

A collection of `awk` one-liners are at: `http://www.pement.org/awk/awk1line.txt`.

By default awk uses a space as the internal field separator. To use a comma invoke with `-F` e.g. `awk -F"," '{print $3}' quakes.csv`

Adding new separators to the standard output print of multiple fields is recommended - otherwise AWK will print without any separators. For example; `awk -F"," '{print $1 " : " $3}' quakes.csv`

Other shell commands can be piped through awk: `awk -F"," '{print $1 " : " $3 | "sort"}' quakes.csv | less`

'NR' specified the row number. More examples:
`awk -F"," 'END {print NR}' quakes.csv`    
`awk -F"," 'NR>1{print $3 "," $2 "," $1}' quakes.csv`   
`awk -F"," '(NR <2) || (NR!=6) && (NR<9)' quakes.csv > selection.txt`   

Other useful awk one-liners make use of the arithmetic functions of this programming language:
* Print the total number of fields in $file.    
`awk '{totalf = totalf + NF }; END {print totalf}' $file`
* Print the sum of the fields (columns) of every line (row); NF is number of field.    
`awk '{sum=0; for (i=1; i<=NF; i++) sum=sum+$i; print sum}' $file`	

