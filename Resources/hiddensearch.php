<?php
$filename = "hidden.txt";
$fp = fopen($filename, "r"); //open file in read mode
$contents = fread($fp, filesize($filename)); //read file
$retval = ereg("(\.)(com$)", $contents);
   if( $retval == true )
   {
      echo "Found a .com<br>";
   } else {
      echo "Could not found a .com<br>";
   }
fclose($fp); //close file
?>
