print "Please enter your firstname and surname (two names only)";
chop ($name = <STDIN>);

if ($name =~ /^\s*(\S+)\s+(\S+)\s*$/) {
# Ignore preceding white space, capture non-whitespace, have at least one whitespace character, capture second non-white space, ignore trailing whitespace.
 print "Hi $1. Your Surname is $2.";
# print non-white space group $1, print non-whitespace group $2
} else {
 print "Sorry, I could not work out your name. I am just a little script and I am not very smart.";
}
print "\n";
