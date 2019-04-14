It is good practise to enclose the regular expression in single quotes, to prevent the shell from expanding the expression rather than the grep process.

Some examples of grep options with metacharacters.

* Count the number of empty lines in a file, '-c' is count.
grep -c '^$' filename

* Search for words without standard vowels, '-v' is invert match.
grep -v '[aeiou]' /usr/share/dict/words

* Case-insensitive search for lines that start with QANTAS, and only QANTAS (not QANTAS1, for example), in all files in the specified directory. The options '-i' and '-w' are case-insensitive and whole word, respectively.
grep -iw '^QANTAS' /usr/share/dict/*
