
# perlmeta.pl
# Examples from Perl programming on Wikibooks
# In all examples the 'if' statements return a True value

$string1 = "Hello World\n";
if ($string1 =~ m/...../) {
print "$string1 has length >= 5\n";
}

$string1 = "Hello World\n";
if ($string1 =~ m/(H..).(o..)/) {
print "We matched '$1' and '$2'\n";
}

$string1 = "Hello World\n";
if ($string1 =~ m/l+/) {
print "There are one or more consecutive l's in $string1\n";
}

$string1 = "Hello World\n";
if ($string1 =~ m/H.?e/) {
print "There is an 'H' and a 'e' separated by ";
print "0-1 characters (Ex: He Hoe)\n";
}

$string1 = "Hello World\n";
if ($string1 =~ m/(l+?o)/) {
print "The non-greedy match with one or more 'l'\n";
print "followed by an 'o' is 'lo', not 'llo'.\n";
}

$string1 = "Hello World\n";
if ($string =~ m/el*o/) {
print "There is an 'e' followed by zero to many";
print "'l' followed by 'o' (eo, elo, ello, elllo)\n";
}

$string1 = "Hello World\n";
if ($string1 =~ m/l{1,2}/) {
print "There exists a substring with at least one";
print "and at most two l's in $string1\n";
}

$string1 = "Hello World\n";
if ($string1 =~ m/[aeiou]+/) {
print "$string1 contains a one or more";
print "vowels\n";
}

$string = "Sky.";
if (String =~ /[^aeiou]/) {
print "$string doesn't contain any vowels";
}

$string1 = "Hello World\n";
if ($string1 =~ m/(Hello|Hi)/) {
print "Hello or Hi is ";
print "contained in $string1";
}

$string1 = "Hello World\n";
if ($string1 =~ m/ello?\b/) {
print "There is a word that ends with";
print " 'ello'\n";
} else {
print "There are no words that end with";
print "'ello'\n";
}

$string1 = "Hello World\n";
if ($string1 =~ m/\w/) {
print "There is at least one alpha-";
print "numeric char in $string1 (A-Z, a-z, 0-9, _)\n";
}

$string1 = "Hello World\n";
if ($string1 =~ m/\W/) {
print "The space between Hello and ";
print "World is not alphanumeric\n";
}

$string1 = "Hello World\n";
if ($string1 =~ m/\s.*\s/) {
print "There are TWO whitespace ";
print "characters separated by other characters in $string1";
}

$string1 = "Hello World\n";
if ($string1 =~ m/\S.*\S/) {
print "There are TWO non-whitespace ";
print "characters separated by other characters in $string1";
}

$string1 = "99 bottles of beer on the wall.";
if ($string1 =~ m/(\d+)/) {
print "$1 is the first number in '$string1'\n";
}

$string1 = "Hello World\n";
if ($string1 =~ m/\D/) {
print "There is at least one character in $string1";
print "that is not a digit.\n";
}

$string1 = "Hello World\n";
if ($string1 =~ m/^He/) {
print "$string1 starts with the characters 'He'\n";
}

$string1 = "Hello World\n";
if ($string1 =~ m/rld$/) {
print "$string1 is a line or string";
print "that ends with 'rld'\n";
}



