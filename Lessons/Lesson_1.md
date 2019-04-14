-- *Slide* --
# Goals for today
Part 1: Basic RegEx: grep, sed, awk
Part 2: Extending and Scripting Regular Expressions
Part 3: Programming RegEx with perl
Part 4: RegEx in Other Languages
-- *Slide End* --

-- *Slide* --
# Slide Respository
* A copy of these slides and sample code is available at: `https://github.com/UoM-ResPlat-DevOps/RegEx`
* A copy of information about HPC at the University of Melbourne is available at `https://dashboard.hpc.unimelb.edu.au`. See also `man spartan` on the cluster and the `/usr/local/common/` directories for more help and code exammples.
* Help is available at: `hpc-support@unimelb.edu.au`. Other courses also conducted by Research Platforms.
* Terminal projection via https://shellshare.net/
-- *Slide End* --

-- *Slide* --
# Part 1: UNIX loves Text
The string is a stark data structure and 
everywhere it is passed there is much duplication of process. 
It is a perfect vehicle for hiding information. 
--Alan Perlis
-- *Slide End* --

-- *Slide* --
# Part 1: What Are Regular Expressions?
* Regular Expressions ("RegEx") are a general pattern notations that provides the means for efficient and effective text processing. 
* Major initial formal development by Stephen Cole Kleene as a mathematical "Regular Language" in 1951, located as a Type-3 grammar in Chomsky's 1956 hierarchy.
* First major computational use was in 1968 with pattern matching in the QED text editor and, independently in the same year, in compiler design. The regular expression system in QED was ported to `ed` in 1969.
* Main tools for regular expressions are `grep` (1974), `sed` (1974), `awk` (1977), and `perl` (1987).
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
* Examples of `grep` with these characters are available in `/usr/local/common/RegEx/basicgrep.md`
-- *Slide End* --

-- *Slide* --
# Part 1: Editing with `sed`
* As the name implies `sed` is a *stream editor*, which means it takes a data stream in a non-interactive mode, conducts a regular expression, and sends it to standard output. 
* The general form is `sed [OPTION] [SCRIPT] [INPUT]`. Common options are `e` (multiple scripts per command), `-f` (add script file) and `-i` (in-place editing).
* The general form of a script is `Command/RegExp/Replacement/Flags`. A common command is `s` for `substitute`, common flags are `g` for global replacement thoughout each line and `I` to ignore case. 
* Examples of `sed` are available at `/usr/local/common/RegEx/basicsed.md`
* Sed has alternative three alternative delimiters in its scripts; '/', ':', or '|'
-- *Slide End* --

-- *Slide* --
# Part 1: Reporting with with `awk`
* As a data driven programming language `awk` is particularly good at understanding and manipulating text structured by fields - such as tables of rows and columns. 
* The organisation of an `awk` program follows the form: pattern { action }. This is sometimes structured with BEGIN and END which specify actions to be taken before any lines are read, and after the last line is read. 
* The easiest and certainly one of the most common uses of awk is create reports from structured data; columns and rows are referenced by number and by default the space acts as the delimiter.
* Sample `awk` scripts are available at: `/usr/local/common/basicawk.md`, and a collection of `awk` one-liners are at: `http://www.pement.org/awk/awk1line.txt`
-- *Slide End* --

-- *Slide* --
# Part 2: BRE and SRE
* POSIX has three sets of RegEx standards, BRE (Basic Regular Expressions), ERE (Extended Regular Expressions) and SRE (Simple Regular Expressions). SRE is deprecated.
* ERE adds the '?', '+', and '|' metacharacters, and it removes the need to escape the metacharacters '(' ')' and '{' '}', which is required in BRE. 
* ERE can be invoked with `grep -E`, `sed -r`. Examples in `/usr/local/common/BREandERE.md`
-- *Slide End* --

-- *Slide* --
# Part 2: Shells and Shell Scripting
* Variety of shells; sh, bash, csh, tcsh, ksh, zsh, fish, nadvsh. Environment modification. 
* Shell scripting allows for automation; variables, loops, conditionals, functions.
* Examples in `/usr/common/HPCshells`
-- *Slide End* --

-- *Slide* --
# Part 2: Shell Scripting with RegEx
* Incorporating `grep`, `sed` and `awk` into shell scripts. 
-- *Slide End* --

-- *Slide* --
<img src="https://imgs.xkcd.com/comics/regex_golf.png" />
-- *Slide End* --

-- *Slide* --
# Part 3: Perl Regular Expressions 
* Perl is largely derived from `sed`, `awk`, shell scripting, but also with programming functions. 
* Perl RegEx has additional functionality includes lazy matching, backtracking, named capture groups, and recursive patterns. Similar syntax used in Javascript, Python, Ruby, XML Schema.
* Examples in `/usr/local/common/perl.md`
-- *Slide End* --

-- *Slide* --
<img src="https://imgs.xkcd.com/comics/regular_expressions.png" />
-- *Slide End* --

-- *Slide* --
# Part 3: Perl Compatible Regular Expressions
* Perl Compatible Regular Expressions (PCRE) . Library written in C (1997), considered more powerful and flexible than POSIX. Incorporated into scripting languages like R and PHP. 
* Not the default in Perl! From Perl 5.10, PCRE is available as a replacement for Perl's default regular expression engine.
* Functionality includes Just-in-time compiler support, flexible memory management, consistent escaping rules, extended character classes, minimal matching, unicode character support, etc.
* Examples in `/usr/local/common/pcre.md`
-- *Slide End* --


-- *Slide* --
-- *Slide End* --

-- *Slide* --
-- *Slide End* --



-- *Slide* --
<img src="https://raw.githubusercontent.com/UoM-ResPlat-DevOps/SpartanIntro/master/Images/hypnotoad.png" width="150%" height="150%" />
-- *Slide End* --


Part 2: Advanced Tools
* POSIX standards. for Basic and Extended Regular Expressions (BRE, ERE). New meta-characters, escape rules.  
* Invoking tools with ERE. Comparison and examples of BRE and ERE.
* Perl Regular Expressions. Additional functionality to POSIX. Use on other languages. Examples.
* Perl Compatible Regular Expressions (PCRE). Relationship with Perl. Advanced functionality. Examples.

Part 3: Shell Scripting with RegEX
* Core components of shell scripting; variables, loops, conditionals, functions.
* Incorporating `grep`, `sed`, and `awk` into shell-scripts. Examples.

Part 4: Perl Programs with RegEx
* Arrays, scalars, loops, conditionals, subroutines. Bioinformatics examples.
* Object-orientation, data structures, databases. Bioinformatics examples.




