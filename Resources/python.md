The re Package and Metacharacters
=================================

Python's re package can be used for regular expressions, and can be tested with similar metacharacters to those used in POSIX. See `startend.py`

Metacharacters
--------------

Metacharacter	| Meaning
:---------------|----------------------------------------------------------:
.		Any character except new line.
^		Start of a string.
$		End of a string
*		Zero or more repetitions of the preceeding RegEx.
?		Zero or one repetitions of the preceeding RegEx; ab? will match either ‘a’ or ‘ab’
+		Matches one or more repetitions of the preceeding RegEx; ab+ will match ‘a’ followed by any non-zero number of ‘b’s; it will not match just ‘a’
*?, +?, ??	The '*', '+', and '?' qualifiers are all greedy; they match as much text as possible. Adding ? after the qualifier makes it perform the match in a minimal fashion with as few characters as possible will be matched.
{m}		Specifies exactly m copies of the previous RegEx are matched.
{m,n}    	Match from m to n repetitions of the preceding RegEx, attempting to match as many repetitions as possible. For example, a{3,5} will match from 3 to 5 'a' characters. 
{m,n}?    	Match from m to n repetitions of the preceding RegEx, with as few repetitions as possible. 	
\ 		Either escapes special characters (permitting you to match characters like '*', '?', etc), or signals a special sequence.
[]		Used to indicate a set of characters, either individually (e.g., [ACGT]) or a range [A-Z]. Special characters lose their meaning in sets (e.g., [(+*)] will literally match (, +, *, or ). Characters that are not within a range can be matched by complementing the set with an initial ^ (e.g., [^5], not 5).To match a ']' inside a set, precede with a backslash or place at the beginning of the set.
|		In A|B in a RegEx, match either A or B. 
(...)		Match RegEx inside parantheses as a group. Use \ to escape and match literal parantheses. or enclose them in a class.

Special Sequences
-----------------

The following is a list of common special sequences

\d	Matches any decimal digit, equivalent to the class [0-9].
\D	Matches any non-digit character, equivalent to the class [^0-9].
\s 	Matches any whitespace character, equivalent to the class [ \t\n\r\f\v].
\S	Matches any non-whistespace.
\w	Matches any alphanumeric,  equivalent to the class [a-zA-Z0-9_].	\W			Matches any non-alphanumeric


Pattern and Match Objects
=========================

In Python RegExes are compiled into pattern objects with `re.compile` which have various methods.)

```
import re
regexsearch = re.compile('CGCCTGCCCCCTCCGCGCCGGCCTGCCGGTGATAAAGTCG', re.IGNORECASE)
print regexsearch
```
Various compilation flags can be added to re.compile, with the re.IGNORECASE example above. These include:

DOTALL, S	The `.` matches any character, including newlines
IGNORECASE, I	Case-insensitive matches
LOCALE, L	Locale-aware match
MULTILINE, M	Multi-line matching, the affects ^ and $
VERBOSE, X	Enable verbose RegExes.
UNICODE, U	Be aware that several escapes like \w, \b, \s and \d dependent on the Unicode character database.

Once a regular expression is compiled into a pattern object functions (see below) can be applied.

Likewise RegEx matches are also expressed as objects which can have functions applied to them. The example `match_objects.py` has print statements to show that there is an object, a .start() and .end() to show what characters are in the match - which is the same as .span(), the string that was passed to the function (gattaca.txt in this case), and the part of the string where there was a match.

Backslash Issues in Python
==========================

As the norm with out RegExes, the backslash is used to escape metacharaters, and a double backslash is used to for a literal backslash. However, Python uses the same character for the same purpose in string literals.

Thus, in Python, to have a regular expression that matches, say, \documentclass (used in LaTeX), the backslash has to be escaped for re.compile() and then both backslashes have to be escaped for a string literal - resulting in *four* backslashes.

\documentclass for the text string
\\documentclass for re.compile()
"\\\\documentclass" for a Python string literal

A solution to this issue is to express string literals with a 'r', raw notation. 
"\\\\documentclass"	becomes r"\\documentclass"
"\\w+\\s+\\1" 		becomes r"\w+s\1"

Functions
=========

The re package has the following functions:

findall() 	Returns a list containing all matches
search() 	Returns a Match object if there is a match anywhere in the string
split() 	Returns a list where the string has been split at each match
sub() 		Replaces one or many matches with a string


The findall() Function
----------------------

The findall() function will return a list which contains all functions, or an empty list if no match was found. It can be used on a string or a file.

```
import re
f = open('test-high-gc-1.fastq', 'r')
searchseq= re.findall(r'AAAGT', f.read())
print(searchseq)
f.close()
```

The search() Function
---------------------

The search() function searches the string for a match, and returns a Match Object if there is one. If there is more than one, only the first occurrence is returned.

If there is no match, the value 'None' is returned.

```
import re
f = open('test-high-gc-1.fastq', 'r')
searchseq= re.search(r'AAAGT', f.read())
print(searchseq)
f.close()
```

A Match Object has properties and methods abut the search. e.g.,

`.span()`, a tuple containing the start and end positions of the match.
`.string`, the string passed to the function
`.group()`, the part of the string where there was the match.

Continuing from above:

```
print(searchseq.span())
print(searchseq.string)
print(searchseq.group())
```

The split() function
--------------------

The split() function returns a list where the string has been split at each match.

The following reads in the file and splits the contents at the specified character sequence. Note that the character sequence is *removed* from the output.

```
import re
f = open('test-high-gc-1.fastq', 'r')
contents = f.read()
splitseq = re.split("Ignore this line\n", contents)
print(splitseq)
f.close()
```

Note that the output also includes the null lines. You can remove these (for example) with a little bit of sed (recall rules for single quotes).

```
python split.py > output
sed -i "s/'', //g" output
```

By default, the output will be based on all instances. However, the maximum number of characters can be controlled by settin a maxsplit parameter.

```
splitseq = re.split("", contents, 1)
print(splitseq)
```

The sub() Function
------------------

The sub() function conducts a search-and-replace with matches against the regular expression. See `substitute.py`

The number of replacements can be controlled by specifying the count parameter at the end of the sub() function. See `substitute2.py`

References
==========

Regular Expression HOWTO in Python Documentation, Python Software Foundation, 2019

re - Regular Expression Operations, in Python Standard Library, Python Software Foundation, 2019




