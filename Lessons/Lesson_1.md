-- *Slide* --
# Goals for today
Part 1: Basic RegEx: grep, sed, awk
Part 2: Advanced RegEx: scripting and awk programs
Part 3: Programming RegEx with perl
Part 4: Some RegEx in PHP, Python, Java, and SimpleRegEx
-- *Slide End* --

-- *Slide* --
# Slide Respository
* A copy of these slides and sample code is available at: `https://github.com/UoM-ResPlat-DevOps/RegEx`
* A copy of information about HPC at the University of Melbourne is available at `https://dashboard.hpc.unimelb.edu.au`. See also `man spartan` on the cluster and the `/usr/local/common/` directories for more help and code exammples.
* Help is available at: `hpc-support@unimelb.edu.au`. Other courses also conducted by Research Platforms.
* Terminal projection via https://shellshare.net/
-- *Slide End* --

-- *Slide* --
# Part 0: UNIX loves Text
The string is a stark data structure and 
everywhere it is passed there is much duplication of process. 
It is a perfect vehicle for hiding information. 
--Alan Perlis
-- *Slide End* --

-- *Slide* --
# Part 1: What Are Regular Expressions?
* Regular Expressions ("RegEx") are a general pattern notations that provides the means for efficient and effective text processing. 
* Major initial formal development by Stephen Cole Kleene as a mathematical "Regular Language" in 1951, located as a Type-3 grammar in Chomsky's 1956 hierarchy. RegExes are "not quite" the same as "RegLang", but are related.
* First major computational use was in 1968 with pattern matching in the QED text editor and, independently in the same year, in compiler design. The regular expression system in QED was ported to `ed` in 1969.
* Main tools for regular expressions are `grep` (1974), `sed` (1974), `awk` (1977), `perl` (1987) and `pcre` (1997).
-- *Slide End* --

-- *Slide* --
<img src="https://raw.githubusercontent.com/UoM-ResPlat-DevOps/SpartanRegEx/master/Images/chomsky-hierarchy.png" /> 
-- *Slide End* --

-- *Slide* --
# Part 1: Metacharacters
* A major feature of RegEx is the use of *metacharacters*, which have a special meaning to the RegEx application over and above their literal meaning. Metacharacters must be escape with a backslash.
* The entire suite of metacharacters that require an escape include: "(", "{" "}", ")", "^", "$", ".", "|", "?", "*", "+", "\".
* In addition to metacharacters there are RegEx classes which convert RegEx ranges into matched set. Classes have their own (- ^) metacharacters!
* There is a list of sample metacharacter examples and classes in `/usr/local/common/RegEx/basicmeta.md`
-- *Slide End* --

-- *Slide* --
# Part 1: Searching with `grep`
* Most basic use is searching text. Typical formal structure is a search for a pattern with Boolean logic, grouping, quantification (e.g., number of instances), and wildcards, followed by an optional operation (arithemetic count, replacement etc) on the pattern. e.g., `grep -i ATEK gattaca.txt`. 
* Common options used with basic `grep` include -i (ignore case), -w (whole words), -v (inverted match), -c (count), -L and -l (print filenames), -n (line number), -r and -R (recursive).
* Elaboration and examples in `/usr/local/common/RegEx/basicgrep.md`
-- *Slide End* --

-- *Slide* --
# Part 1: Editing with `sed`
* As the name implies `sed` is a *stream editor*. It takes a data stream, conducts a regular expression, and sends it to standard output. 
* The general form is `sed [OPTION] [SCRIPT] [INPUT]`. Common options are `e` (multiple scripts per command), `-f` (add script file) and `-i` (in-place editing).
* The general form of a script is `Command/RegExp/Replacement/Flags`. A common command is `s` for `substitute`, common flags are `g` for global replacement thoughout each line and `I` to ignore case. 
* Elaboration and examples in `/usr/local/common/RegEx/basicsed.md`
* A collection of `sed` one-liners are at: `http://sed.sourceforge.net/sed1line.txt`
-- *Slide End* --

-- *Slide* --
# Part 1: Reporting with with `awk`
* As a data driven programming language `awk` is particularly good at understanding and manipulating structured text.
* An `awk` program follows the form: `pattern { action }`, sometimes structured with BEGIN and END to specify actions to be taken before any lines are read, and after the last line is read. 
* Sample `awk` scripts are available at: `/usr/local/common/basicawk.md`
* A collection of `awk` one-liners are at: `http://www.pement.org/awk/awk1line.txt`
-- *Slide End* --

-- *Slide* --
# Part 2: BRE and SRE
* POSIX has three sets of RegEx standards, BRE (Basic Regular Expressions), ERE (Extended Regular Expressions) and SRE (Simple Regular Expressions). SRE is deprecated.
* ERE adds the '?', '+', and '|' metacharacters, and it removes the need to escape the metacharacters '(' ')' and '{' '}', which is required in BRE. 
* ERE can be invoked with `grep -E` and `sed -r` or `sed -E`. Examples in `/usr/local/common/RegEx/BREandERE.md`
-- *Slide End* --

