<?php
$filename = "hidden.txt";
$handle = fopen($filename, "r"); //open file in read mode
$contents = fread($handle, filesize($filename)); //read file

if (preg_match("/\.org/i", $contents)) // Marked as case-insentive for illustrative purposes.
{
	echo "Found an org\n\n";
}
else
{
	echo "Did not find an org\n\n";
}

$contents = preg_replace("/\.org/i", ".org.au", $contents);

print $contents;

$contents = preg_split ("/(\.com | \.org)/", $contents);

print "$contents[0]\n";
print "$contents[1]\n";
print "$contents[2]\n";
// etc.

fclose($handle); //close file
?>
