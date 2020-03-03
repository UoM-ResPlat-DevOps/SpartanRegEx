Introduction to awk
===================

As a data driven programming language `awk` is particularly good at understanding and manipulating text structured by fields - such as tables of rows and columns. 

The organisation of an AWK program follows the form: pattern { action }. This can be structured with BEGIN and END which specify actions to be taken before any lines are read, and after the last line is read. i.e.,

BEGIN {awk commands} /pattern/ {awk commands} END {awk commands}

A collection of `awk` one-liners are at: `http://www.pement.org/awk/awk1line.txt`.

The file test-high-gc-1.fastq is from Washington State University, Data Progamming Course.

There are many variants of awk, but the most common is GNU awk (often called 'gawk'). This resource is written with GNU awk assumed. To check that you have this, run the version command.

`awk --version`

Field Separators
================

The easiest and certainly one of the most common uses of awk is create reports from structured data; columns and rows are referenced by number and by default the space acts as the separator.

By default awk uses a space as the internal field separator. The specific field seperator is specificed with the -F option, using strong or weakquotes as desired, i.e., awk -F'FS', 'commands' filename, or  awk 'BEGIN{FS="FS";}'.

To use a comma invoke with `-F` e.g. `awk -F"," '{print $3}' quakes.csv`

Adding new separators to the standard output print of multiple fields is recommended - otherwise AWK will print without any separators. For example; 

`awk -F"," '{print $1 " : " $3}' quakes.csv`
`awk -F"," '{print $1 "\t" $3}' quakes.csv`

By default multiple fields are selected with a comma and the output is space delimited. The Output Field Separator can modify this.

`awk -F"," '{print $1,$3}' quakes.csv`
`awk -F"," 'BEGIN{OFS=",";} {print $1,$3}' quakes.csv`

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

Print and Printf
================

The print function will produce output in a simple format with the stings or numbers in a list, separated by commas. The output is in single spaces followed by a newline

The printf function allows control over the format, such as precision in numbers etc.

awk -F"," '{ if (FNR>1)  printf "%s,%s,%s,%2.15f,%s\n", $1, $2, $3, $4*1.1, $5; else printf "%s, %s, %s, %s, %s\n", $1, $2, $3, $4, $5}' climate_20048335.csv > climate_20048335_new.csv

Inserting Text
==============

The printf can add text to a file.

`awk 'BEGIN{printf "The nucleotide data is in the second line following, the sixth line, etc.\n"}{print}' test-high-gc-1.fastq | less`

