===================================
PHP: Hypertext Preprocessor RegExes
===================================

PHP is a general purpose programming language often used in database-driven websites. It has two types of regular expressions, one for POSIX-extended, and Perl-compatible. The Perl-compatible regexes must be enclosed in delimiters, but are more powerful. 

Note that the POSIX methods are deprecated from php5.3+ and removed from php7+

String Functions
================

PHP has a number of string functions some of which can mimic some of the basic stream editing functions. Note that these are literal and do not have special metacharacters, apart from usual PHP syntax rules.

For example:

str_replace(find,replace,string,count)
Replaces characters with specified characters. Count is optional for the number of replacements.
Example; simple.php

str_ireplace() acts the same but is case-insensitive in the search.

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

[0-9]	Matches any digit 0 through 9.
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
------------------------
eregi()
The eregi() function searches throughout a string specified by pattern for a string specified by string. The search is not case sensitive.

Replace
-------
ereg_replace()
The ereg_replace() function searches for string specified by pattern and replaces pattern with replacement if found.

Replace, insensitive
--------------------
eregi_replace()
The eregi_replace() function operates exactly like ereg_replace(), except that the search for pattern in string is not case sensitive.

Split
-----
split()
The split() function will divide a string into various elements, the boundaries of each element based on the occurrence of pattern in string.

Split, insensitive
------------------
spliti()
The spliti() function operates exactly in the same manner as its sibling split(), except that it is not case sensitive.

For a simple example, see posix.php


Perl-Compatible Regular Expressions
===================================

You should use these now.

The POSIX-style syntax can be used almost interchangeably with PCRE regular expression functions, including any of the quantifiers listed above.

PCRE Metacharacters and Modifiers
=================================

Metacharacters
--------------

Metacharacter	Meaning
.		A single character
\s		A whitespace character (space, tab, newline)
\S            	A non-whitespace character
\d            	Any digit (0-9)
\D             	Any non-digit
\w             	Any "word" character (a-z, A-Z, 0-9, _)
\W             	Any non-word character

Sets
----

[aeiou]        Matches a single character in the set
[^aeiou]       Matches a single character not in the set
(foo|bar|baz)  "Or" statement; match any alternative.

Modifiers
---------
Modifier	Description
i 		Case insensitive match
m 		If the string has newline or carriage return characters, the ^ and $ operators 	match against a newline boundary, instead of a string boundary
o 		Evaluates the expression only once
s 		Use . to match a newline character
x 		Use white space in the expression
g 		Globally find all matches
cg 		Continue search even after a global match fails


PCRE Methods
============

Match
-----
preg_match()		
Searches for a pattern, returning true if pattern exists, and false otherwise.

Match All
---------
preg_match_all()	
Matches all occurrences of pattern in string.

Replace
-------
preg_replace()		
Searches for a pattern and replaces pattern with replacement if found. Unlike ereg_replace(), regular expressions can be used in the pattern and replacement parameters.


Split
-----
preg_split()

Divides a string into various elements, the boundaries based on the pattern. Unlike split(), regular expressions are accepted as pattern parameters.

Grep
----
preg_grep()
Searches all elements of input_array, returnings all elements matching the RegEx.

Quote
------
preg_quote()
Quote regular expression characters


For a simple example, see pcre.php
