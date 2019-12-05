<?php
   $email_id = "admin@tutorialspoint.com";
   $retval = ereg("(\.)(com$)", $email_id);
   
   if( $retval == true )
   {
      echo "Found a .com<br>";
   } else {
      echo "Could not found a .com<br>";
   }
	
   $retval = ereg(("(\.)(com$)"), $email_id, $regs);
   
   if( $retval == true )
   {
      echo "Found a .com and reg = ". $regs[0];
   } else {
      echo "Could not found a .com";
   }
	
?>
