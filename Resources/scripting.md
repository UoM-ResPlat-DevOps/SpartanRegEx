For Loops
=========

The following are simple examples of a "for" loop.

Note the use of command substitution by using $(command); sometimes you will find the use of backticks instead (e.g., for i in * ; do mv $i `echo $i | tr "A-Z" "a-z"` ; done); this is not recommended.

for item in ./*.jpeg ; do convert "$item" "${item%.*}.png" ; done
for item in ./*; do convert "$item" -define jpeg:extent=512kb "${item%.*}.jpg" ; done

Loops can be applied in a step-wise manner.

$ for filename in *.fastq
> do
> head -n 2 ${filename} >> seq_info.txt
> done

Basename in a loop
==================

Basename is removing a uniform part of a name from a list of files. 
In this case remove the .fastq extension and echo the output.

$ for filename in *.fastq
> do
> name=$(basename ${filename} .fastq)
> echo ${name}
> done

Shell Issues Illustrated by Loops
=================================

What would happen if backticks were used instead of $() for shell substitution? What if someone mistook the backticks for single quotes?

for item in ./* ; do mv $item $(echo $item | tr "A-Z" "a-z") ; done

What's wrong with spaces in filenames?

touch "This is a long file name"
for item in $(ls ./*); do echo ${item}; done

Loops and Conditionals
======================

A few simple examples of loops with conditional tests.

x=1; while [ $x -le 5 ]; do echo "While-do count up $x"; x=$(( $x + 1 )); done
x=5; until [ $x -le 0 ]; do echo "Until-do count down $x"; x=$(( $x - 1 )); done
x=1; until [ $x = 6 ]; do echo "Until-do count up $x"; x=$(( $x + 1 )); done

Conditional values include the following:

| Value                           |Explanation                                        |
|---------------------------------|---------------------------------------------------|
| [ -e filepath ]                 | Returns true if file exists.                      |
| [$var lt value ] [ gt ] [ eq ]  | Returns true if less than, greater than or equal. |
| [ -f filepath ]                 | Returns true if filepath is actually a file.      |
| [ -x filepath ]                 | Returns true if file exists and executable.       |
| [ expr1 -a expr2 ]              | Returns true if both expressions are  true.       |
| [ expr1 -o expr2 ]              | Returns true if either expression is true.        | 

While-Read
==========

A while loop that reads in data from a file and runs a command on that data.

This is what we used to originally set quotas on home and project directories.

The 'read' command reads one line from standard input or a specified file.

while read line; do sleep 5; ./setquota.sh $line; done < quotalist.txt

When searching for lines that contain a particular sequence in a file (e.g., from grep), reading those lines for processing can be accomplished with the something like the following:

grep sequence datafile.dat | while read -r line ; do   
    echo "Processing $line"   
    # Processing code #   
done   

Shell Expansions
================

Curly braces are used to encapsulate statements or variables with {} or ${}

var		# Set a variable
$var		# Invoke the variable
${var}bar	# Invoke the variable, append "bar".

Example of determining jobs running on a set of nodes.

for host in "spartan-rc"{001..10}; do squeue -w $host; done

Branches 
========

A set of conditions can be expressed through an if/then/fi branching structure. 

A single test with an alternative set of commands is expressed if/then/else/fi. Finally, a switch-like structure can be constructed through a series of elif statements in a if/then/elif/elif/.../else/fi structure. 

i.e.,

1. if..then..fi statement (Simple) 
2. if..then..else..fi statement (Optional) 
3. if..elif..else..fi statement (Ladder) 
4. if..then..else..if..then..fi..fi..(Nested) 

An example is available at: `/usr/local/common/HPCshells/filetest.sh

A variant on the conditional to escape the problems associated with deeply nested if-then-else branch statements is the `case` statement. The first match executes the listed commands. Examples at: `/usr/local/common/HPCshells/case.sh`

Break, Continue, Select
=======================

Conditional branches can also be interrupted and resumed using the 'break' and 'continue' statements. The break command terminates the loop (breaks out of it), while continue causes a jump to the next iteration (repetition) of the loop, skipping all the remaining commands in that particular loop cycle. 

Examples at: `/usr/local/common/HPCshells/break.sh` and `/usr/local/common/HPCshells/continue.sh`

The select command with conditionals can be used to create simple menus for users which prompts them for their input. There is an example at: `/usr/local/common/HPCshells/select.sh`

Functions
=========

Functions create subroutines or subscripts within a shell script, which can have local variables and return parameters. Functions may not be empty. 

See the example at: `/usr/local/common/HPCshells/hellofunction.sh` and a generic structure at: `/usr/local/common/HPCshells/functiongeneral.sh`

