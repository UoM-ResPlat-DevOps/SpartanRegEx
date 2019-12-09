Basics of Perl
==============

Simple variables always begin with a dollar sign, and can hold a number or text.

Comments begin with # and continue for the rest of the line.

Variables can appear within a double-quoted string.

Perl special characters
========================

\t	tab character
\n 	newline character
\r	carriage return character
\s 	matches any “whitespace” character (space, tab, newline, etc)
\S	anything not \s
\w	[a-zA-Z0-9R] Useful as in \w+ to match a word.
\W	anything not \w , i.e., [ˆa-zA-Z0-9R]
\d	[0-9] , a digit
\D	anything not \d , i.e., ! [ˆ0-9]


Perl Metacharacters
===================

In Perl regular expressions, the following are metacharacters:

. [ { ( ) \ * + ? | ^ $

| Metacharacter	| Description								|
|---------------|-----------------------------------------------------------------------|
| ^		| Anchor for the start of a line.					|
| $		| Anchor for the end of a line.						|
| .		| Matches any one non-newline or non-null character			|
| ()		| Groups a sub-expression to a single element, matches $1, $2 etc	|
| +		| Matches preceeding element one or more times				|
| ?		| Matches zero or one times						|
| ?		| Matches the *, +, or {M,N}'d previous regexp as few times as possible |
| *		| Matches zero or more times						|
| {M, N}	| Minimum M and maximum N counts					|
| [..]		| Set of possible mataches						|
| [^..]		| Matches characters not in the brackets				|
| |		| Matches either, an "or" statement					|
| \b		| Matches a word boundary						|
| \B		| Matches where \b{} doesn't match					|
| \w		| Matches alphanumeric and underscore					|
| \W		| Matches non-alphanumeric						|
| \s		| Matches whitespace							|
| \S		| Matches non-whitespace						|
| \d		| Matches digits, equivalent to [0-9]					|
| ^		| Matches beginning of a line or string					|
| $		| Matches end of a line or string					|

See perl -w metaperl.pl

Word Boundaries
===============

The metacharacter \b is like an anchor, matching a zero-length boundary before the first character in a word, after the last character in a ord, or between two characters where one character is word and the other is not.

When seeking to match whole words, one should use \bword\b ; an old method was /(^|\W)word(\W|$)/), which is equivalent.

The position of the \b can alter the search term.

See perl -w radio.pl

Perl Matching RegEx
===================

A variable, for example '$searchterm' is linked, '=~', to a pattern match, for example 'm/^[0-9]+$/'.

The "/i"  modifier makes the test case-insensitive appended after closing a match operator.

After a successful match, Perl provides the variables $1 , $2 , $3 , etc., which hold the text matched by their respective ( ) parenthesized subexpr essions in the regex. Sub-expressions can be nested.

The non-capturing parentheses "(?: )" will group without capturing. For example '(?:ab)+' will repeat the match "ab" without creating any separate sub-expressions.

Review the code tempconv.pl for an example of the above.

Repetition
==========

Any expression (a single character, a marked sub-expression, or a character class) can be repeated with the *, +, ?, and {} operators.
 
The * operator will match the previous expression zero or more times, for example the expression 'a*b' will match 'b', 'ab', 'aaaaab'.

The + operator will match the previous expression one or more times, for example the expression 'y+z' will match 'yz', 'yyyz', but not 'z'.

The ? operator will match the previous expression zero or one times, for example the expression 'ca?t' will match: 'ct', 'cat', but not 'caat'.

Expressions can also be repeated:

'a{n}'  Match 'a' exactly n times. For example, '^a(3)$' will match the line 'aaa' only.

'a{n,}'  Match 'a' repeated n or more times. For example, '^a(3,)$ will match the line 'aaa', 'aaaa', etc but not 'aa' or 'a'.

'a{n, m}'  Match 'a' repeated between from n minimum to m maximum times inclusive. For example, '^a(3,4) will match 'aaa' and 'aaaa' only.

Don't use 'a(*)'!

Perl Substitution RegEx
=======================

A variable, for example '$searchterm' is linked,  '=~', to a substitution value, for example 's/regex/replacement/'.

Word boundaries can be established, along with global replacements, 's/\bregexe\b/replacement/g'.

Quick subsititution (like sed) can be achieved with: `perl -p -i -e 's/regex/replacement/g' file`. The -e flag indicates that the entire program follows right there on the command line, the -p flag results in the substitution being done for every line of the named file, and the -i flag causes any changes to be written back to the file when done.

Perl has the capability to "lookaround" for patterns in a regex and insert replacements, based on the location where the regex applies with '(?=regex)lookahead'. For example, '(?=arrow)row' will match 'row' if it is part of 'arrow', but not 'borrow'.  As a further example, to change an incorrect plural noun to a possessive one could use: 's/\bnoun(?=s\b)/possessive'/g'. '

Consider also the population of Australia, 25323300 (2016) estimate. If one wanted to present this as comma-separated in groups of three (25,323,300)the following could be used: '$pop =~ s/(?<=\d)(?=(\d\d\d)+(?!\d))/,/g;'

Lookahead and lookbehind summary table
======================================

| Type			| Regex		| Success conditions			|
|-----------------------|---------------|---------------------------------------|
| Positive Behind	| (?<=..)	| if regex matches to the left		|
| Negative Behind	| (?<!..)	| if regex does not match to the left	|
| Postive Ahead		| (?=..)	| if regex matches to the right		|
| Negative Ahead	| (?!..)	| if regex does not match to the right	|
