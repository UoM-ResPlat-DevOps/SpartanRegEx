===========================
Simple Regex Language (SRL)
===========================

Introduction
============

SRL replaces terse abbreviations and various meta-characters with high-level syntax for readability.

Available on github for several languages

`https://github.com/SimpleRegex`

The file derived almost entirely from https://simple-regex.com/documentation/ and Linux Magazine, June 2017



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

`one of "characters"`
Matches on one of the supplied characters as a set.

`letter [from a to z]`
Matches one of a set with a specified range. Can also be expressed, in a similar manner in:

`uppercase letter [from A to Z]`

`any character`
As it says, matches any character (i.e., A to Z, 0 to 9 and _.

`no character`
This will match everything except a to z, A to Z, 0 to 9 and _. 

`digit [from 0 to 9]`
Each didgit matches only one digit. Use a quantifier to extend. e.g.,
`starts with digit from 5 to 7 exactly 2 times, must end`
i.e., /^[5-7]{2}$/

`anything`
Matches anything except newline-breaks, which are matched with `new line`.

`whitespace'
Matches any whitespace character. Negative is `no whitespace`. Specific whitespace can be matched with `tab`.

`backslash`
An alternative to using `literally "\\"`, since a backslash is an escaping character.

`raw "expression`
This character rules allows the inclusion of a standard regex.

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

Lookarounds
-----------

Lookarounds define a group to match under certain conditions.


Flags and Anchors
-----------------

Flags apply to an entire query in a particular mode e.g., "case insensitive".

Anchors define whether a string starts and ends.


Website Tests
=============

You can build SRL queries on the website and test input.

`https://simple-regex.com/build`

