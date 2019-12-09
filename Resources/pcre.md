====================================
Perl-Compatiable Regular Expressions
====================================

Perl Compatible Regular Expressions (PCRE) is a C library that implements a regular expression engine that attempts to match the capabilities and syntaxc of Perl. 

PCRE's syntax is more powerful and flexible that the POSIX regular expressions flavors. 

Some Features
=============

1. Extended character classes. Like Perl, PCRE offers extension to POSIX classes so that `\d` is the equivalent to [[:digit:]].

2. Minimal matching. Like Perl, PCRE offers "ungreedy" or minimal matches. A `?` placed after any repetition quantifier indicates that the shortest match should be used.

3. Unicode matching. 

4. 



Differences from Perl
=====================

Perl and PCRE are very close but not quite the same in the way they express and manage regular expressions. They are quite advanced! These are *some* of the differences:

Good news! Since PCRE 7.x and Perl 5.9.x the two projects are working together to maximise compatibility!

1. PCRE uses a subset of Perl's Unicode support and Perl escape sequences \p, \P, and \X are supported only if PCRE2 is built with Unicode support (the default). 

2. PCRE uses atomicity for recursive matches and Perl does not. So (?!a){3} in PCRE does not mean match if the next three characters are not a, but rather is that the character is not a three times. A more obscure example (taken from Wikipedia):
"<<!>!>!>><>>!>!>!>" =~ /^(<(?:[^<>]+|(?3)|(?1))*>)()(!>!>!>)$/ will match in Perl but not in PCRE.

3. The following escape sequences are not supported in Perl, but not PCRE: \F, \l, \L, \u, \U, and \N when followed by a character name.

4. PCRE supports \Q .. \E for escaping substrings, and characters are treated as literals. In Perl `$` and `@` variable subsitution occurs. e.g.,

Pattern            PCRE2 matches     Perl matches
------------------|-----------------|------------------------------------
\Qabc$xyz\E        abc$xyz           abc followed by the contents of $xyz
\Qabc\$xyz\E       abc\$xyz          abc\$xyz
\Qabc\E\$\Qxyz\E   abc$xyz           abc$xyz
\QA\B\E            A\B               A\B
\Q\\E              \                 \\E

Taken and derived from: pcre2compat man page by Philip Hazel
https://www.pcre.org/current/doc/html/pcre2compat.html
