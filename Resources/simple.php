<?php
$file = 'hidden.txt';
file_put_contents($file,str_replace('mike@...','mike@example.com',file_get_contents($file)))
?>

