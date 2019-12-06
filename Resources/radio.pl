# Derived from: https://www.perlmonks.org/?node_id=73692
# Now includes new sentences, the new method, and boundary positions
# Lev Lafayette Dec 2019

my @sentence_list = (
            'radiohead',
            'turn up your radio',
            'the radiology machine is broken',
	    'telegraph is preradio',
            'it is nonradioactive',
           );

print "\nOld word boundary method\n";
foreach $sentence (@sentence_list){
    if ($sentence =~ /(^|\W)radio(\W|$)/){
        print "Found in : $sentence\n";
    } else {
        print "Not found\n";
    }
}

print "\nNew word boundary method\n";
foreach $sentence (@sentence_list){
    if ($sentence =~ m/\bradio\b/){
        print "Found in : $sentence\n";
    } else {
        print "Not found\n";
    }
}

print "\nEnd word boundary\n";
foreach $sentence (@sentence_list){
    if ($sentence =~ m/radio\b/){
	print "Found in : $sentence\n";
    } else {
        print "Not found\n";
    }
}

print "\nBeginning word boundary method\n";
foreach $sentence (@sentence_list){
    if ($sentence =~ m/\bradio/){
	print "Found in : $sentence\n"; 
    } else {
        print "Not found\n";
    }
}
