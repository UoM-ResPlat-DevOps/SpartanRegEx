General
=======

The `sed` ("stream editor") utility is extremely powerful for text conversion and data cleaning!

The general form is `sed [OPTION] [SCRIPT] [INPUT]`. Common options are `e` (multiple scripts per command), `-f` (add script file) and `-i` (in-place editing).

By default sed sends results in standard output (i.e., the screen). If a change to the file is desired, use the -i option, and consider making a backup of the original by passing an argument. Or redirect output to a newfile. e.g.,

`sed 's/search/replace/g' file`
`sed 's/search/replace/g' file > newfile`
`sed -i 's/search/replace/g' file`
`sed -i.bak 's/search/replace/g' file`

Substitutions
=============

Substitions are the most common command in sed. It changes data in the stream from one value to another, line-by-line. It's a 'search-and-replace' but with a regular expression language.

The general approach is `sed 's/search/replace/g' file`. Without the `g` (global) the substitution will stop at the first instance. Another common option is `I` for case-insensitive search e.g.,

`sed 's/search/replace/gI file`.

Try these commands with the gattaca.txt file e.g.,

`sed 's/^/     /' gattaca.txt`
`sed '/ELM/s/Q/\$/g' gattaca.txt`

| Command                   | Explanation                                                                  |
|---------------------------|:-----------------------------------------------------------------------------|
| `sed 's/^/     /'`        | Insert five whitespaces at the beginning of every line.                      | 
| `sed '/baz/s/foo/bar/g'   | Substitute all instances of 'foo' with 'bar' on lines that start with 'baz'  |
| `sed '/baz/!s/foo/bar/g'` | Substitute "foo" with "bar" except for lines which contain "baz"             |
| `sed /^$/d`               | Delete all blank lines.                                                      |
| `sed s/ *$//`             | Delete all spaces at the end of every line.                                  |
| `sed 's/$/\r/g'`          | *nix to MS-Windows, adds CR.                                                 | 
| `sed 's/\r$//g'`          | MS-Windows to *nix, removes CR                                               |

A popular list of one-line sed commands can be found at the following URL 
http://sed.sourceforge.net/sed1line.txt

See also books, scripts, games, and tools from "the sed $HOME"
http://sed.sourceforge.net/

Printing and Deleting
=====================

The commands `p` and `d` print and delete the lines where a regular expression is found, respectively.

`sed -n /ELM/p gattaca.txt`
`sed /ELM/d gattaca.txt`

Without the `-n` it will output the file, gattaca.txt, and print the ELM line a second time.

With the `d` option it will output the file, gattaca.txt, with the ELM line deleted.

Adding the `w` option will print out the selection line to a new file.

sed 's/ELM/LUV/gw selection.txt' gattaca.txt

Quoting
=======

Generally strong quotes are recommended for regular expressions. However, sed often wants to use weak quotes to include (for example) variable substitution.

Consider for example, a job run which searches for a hypothetical element and comes with the result of Unbihexium. This is the equivalent of:

`UnknownElement = Unbihexium`
`echo $UnknownElement`

A file where the search term UnknownElement exists could be replaced with Unbihexium with:

`sed "s/UnknownElement/$UnknownElement/g" filename`

The sed metacharacter, `&` can be used as variable for the selection term. For example, a list of telephone numbers could have the first two digits selected and then surrounded by parantheses for readability.

`sed 's/^[[:digit:]][[:digit:]]/(&) /' phonelist.txt`

A repeated term can be invoked with curly braces and a number representing how often the term should be repeated. 

The above example could be re-written as:

`sed -E 's/^[[:digit:]]{2}/(&) /' phonelist.txt`

Selections in sed
=================

Occurances and lines can be specified with sed.

For example, the second instance of A can be replacd with T with the following command:

`sed 's/A/T/2' simple1.txt`

Or replace every instance after the second.

`sed 's/A/T/g2' simple1.txt`

Or only replace every instance after the second on the second line.

`sed '2s/A/T/g2' simple1.txt`

Or for specific lines.

`sed '1,2d' gattaca.txt`
`sed -n '1,2p' gattaca.txt`

`sed -n '1,3p' gattaca.txt` or `sed -n 1,+2p gattaca.txt`

`sed -n '1,3!p' gattaca.txt` 

`sed '1~2d' gattaca.txt`

One can add new material to a file in such a manner with the insert option:

`sed '1,2 i\foo' file` or `sed '1,2i foo' file` 

Multiple Commands
=================

Multiple commands in sed can be applied with the -e option or with semi-colon separation between commands.

The following selectively prints lines 1,2 and 5,6.

sed -n '1,2p; 5,6p' file or `sed -n -e '1,2p' -e '5,6p' file`  

Backreferences
==============

Like the ampersand metacharacter, a backreference defines a region in a search and then allows that region to be backreferenced. A statement with a backreference is actually beyond being a regular language.

Regions are established by parentheses and then referenced by \1, \2 etc. For example;

`sed -E 's/([A-Z]*)([A-Z]*)([A-Z]*)/First Column \1 Second Column \2 Third Column \3/' gattaca.txt`
