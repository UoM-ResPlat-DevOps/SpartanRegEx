===========================
Simple Regex Language (SRL)
===========================

Introduction
============

SRL replaces terse abbreviations and various meta-characters with high-level syntax for readability.

Available on github for several languages

`https://github.com/SimpleRegex`

The file derived almost entirely from https://simple-regex.com/documentation/ and Linux Magazine, June 2017. 

Example RegEx to SRL 
====================

Compare:

`/^(?:[0-9]|[a-z]|[\._%\+-])+(?:@)(?:[0-9]|[a-z]|[\.-])+(?:\.)[a-z]{2,}$/i`

With:

```
begin with any of (digit, letter, one of "._%+-") once or more,
literally "@",
any of (digit, letter, one of ".-") once or more,
literally ".",
letter at least 2 times,
must end, case insensitive
```

This is an email validator.

Language Rules
==============

SRL is case-insensitive, although the content in a string is case sensitive. i.e, LITERALLY "TEST" is not the same as literally "test". Commas may be used to separate statements for readability.

Strings are interpreted literally and can be defined with single or double quotation marks.

Only use parantheses when building a sub-query, e.g., a capture group to apply a quantifier. 

Characters
----------

Characters are everything that matches the string directly, including "letter", "digit" and "literally". 

The syntax of a character is as follows:

`character [specification] [quantifier] [others]`

Some examples:

`literally "string"`
The keyword "literally" means that the string will be exactly as requested, except that backslash is an escape character.
`literally "sample"`
`/(?:sample)/`

`one of "characters"`
Matches on one of the supplied characters as a set.
`one of "a%1"`
`/[a%1]/`

`letter [from a to z]`
Matches one of characters with a set with a specified range. 
`letter from a to f exactly 4 times`
`/[a-f]{4}/`

`uppercase letter [from A to Z]`
Matches a set of uppercase characters with a specified range.
`uppercase letter from A to F`
`/[A-F]/`

`any character`
As it says, matches any character (i.e., A to Z, 0 to 9 and _.
`starts with any character once or more, must end`
`/^\w+$/`

`no character`
This will match everything except a to z, A to Z, 0 to 9 and _. 
`starts with no character once or more, must end`
`/^\W+$/`

`digit [from 0 to 9]`
Each didgit matches only one digit. Use a quantifier to extend. e.g.,
`starts with digit from 5 to 7 exactly 2 times, must end`
`/^[5-7]{2}$/`

`anything`
Matches anything except newline-breaks, which are matched with `new line`.
`/./`

`whitespace`
Matches any whitespace character. Negative is `no whitespace`. Specific whitespace can be matched with `tab`.
`/\s/`
`/\t/`

`backslash`
An alternative to using `literally "\\"`, since a backslash is an escaping character.
`/\\/`

`raw "expression`
This character rules allows the inclusion of a standard regex.
`literally "an", whitespace, raw "[a-zA-Z]"`
`/(?:an)\s[a-zA-Z]/`

Quantifiers
-----------

Quantifiers determine how often a statement is allowed to occur.

`exactly x times`
Short forms exist for "once" and "twice" e.g.,
`digit exactly 3 times, letter twice`
`/[0-9]{3}[a-z]{2}/`

`between x and y times`
Specific range of repetitions.

`optional`
Will match if the character type is there, ignore it otherwise.
`digit optional, letter twice`
`/[0-9]?[a-z]{2}/`

`once or more`, `never or more`
Will match if something exists once (or never). May exist multiple times.
`starts with letter once or more, must end`
`/^[a-z]+$/`

`at least x times`
Will match if query matches at least according to quantifier.
`letter at least 10 times`
`/[a-z]{10,}/`

Groups
------

Groups combine matches of characters and quantifiers, applying quantifiers to entire patters or part of an expression. Groups are like sub-queries.

`capture (condition) [as "name"]`
A capture group allows any condition to be named and returned to an engine.
`capture (anything once or more) as "first", literally " - ", capture "second part" as "second"`
/(?<first>.+)(?: - )(?<second>(?:second part))/

`any of (condition)`
Every statement supplied in a sub-query, could be a match. Use if you are unsure what part of a condition might match.
`capture (any of (literally "sample", (digit once or more)))`
`/((?:(?:sample)|(?:[0-9]+)))/`

`until (condition)`
Match or capture a specific expression until some other condition meets.
`begin with capture (anything once or more) until "m"`
`/^(.+?)(?:m)/`

Lookarounds
-----------

Lookarounds define a group to match under certain conditions.

`if [not] followed by`
Match if follwed by a condition; a lookahead. 
`capture (digit) if not followed by (anything once or more, digit)`
`/([0-9])(?!.+[0-9])/`

Match if preced by a condition; a lookabehind.
`capture "bar" if already had "foo"`
`/(?<=(?:foo))((?:bar))/`

Flags and Anchors
-----------------

Flags apply to an entire query in a particular mode e.g., "case insensitive".

`case insensitive`
Regular expressions are case sensitive.
`letter from a to b twice, case insensitive`
`/[a-b]{2}/i`

`multi line`
Used to match more than one line, supply the multi line flag. 

`all lazy`
Matching in regular expression is greedy by default, meaning it will try to match the last occurrence. "All lazy" will force this on a single quantifier.
`capture(letter once or more) all lazy`
`/([a-z]+)/U`

Anchors define whether a string starts and ends.

`begin/starts with`
Ensures that a string starts with a match of some sort (e.g., the '@' of a domain).
`starts with literally "@"`
`/^(?:@)/`

`must end`
Ensure that a string must end with a match of some sort (e.g., the '.' at the end of a standard sentence).
`literally "." must end`
`/(?:\.)$/`

Website Tests
=============

You can build SRL queries on the website and test input.

`https://simple-regex.com/build`

