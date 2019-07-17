Introduction to awk
===================

As a data driven programming language `awk` is particularly good at understanding and manipulating text structured by fields - such as tables of rows and columns. 

The organisation of an AWK program follows the form: pattern { action }. This can be structured with BEGIN and END which specify actions to be taken before any lines are read, and after the last line is read. i.e.,

BEGIN {awk commands} /pattern/ {awk commands} END {awk commands}

A collection of `awk` one-liners are at: `http://www.pement.org/awk/awk1line.txt`.

The file test-high-gc-1.fastq is from Washington State University, Data Progamming Course.

There are many variants of awk, but the most common is GNU awk (often called 'gawk'). This resource is written with GNU awk assumed. To check that you have this, run the version command.

`awk --version`

Internal Field Separator
========================

The easiest and certainly one of the most common uses of awk is create reports from structured data; columns and rows are referenced by number and by default the space acts as the separator.

By default awk uses a space as the internal field separator. To use a comma invoke with `-F` e.g. `awk -F"," '{print $3}' quakes.csv`

Adding new separators to the standard output print of multiple fields is recommended - otherwise AWK will print without any separators. For example; 

`awk -F"," '{print $1 " : " $3}' quakes.csv`
`awk -F"," '{print $1 "\t" $3}' quakes.csv`

Other shell commands can be piped through awk

awk: `awk -F"," '{print $1 " : " $3 | "sort"}' quakes.csv | less`

Selecting Content
=================

A matched pattern in a line can be printed:

`awk '/ATVK/ {print $0}' gattaca.txt`
`awk '/ATVK/ {print $2}' gattaca.txt`

The usual metacharacters can be used.

`awk '/^ATVK/' gattaca.txt`
`awk '/QLQA$/' gattaca.txt`

The inbuilt `length` command can be used to print lines of a particular length. Note the double equals syntax.

`awk 'length($0) == 28' gattaca.txt`

# `awk '{ if (((length($1) == 10 ) && length($2) == 10) && (length($3) == 10 || length($3) == 5)) && length($4) == 10)) && length($5) == 10)) print }' gattaca.txt`

Whereas row numbers are specified by $num, 'NR' specifies the row number. More examples:

`awk -F"," 'END {print NR}' quakes.csv`    
`awk -F"," 'NR>1{print $3 "," $2 "," $1}' quakes.csv`   
`awk -F"," '(NR <2) || (NR!=6) && (NR<9)' quakes.csv > selection.txt`   

Inserting Text
==============

The printf can add text to a file.

`awk 'BEGIN{printf "The nucleotide data is in the second line following, the sixth line, etc.\n"}{print}' test-high-gc-1.fastq | less`

Variables
=========

Variable assignment in awk is done with the -v option.

`awk -v filename="test-high-gc-1.fasq" -v linecount="4000" 'BEGIN{print filename, linecount}'`

The shell function `eval` can be used for output e.g.,

Integrating shell commans with awk for output.

`eval $(echo 2 3 | awk '{ result=$1+$2; printf "result='\'%s\''\n", result }') 
`echo "$result"`

Any global variables and their values being used by awk can be accessed by the --dump-variables command, with a default filename of awkvars.out.

`awk --dump-variables ''`
`less awkvars.out`

The ARGC variable can hold the number arguments provided at the command-line, but keep in mind that indicies begin at zero. e.g.,

`awk 'BEGIN {print "Arguments =", ARGC}' TGGA GTCA GGTA TCAC`

To check this, use ARGV that can display the array of the arguments.

'awk 'BEGIN {for (i = 0; i < ARGC - 1; ++i) { printf "ARGV[%d] = %s\n", i, ARGV[i]  } }' TGGA GTCA GGTA TCAC`

Environment variables can be invoked with the ENVIRON array.

`awk 'BEGIN { print ENVIRON["USER", "HOME"] }'`
`awk 'BEGIN { print ENVIRON["HOME"] }'`

Arithmetic Functions
===================-

Other useful awk one-liners make use of the arithmetic functions of this programming language:

Count the number of reads in a fastq file (read number of lines, divide by four).

`awk 'END{print NR/4}' test-high-gc-1.fastq`

Count the number of times a pattern occurs in a file...
`awk '/GGCG/{++cnt} END {print "Count = ", cnt}' test-high-gc-1.fastq`

... with metacharacters
awk '/^GGCG/{++cnt} END {print "Count = ", cnt}' test-high-gc-1.fastq


Print the total number of fields in $file.    
`awk '{totalf = totalf + NF }; END {print totalf}' $file`

Print the sum of the fields (columns) of every line (row); NF is number of field.    
`awk '{sum=0; for (i=1; i<=NF; i++) sum=sum+$i; print sum}' $file`	

Loops and Calculation
=====================

(From Supercomputing with Linux, Lev Lafayette, VPAC, 2015)

awk '$7=="A" { ++count } END { print count }' simple1.txt
awk '{sum+=$7} END {print sum}' simple2.txt
awk '{ for(i=1; i<=NF;i++) j+=$i; print j; j=0 }' simple3.txt