-- *Slide* --
# Part 2: Warning! Limitations of Regular Expressions
* A regular expression is limited by a finite number of internal states and termination states. A lot of code (e.g., html), scripts, or programming languages, that can nest arbitrarily deep, and the expression will need to have a means to recall the previous elements that it has opened (in html, for example). 
* This said, arbitrary elements can be parsed with a regular expression. It requires several steps and will probably require some hand-editing. Works OK for small-scale changes! e.g., `http://levlafayette.com/node/128`
* READ: `http://htmlparsing.com/regexes.html`
* Consider using a language-approriate parser instead (e.g., HTML Tidy, lex/yacc/bison, ANTLR etc)
-- *Slide End* --

-- *Slide* --
<img src="https://raw.githubusercontent.com/UoM-ResPlat-DevOps/SpartanRegEx/master/Images/regexhtml.png" /> 
-- *Slide End* --

-- *Slide* --
# Part 2: Shells and Shell Scripting
* Variety of shells; sh, bash, csh, tcsh, ksh, zsh, fish, nadvsh. Environment modification. 
* Shell scripting allows for automation; variables, loops, conditionals, functions.
* Elaboration and examples in `/usr/common/common/RegEx/scripting.md`
* Remember `awk` is a fully-fledged programming language. See `/usr/local/common/RedEx/advawk.md`
-- *Slide End* --

-- *Slide* --
<img src="https://imgs.xkcd.com/comics/regex_golf.png" />
-- *Slide End* --

-- *Slide* --
# Part 3: Perl Regular Expressions 
* Perl is largely derived from `sed`, `awk`, but also with additional programming functions. 
* Perl RegEx has additional functionality includes lazy matching, backtracking, named capture groups, and recursive patterns. Similar syntax used in Javascript, Python, Ruby, XML Schema.
* Elaboration and examples in `/usr/local/common/RegEx/perl.md`, `metaperl.pl`, `radio.pl`
-- *Slide End* --

-- *Slide* --
# Part 3: Capture Groups, Lookarounds
* When there is a successful match, Perl provides the variables $1, $2, etc to hold the text matched by their their parenthesis subexpressions. See input variables in `names.pl` and `tempconv.pl`
* Note that the variables are not assigned if they do not match, and they do not clear!
* 
-- *Slide End* --

-- *Slide* --
<img src="https://imgs.xkcd.com/comics/regular_expressions.png" />
-- *Slide End* --

-- *Slide* --
# Part 3: Perl Compatible Regular Expressions
* Perl Compatible Regular Expressions (PCRE). Library written in C (1997), considered more powerful and flexible than POSIX. Incorporated into scripting languages like R and PHP. 
* Not the default in Perl! From Perl 5.10, PCRE is available as a replacement for Perl's default regular expression engine.
* Functionality includes Just-in-time compiler support, flexible memory management, consistent escaping rules, extended character classes, minimal matching, unicode character support, etc.
-- *Slide End* --

-- *Slide* --
<img src="https://raw.githubusercontent.com/UoM-ResPlat-DevOps/SpartanRegEx/master/Images/phpbadparts.jpg" />
-- *Slide End* --

-- *Slide* --
# Part 4: RegEx in PHP
* PHP has two types of regular expressions; POSIX-extended, and Perl-compatible. The Perl-compatible regexes must be enclosed in delimiters, but are more powerful.
* There is also a number of string functions which can mimic basic sed functions.
* POSIX-extended have been deprecated from PHP5.3+ and removed from 7.0+
* Examples in `/usr/local/common/RegEx/php.md`, `posix.php`, and `pcre.php`.
-- *Slide End* --

-- *Slide* --
# Part 4: RegEx in Python
* Python has a built-in package called re, which can be imported to perform regular expressions.
* The re package has a typical range of metacharacters, a number of special sequences, special issues with backslashes, and a range of regular expression methods.
* Examples in `/usr/local/common/RegEx/python.md`
-- *Slide End* --

-- *Slide* --
# Part 4: RegEx in Java
* Java uses the java.util.regex package for regular expressions and has a similar syntax to what is used in Perl. 
* Examples in `/usr/local/common/RegEx/java.md`
-- *Slide End* --

-- *Slide* --
# Part 4: Simple RegEx
* RegEx in all languages tends to be terse and hard to read. The Simple Regex Language (SRL) replaces the complex metacharacters with high-level language constructs.
* Simple RegEx will help you understand complex regular expressions!
* See `simpleregex.md`
-- *Slide End* --

-- *Slide* --
# A Final Remark
Some people, when confronted with a problem, think "I know, I'll use regular expressions." Now they have two problems.
-- Jamie Zawinski
* Keep your regexes simple, unless you *really* need something complex. Three readable and simple steps are better than one obsfucated and complex step.
-- *Slide End* --

-- *Slide* --
# References
* XKCD cartoon from Randall Munroe, https://xkcd.com
* Set reference of Chomsky grammer by J. Finkelstein on Wikipedia, CC BY-SA 3.0
* Dale Dougherty, Arnold Robbins, sed & awk (second edition), O'Reilly, 2000 FP 1997
* Jeffrey E. F. Friedl, Mastering Regular Expressions (third edition), O'Reilly, 2006 FP 1997
* Jan Goyvaerts, Regular Expression: The Complete Tutorial, 2007, FP 2006
-- *Slide End* --

-- *Slide* --
<img src="https://raw.githubusercontent.com/UoM-ResPlat-DevOps/SpartanIntro/master/Images/hypnotoad.png" width="150%" height="150%" />
-- *Slide End* --
