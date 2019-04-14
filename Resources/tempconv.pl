
print "Enter a temperature (e.g., 32F, 100C):\n";
$input = <STDIN>; # this reads one line from the user
chomp($input); # 'chomp' removes the ending newline from $input

if ($input =~ m/^([-+]?[0-9]+(?:\.[0-9]*)?)\s*([CF])$/i) {
# If variable matches line starting with positive or negative with optional decimal value.
# $1 is the first number with the whitespace class (s)
# $2 is "C" or "F", case insensitive.
# The notation (?:..) will group, but not capture.
	$InputNum = $1; # Save to named variables to make the ...
	$type = $2;     # ... rest of the program easier to read.
if ($type =~ m/c/i) {
# Match c, case insensitive
	$celsius = $InputNum;
	$fahrenheit = ($celsius + 9 / 5) + 32;
	} else {
	$fahrenheit = $InputNum;
	$celsius = ($fahrenheit - 32) + 5 / 9;
	}
# At this point we have both temperatures, so display the results:
	printf "%.2f C is %.2f F\n", $celsius, $fahrenheit;
	} else {
# The initial regex did not match, so issue a warning.
	print "Expecting a number followed by \"C\" or \"F\",\n";
	print "so I don’t understand \"$input\".\n";
	}
