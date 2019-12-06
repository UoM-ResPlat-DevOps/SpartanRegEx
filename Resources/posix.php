<?php
$filename = "hidden.txt";
$handle = fopen($filename, "r"); //open file in read mode
$contents = fread($handle, filesize($filename)); //read file

$searchorg = ereg("(\.)(org)", $contents);
   if( $searchorg == true )
   {
      echo "Found a .org\n\n";
   } else {
      echo "Could not find a .org\n\n";
   }

$contents = ereg_replace("(\.)(org)", ".org.au", $contents);

print $contents;

fclose($handle); //close file

?>
