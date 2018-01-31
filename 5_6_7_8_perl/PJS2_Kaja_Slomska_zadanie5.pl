#!/usr/bin/perl
#Kaja Słomska grupa 2

foreach my $argument (2 .. $#ARGV) {

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



if ( ($ARGV[0] =~ /^[1-9]{1}[0-9]{0,10}/) && ($ARGV[1] =~ /^[1-9]{1}[0-9]{0,10}/) && ($ARGV[2] =~ /^.*\.txt/) ) {



if ($ARGV[0] == $ARGV[1]){
foreach my $argument (2 .. $#ARGV) {
	open my $infile1, '<', "$ARGV[$argument]" or die $!;

		while (my $eachlineofeachfile1 = <$infile1>) {

			my @splitting1 = split ' ', $eachlineofeachfile1;

			foreach (@splitting1) {

				$totalwordsnumber1 = $totalwordsnumber1 + 1;

				if ( $totalwordsnumber1 == $ARGV[0] ){

					print $_," ";

				}
			}

		}
print "\n\n";
$totalwordsnumber1 = 0;
}
}else{


		if ( $ARGV[1] < $ARGV[0] ) {
			$helpful = $ARGV[0];
			$ARGV[0] = $ARGV[1];
			$ARGV[1] = $helpful;
		}
			foreach my $argument (2 .. $#ARGV) { 

			open my $infile, '<', "$ARGV[$argument]" or die $!;

			while (my $eachlineofeachfile = <$infile>) {

				my @splitting = split ' ', $eachlineofeachfile;

				foreach (@splitting) {

					$totalwordsnumber = $totalwordsnumber + 1;

					if ( ($totalwordsnumber >= $ARGV[0]) && ($totalwordsnumber <= $ARGV[1]) ) {

						print $_," ";

					}
				}
	#print "$.: $line $_"
			}
	print "\n\n";
	$totalwordsnumber = 0;
		}
}
	
}else{
	print "You put wrong range arguments\n";
}
