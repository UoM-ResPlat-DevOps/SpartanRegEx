===================================
PHP: Hypertext Preprocessor RegExes
===================================

PHP is a general purpose programming language often used in database-driven websites. It has two types of regular expressions, one for POSIX-extended, and Perl-compatible. The Perl-compatible regexes must be enclosed in delimiters, but are more powerful. 

Note that the POSIX methods are removed from php7+

POSIX-type Metacharacters
=========================

Quantifiers
-----------

.	Matches any single character
+	Matches any string containing at least one of the preceeding expression.
*	Matches any string containing zero or more of the preceeding expression.
?	Matches any string containing zero or one of the preceeding expression.
{N}	Matches any string containing a sequence of N of the preceeding expression.
{2,3}	Matches any string containing a sequence of two or three of the preceeding expression.
{2, }	Matches any string containing a sequence of at least two of the preceeding expression.
$	Matches any string with the preceeding expression at the end.
^	Matches any string with the following expresssion at the beginning.

Sets
----

[0-9]	Matches any integer 0 through 9.
[a-z]	Matches any lower-case character from a to z.
[A-Z]	Matches any upper-case character from A to Z.
[a-Z]	Matches any character from lowercase a to uppercase Z.


Range Statements
----------------

[[:alpha:]]	Matches any alphabetic characters.
[[:digit:]]	Matches any digits.
[[:alnum:]]	Matches any alphanumeric characters.
[[:space:]]	Matches any space.


Set and Quantifier Examples
---------------------------

p.p		Matches any string containing p, followed by any character, in turn followed by another p.
^.{5}$		Matches any string containing five characters exactly.
<b>(.*)</b>	Matches any string enclosed within <b> and </b>.


POSIX Methods
=============

Search
------
ereg()	The ereg() function searches a string specified by string for a string specified by pattern, returning true if the pattern is found, and false otherwise.

Search, Case Insensitive
eregi()
The eregi() function searches throughout a string specified by pattern for a string specified by string. The search is not case sensitive.

Replace
ereg_replace()
The ereg_replace() function searches for string specified by pattern and replaces pattern with replacement if found.

Replace, insensitive
eregi_replace()
The eregi_replace() function operates exactly like ereg_replace(), except that the search for pattern in string is not case sensitive.

Split
split()
The split() function will divide a string into various elements, the boundaries of each element based on the occurrence of pattern in string.

Split, insensitive
spliti()
The spliti() function operates exactly in the same manner as its sibling split(), except that it is not case sensitive.


