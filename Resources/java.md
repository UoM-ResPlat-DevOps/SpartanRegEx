========================
Java Regular Expressions
========================

The java.util.regex Package
===========================

Java uses the java.util.regex package for regular expressions and pattern-matching.

The package consists of three main classes:

* Pattern Class. A Pattern object that is a compiled representation of a regular expression.
* Matcher Class. A Matcher object that interprets the pattern and performs match operations.
* PatternSyntaxException.  An exception for noting syntax errors in a regular expression.

Typically Java regex will start with:

```
import java.util.regex.Matcher;
import java.util.regex.Pattern;
```

Metacharacters & Sequences
==========================

Metacharacters
--------------

The following RegEx metacharacters are used in Java. They are very similar to those used in other languages.

.		Matches any character
^ 		Matches the beginning of the line.
$ 		Matches the end of the line.
. 		Matches any single character except newline. Using m option allows it to match the newline as well.
[abc]		Matches characters in in a set (e.g., a or b or c)
[ab][cd]	Matches characters in a set (e.g., a or b followed by c or d)
[.] 		Matches any single character in brackets.
[^.] 		Matches any single character not in brackets.
a|b		Matches a or b

Sequences
---------

\A 		Beginning of the entire string.
\z 		End of an entire string.
\Z 		End of an entire string except allowable final line terminator.
re* 		Matches 0 or more occurrences of the preceding expression.
re+ 		Matches 1 or more of the previous expression.
re? 		Matches 0 or 1 occurrences of the previous expression.
re{ n} 		Matches exactly n number of occurrences of the preceding expression.
re{ n,} 	Matches n or more occurrences of the preceding expression.
re{ n, m} 	Matches at least n and at most m occurrences of the preceding expression.
(re) 		Groups regular expressions and remembers the matched text.
(?: re) 	Groups regular expressions without remembering the matched text.
(?> re) 	Matches the independent pattern without backtracking.
\w 		Matches word characters.
\W 		Matches nonword characters.
\s 		Matches whitespace. Equivalent to [\t\n\r\f].
\S 		Matches nonwhitespace.
\d 		Matches digits. Equivalent to [0-9].
\D 		Matches nondigits.
\A 		Matches the beginning of the string.
\Z 		Matches the end of the string, not including the newline.
\z 		Matches the end of the string.
\G 		Matches the point where the last match finished.
\n 		Back-reference to capture group number "n".
\b 		Matches the word boundaries when outside brackets. Matches the backspace (0x08) when inside brackets.
\B 		Matches the nonword boundaries.
\n, \t, etc. 	Matches newlines, carriage returns, tabs, etc.
\Q 		Escape (quote) all characters up to \E.
\E 		Ends quoting begun with \Q.

Quantifiers
-----------
*		Matches zero or more elements.
+		Matches one or more elements. Equivalent to {1,}
?		Matches none or one elements. Equivalent to {0.1}
{X}		Matches X number of elements. e.g., \d{3}, matches three digits.
{X,Y}		Matches between X and Y elememts. e.g., \d{1,4} matches at least 1 and up to 4 digits.
*?		Non-greedy quantifier. Use of ? after a quantifier means it attempst the smallest first match.


Methods
=======

The start() and end() method
----------------------------

Example;
`javac $(pwd)/RegexMatches.java; java -cp . RegexMatches`

The start() and end() method example uses a word boundary to ensure that an entire word and not a substring is being counted (e.g., rattie)





Java Strings have support for regexes built in, with four methods, matches(), split(), replaceFirst(), replaceAll() methods.
