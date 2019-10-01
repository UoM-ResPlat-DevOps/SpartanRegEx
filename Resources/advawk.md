Advanced Awk: From Commands to Programming
==========================================

The basicawk.md file contains the overall programming structure, the internal field separator, selection of content, and text insertion. More advanced functions include variable assignment, arithmetic functions, loops and calculations, conditional statements, and functions.

Variables
=========

Variable assignment in awk is done with the -v option.

`awk -v filename="test-high-gc-1.fasq" -v linecount="4000" 'BEGIN{print filename, linecount}'`

The shell function `eval` can be used for output e.g.,

Integrating shell commands with awk for output.

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

Operators
=========

Arithmetic Operators
--------------------

Addition, Subtraction, Multiplication, Division, Modula, Pre- and Post- Incre(De
cre)ment:
`awk 'BEGIN { realx = 1.5; realy = 2.5; print "(realx + realy) = ", (realx + realy) }'`
`awk 'BEGIN { realx = 1.5; realy = 2.5; print "(realx - realy) = ", (realx - realy) }'`
`awk 'BEGIN { realx = 1.5; realy = 2.5; print "(realx * realy) = ", (realx * realy) }'`
`awk 'BEGIN { realx = 1.5; realy = 2.5; print "(realx / realy) = ", (realx / realy) }'`
`awk 'BEGIN { realx = 1.5; realy = 2.5; print "(realx % realy) = ", (realx % realy) }'`
`awk 'BEGIN { intx = 1; inty = --intx; printf "intx = %d, inty = %d\n", intx, inty }'`
`awk 'BEGIN { intx = 1; inty = intx--; printf "intx = %d, inty = %d\n", intx, inty }'`
`awk 'BEGIN { intx = 1; inty = ++intx; printf "intx = %d, inty = %d\n", intx, inty }'`

Logical Operators
-----------------

Logical "and" is represented by `&&`.
Logical "or" is represented by `||`
Logical "not" is represented by `!`



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

The following are examples of the most arithmentic operators used by awk:

Loops and Calculation
=====================

(From Supercomputing with Linux, Lev Lafayette, VPAC, 2015)

awk '$7=="A" { ++count } END { print count }' simple1.txt
awk '{sum+=$7} END {print sum}' simple2.txt
awk '{ for(i=1; i<=NF;i++) j+=$i; print j; j=0 }' simple3.txt

Conditional Statements
======================

The awk language has a well-known control statement, if-then-else. If the condition is true, then-body is executed; otherwise, else-body is executed.

awk -v oddball=7 'BEGIN { if (oddball % 2 == 0) print "oddball is even"; else  print "oddball is odd" }'



