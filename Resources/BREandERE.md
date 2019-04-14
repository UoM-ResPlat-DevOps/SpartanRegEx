
Basic Regular Expressions (BRE) are the earliest POSIX standard. The grep command uses these by default.

With BRE the following metacharacters must be preceeded by an escape \ to enable their special meaning. With ERE this is not the case.

?  +  {  } |  (  ) 

Try the following:

grep '^Geoff|^Jeff' /usr/share/dict/words

OK, that does not work, right? Now escape the characters and alternation will apply.

grep '^Geoff\|^Jeff' /usr/share/dict/words

Extended grep does not need the escape sequence (sometimes applied as egrep; it does the same thing)

grep -E '^Geoff|^Jeff' /usr/share/dict/words

Parentheses are used to group a character set.

grep '\(^Geoff\|^Jeff\)\(rey$\|ery$\)' /usr/share/dict/words

grep -E '(^Geoff|^Jeff)(rey$|ery$)' /usr/share/dict/words

The question mark makes the preceding character optional in the regex.

grep -w '^colou\?r' /usr/share/dict/words
grep -wE '^colou?r' /usr/share/dict/words

The '*' and '?' are well-known metacharacters for 'any' (including none) or 'one optional' character respectively. In regex the character '+' represents 'one or more'. Note that the '?' metacharacter has a different meaning to the shell metacharacter '?'.


Search for all files in a directory that start with a website URL
grep -Ei '^https?' * | less

A search in gattaca.txt using BRE and ERE.

grep 'KK\+' gattaca.txt
grep -E 'KK+' gattaca.txt

Regular expressions can also backreference, that is match a previous sub-expression with the values \1, \2, etc. The following is a useful example where one can search for any word (case-insensitive, line-numbered) and see if that word is repeated, catching common typing errors such as 'The the'. 

grep -inw '\([a-z]\+\) \+\1' files

grep -Einw '([a-z]+) +\1' files

grep -Ein '\<([a-z]+) +\1\>' files


