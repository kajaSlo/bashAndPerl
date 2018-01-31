#!/usr/bin/perl
#Kaja Słomska grupa 2

foreach my $argument (3 .. $#ARGV) {

if ($ARGV[$argument] !~ /^.*\.txt/){
	print STDERR "\nFile ";
	print "$ARGV[$argument]";
	print " isn't a text file\n";
	exit 1;
	}

	($r) = (-r $ARGV[$argument]);

	if ( $r != 1){

	print STDERR "\nYou don't have a read access to file ";
	print "$ARGV[$argument]";
	exit 1;

	}
}



if ( ($ARGV[1] =~ /^[1-9]{1}[0-9]{0,10}/) && ($ARGV[2] =~ /^[1-9]{1}[0-9]{0,10}/) && ($ARGV[3] =~ /^.*\.txt/) ) {



if ($ARGV[1] == $ARGV[2]){

foreach my $argument (3 .. $#ARGV) {
		open (FILE,"$ARGV[$argument]");
		$string = ""; 
		while($eachlineofeachfile1 = <FILE>) {
		    $eachlineofeachfile1 =~ s/^\s*(.*?)\s*$/$1/;
		    chomp($eachlineofeachfile1); 
		    $string = $string . " " . $eachlineofeachfile1;
		}

		my @splitting = split /(?<=$ARGV[0])/, $string;

		foreach (@splitting) {
					$totalwordsnumber = $totalwordsnumber + 1;
					if ($totalwordsnumber == $ARGV[1]) {
						print $_," ";
			}
		}
		$totalwordsnumber = 0;
		print "\n\n";
		}

}else{


		if ( $ARGV[2] < $ARGV[1] ) {
			$helpful = $ARGV[1];
			$ARGV[1] = $ARGV[2];
			$ARGV[2] = $helpful;
		}
		
		foreach my $argument (3 .. $#ARGV) {
		open (FILE,"$ARGV[$argument]");
		$string = ""; 
		while($eachlineofeachfile1 = <FILE>) {
		    $eachlineofeachfile1 =~ s/^\s*(.*?)\s*$/$1/;
		    chomp($eachlineofeachfile1); 
		    $string = $string . "" . $eachlineofeachfile1;
		}

		my @splitting = split /(?<=$ARGV[0])/, $string;

		foreach (@splitting) {
					$totalwordsnumber = $totalwordsnumber + 1;
					if ( ($totalwordsnumber >= $ARGV[1]) && ($totalwordsnumber <= $ARGV[2]) ) {
						print $_," ";
			}
		}
		$totalwordsnumber = 0;
		print "\n\n";
		}


}
	
}else{
	print "You put wrong range arguments\n";
}
