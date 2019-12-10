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

The Free Software Foundation (FSF) through the GNU (GNU's Not UNIX) utilities extended the basic regular expressions to give additional characters special meaning (i.e., more metacharacters). GNU built on the POSIX tools so that BREs will provide ERE functionality when a backslash is invoked, whereas EREs require the backslash to suppress the metacharacter functionality. 

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
==============

Regular expressions can also backreference (which is technically beyond being a regular language), that is match a previous sub-expression with the values \1, \2, etc. The following is a useful example where one can search for any word (case-insensitive, line-numbered) and see if that word is repeated, catching common typing errors such as 'The the'. Note the multiple ways of doing this.

grep -inw '\([a-z]\+\) \+\1' file

grep -Einw '([a-z]+) +\1' file

grep -Ein '\<([a-z]+) +\1\>' file

Another similar example, matching repeat characters rather than words (hencem no -w).

grep '\([A-Z]\)\1' gattaca.txt

An example to append the string "EXTRA TEXT" to each line.

sed -e 's/\(.*\)/\1EXTRA TEXT/'

The awk programming language and ERE
====================================

Contemporary implementations of awk language uses the ERE engine to process regular expression patterns.

Note there are slight variations in different implementations of the awk programming language which can have significant effects.

For example, if an escape character precedes a character that is not a regular expression, most version of awk will ignore it. Others however, will treate the backslash as a little character and include it.

For example:

`awk '/QL\QA$/' gattaca.txt` will be treated like `awk '/QLQA$/' gattaca.txt` in most contemporary versions of awk. Some however will treat `awk '/QL\QA$/' gattaca.txt` and `awk '/QL\\QA$/' gattaca.txt` as equivalent.
