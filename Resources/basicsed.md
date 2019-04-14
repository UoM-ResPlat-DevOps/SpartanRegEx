The general form is `sed [OPTION] [SCRIPT] [INPUT]`. Common options are `e` (multiple scripts per command), `-f` (add script file) and `-i` (in-place editing).

The `sed` utility is extremely powerful for text conversion and data cleaning!

Try these commands with the gattaca.txt file e.g.,

`sed 's/^/     /' gattaca.txt`
`sed '/ELM/s/Q/\$/g' gattaca.txt`

| Command                | Explanation                                                                  |
|------------------------|:-----------------------------------------------------------------------------|
| `sed 's/^/     /'`     | Insert five whitespaces at the beginning of every line.                      | 
| `sed '/baz/s/foo/bar/g'|` Substitute all instances of 'foo' with 'bar' on lines that start with 'baz' |
| `sed '/baz/!s/foo/bar/g'`| Substitute "foo" with "bar" except for lines which contain "baz"           |
| `sed /^$/d`    | Delete all blank lines.                                                              |
| `sed s/ *$//` | Delete all spaces at the end of every line.                                           |
| `sed 's/$/\r/g'`     | *nix to MS-Windows, adds CR.                                                        | 
| `sed 's/\r$//g'`     | MS-Windows to *nix, removes CR                                              |

A popular list of one-line sed commands can be found at the following URL 
http://sed.sourceforge.net/sed1line.txt

See also books, scripts, games, and tools from "the sed $HOME"

http://sed.sourceforge.net/
