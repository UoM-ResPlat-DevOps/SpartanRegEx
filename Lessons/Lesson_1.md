-- *Slide* --
### Goals for today
-- *Slide End* --

-- *Slide* --
### Slide Respository
* A copy of these slides and sample code is available at: `https://github.com/UoM-ResPlat-DevOps/RegEx`
* A copy of information about HPC at the University of Melbourne is available at `https://dashboard.hpc.unimelb.edu.au`. See also `man spartan` on the cluster and the `/usr/local/common/` directories for more help and code exammples.
* Help is available at: `hpc-support@unimelb.edu.au`. Other courses also conducted by Research Platforms.
* Terminal projection via https://shellshare.net/
-- *Slide End* --

-- *Slide* --
# Goals for today
Part 1: RegEx foundations
Part 2: RegEx with grep, sed, and awk
Part 3: RegEx with Perl
Part 4: RegEx with other languages
-- *Slide End* --

-- *Slide* --
# Part 1: What Are Regular Expressions?
* Regular Expressions ("RegEx") are a general pattern notations that provides the means for efficient and effective text processing. Major initial formal development by Stephen Cole Kleene as a mathematical "Regular Language" in 1951, located as a Type-3 grammar in Chomsky's 1956 hierarchy.

* First major computational use was in 1968 through pattern matching in the QED text editor by Ken Thompson and lexical analyis in the compiler by Douglas T. Ross et al.

* Main long-standing tools for regular expressions are `grep` ("global search for regular expression and print" taken from the `ed` text editor, first release 1974), `sed` ("stream editor", also taken from the scripting features in `ed`, first release 1974), AWK ("Aho, Weinberger, Kernighan", data-driven scripting language, first release 1977), Perl (common backronym "Practical Extraction and Reporting Language", 1987). You will also encounter references to `egrep` and `fgrep`. Other languages also include regular expression features.

* Most basic use is searching and replacing text. Typical formal structure is a search for a pattern with Boolean logic, grouping, quantification (e.g., number of instances), and wildcards, followed by an optional operation (arithemetic count, replacement etc) on the pattern. In a POSIX environment a command structure is `application (options) RegEx file` e.g., `grep -i ATEK gattaca.txt`. 

* A major feature of RegEx is the use of *metacharacters*, which have a special meaning to the RegEx application over and above their literal meaning.


-- *Slide End* --



-- *Slide* --
-- *Slide End* --

-- *Slide* --
<img src="https://raw.githubusercontent.com/UoM-ResPlat-DevOps/SpartanIntro/master/Images/hypnotoad.png" width="150%" height="150%" />
-- *Slide End* --



