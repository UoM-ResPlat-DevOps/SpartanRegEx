Basic Regular Expressions
=========================

Basic Regular Expressions (BRE) are the earliest POSIX standard. The grep command uses these by default.

With BRE the following metacharacters must be preceeded by an escape \ to enable their special meaning.

?  +  {  } |  (  ) 

Try the following:

grep '^Geoff|^Jeff' /usr/share/dict/words

That should not give the expected result. 

Now escape the characters and alternation will apply.

grep '^Geoff\|^Jeff' /usr/share/dict/words

Extended Regular Expressions
============================

Extended grep does not need the escape sequence. This is sometimes applied as egrep; it does the same thing in recent versions of the bash shell.

grep -E '^Geoff|^Jeff' /usr/share/dict/words

Parentheses are used to group a character set.

grep '\(^Geoff\|^Jeff\)\(rey$\|ery$\)' /usr/share/dict/words

grep -E '(^Geoff|^Jeff)(rey$|ery$)' /usr/share/dict/words

The question mark makes the preceding character optional in the regex.

grep -w '^colou\?r' /usr/share/dict/words
grep -wE '^colou?r' /usr/share/dict/words

The '*' and '?' are well-known metacharacters for 'any' (including none) or 'one optional' character respectively. In regex the character '+' represents 'one or more'. Note that the '?' metacharacter has a different meaning in regular expressions to the shell metacharacter '?'.

Examples
========

Search for all files in a directory that start with a website URL
grep -Ei '^https?' * | less

A search in gattaca.txt using BRE and ERE.

grep 'KK\+' gattaca.txt
grep -E 'KK+' gattaca.txt


BRE, ERE, and sed
=================

The sed utility supports *most* basic regular expressions. In addition the \n sequence in a regular expression matches the newline character and \t for tabs.

To invoke extended regular expressions there is an undocumented feature in sed for Linux which uses -E, -r, or --regexp-extended with the command.

Consider the results of the following:

sed 's/QQLQ?//' gattaca.txt

and compare to

sed -E 's/QQLQ?//' gattaca.txt

Backreferences
=============

Regular expressions can also backreference, that is match a previous sub-expression with the values \1, \2, etc. The following is a useful example where one can search for any word (case-insensitive, line-numbered) and see if that word is repeated, catching common typing errors such as 'The the'. 

grep -inw '\([a-z]\+\) \+\1' files

grep -Einw '([a-z]+) +\1' files

grep -Ein '\<([a-z]+) +\1\>' files

An example to append the string "EXTRA TEXT" to each line.

sed -e 's/\(.*\)/\1EXTRA TEXT/'


The awk programming language and ERE
====================================

The awk language uses the ERE engine to process regular expression patterns.
