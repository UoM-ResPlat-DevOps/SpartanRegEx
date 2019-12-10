# Modified from Friedl's "Mastering Regular Expressions"
# Inclusion of perl path, kelvin values, initialised values, use warnings
# by Lev Lafayette. 2019

use warnings;

my ($celsius, $fahrenheit, $kelvin) = 0;

print "Enter a temperature (e.g., 32F, 100C, 373.15K):\n";
$input = <STDIN>; # this reads one line from the user
chomp($input); # 'chomp' removes the ending newline from $input

if ($input =~ m/^([-+]?[0-9]+(?:\.[0-9]*)?)\s*([CFK])$/i) {
# If variable matches line starting with positive or negative with optional decimal value.
# $1 is the first number with the whitespace class (s)
# $2 is "C" or "F" or "K", case insensitive.
# The notation (?:..) will group, but not capture.

$InputNum = $1; # Save to named variables to make the ...
$type = $2;     # ... rest of the program easier to read.

if ($type =~ m/c/i) {
# Match c, case insensitive
	$celsius = $InputNum;
	$fahrenheit = ($celsius * 9 / 5) + 32;
	$kelvin = ($celsius + 273.15);
} elsif ($type =~ m/f/i) {
# Match f, case insensitive
	$fahrenheit = $InputNum;
	$celsius = ($fahrenheit - 32) / 1.8;
	$kelvin = ($fahrenheit - 32) / 1.8 + 273.15;
} elsif ($type =~ m/k/i) {
# Match	k, case	insensitive
        $kelvin = $InputNum;
        $celsius = ($kelvin - 273.15);
        $fahrenheit = ($kelvin - 273.15) / 1.8 + 32;
	}

# At this point we have all three temperatures, so display the results:
	printf "%.2f C is %.2f F is %.2f K\n", $celsius, $fahrenheit, $kelvin;
	} else {
# The initial regex did not match, so issue a warning.
	print "Expecting a number followed by \"C\" or \"F\" or \"K\",\n";
	print "so I don’t understand \"$input\".\n";
	}
