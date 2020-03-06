BEGIN {
FS=",";
print "EVENT_ID\tLatitude\tLongitude";
}
{	if (NR >1 && NR !=6 && NR <9)
	print $1"\t"$3"\t"$4;
}
END {
	print NR,"Records Processed";

}
