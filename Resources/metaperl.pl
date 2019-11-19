# perlmeta.pl
# From examples on Perl programming on Wikibooks, converted in a single script.
# In all examples the 'if' statements return a True value
# Lev Lafayette, November 2019

$string1 = "Hello World";
$string2 = "Sky";
$string3 = "99 bottles of beer on the wall.";

if ($string1 =~ m/...../) {
	print "Test 1. $string1 has length >= 5\n\n";
}

if ($string1 =~ m/(H..).(o..)/) {
	print "Test 2. We matched '$1' and '$2' in $string1\n\n";
}

if ($string1 =~ m/l+/) {
print "Test 3. There are one or more consecutive l's in $string1\n\n";
}

if ($string1 =~ m/H.?e/) {
print "Test 4. There is an 'H' and a 'e' separated by 0-1 characters (Ex: He Hoe) in $string1\n\n";
}

if ($string1 =~ m/(l+?o)/) {
print "Test 5. The non-greedy match with one or more 'l' followed by an 'o' is 'lo', not 'llo' in $string1.\n\n";
}

if ($string1 =~ m/el*o/) {
print "Test 6. In $string1 there is an 'e' followed by zero to many 'l' followed by 'o' (eo, elo, ello, elllo)\n\n";
} else {
print "Test 6. In $string1 there is not an 'e' followed by zero to many 'l' followed by 'o' (eo, elo, ello, elllo)\n\n";
}

if ($string1 =~ m/l{1,2}/) {
print "Test 7. There exists a substring with at least one and at most two l's in $string1\n\n";
}

if ($string1 =~ m/[aeiou]+/) {
print "Test 8. $string1 contains a one or more vowels\n\n";
}

if ($string2 =~ /[^aeiou]/) {
print "Test 9. $string2 doesn't contain any vowels\n\n";
}

if ($string1 =~ m/(Hello|Hi)/) {
print "Test 10. Hello or Hi is contained in $string1\n\n";
}

if ($string1 =~ m/ello?\b/) {
print "Test 11. In $string1 there is a word that ends with 'ello'\n\n";
} else {
print "In $string1 there are no words that end with 'ello'\n\n";
}

if ($string1 =~ m/\w/) {
print "Test 12. There is at least one alpha-numeric char in $string1 (A-Z, a-z, 0-9, _)\n\n";
}

if ($string1 =~ m/\W/) {
print "Test 13. The space between Hello and World is not alphanumeric\n\n";
}

if ($string1 =~ m/\S.*\S/) {
print "Test 14. There are TWO non-whitespace characters separated by other characters in $string1\n\n";
}

if ($string3 =~ m/(\d+)/) {
print "Test 15. $1 is the first number in '$string3'\n\n";
}

if ($string1 =~ m/\D/) {
print "Test 16. There is at least one character in $string1 that is not a digit.\n\n";
}

if ($string1 =~ m/^He/) {
print "Test 17. $string1 starts with the characters 'He'\n\n";
}

if ($string1 =~ m/rld$/) {
print "Test 18. $string1 is a line or string that ends with 'rld'\n\n";
}
