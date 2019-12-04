import re
string1 = "The quick brown fox jumps over the lazy frog"
startend = re.search("^The.*dog$", string1)

if (startend):
        print("String starts with 'The' and ends with 'dog'")
else:
        print("String does not start with 'The' and end with 'dog'")
