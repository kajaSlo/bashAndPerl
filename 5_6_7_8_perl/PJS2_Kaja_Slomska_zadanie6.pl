#!/usr/bin/perl
#Kaja Słomska grupa 2


$lookingForFirstWord=0;
$lookingForSecondWord=0;
$firstWordFound,$secondWordFound;

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
	foreach my $argument (2 .. $#ARGV) { 
	#print "$argument\n";
			open my $infile, '<', "$ARGV[$argument]" or die $!;
	#print "$ARGV[$argument]\n";
		while (my $eachlineofeachfile = <$infile>) {

			my @splitting = split ' ', $eachlineofeachfile;


			foreach (@splitting) {

				$lookingForFirstWord = $lookingForFirstWord + 1;

				if ( $ARGV[0] == $lookingForFirstWord ) {
					$firstWordFound=$_;
				
				}
			}

			foreach (@splitting) {

				$lookingForSecondWord = $lookingForSecondWord + 1;

				if ( $ARGV[1] == $lookingForSecondWord ) {
					$secondWordFound=$_;
				
				}
			}



		}
	
	

	if ( $firstWordFound !~ /^$/ ) {
	print "\nWord number $ARGV[0] is equal to:  $firstWordFound ";
	}
	else {
	print STDERR "\nPlace for world $ARGV[0] is empty in file $ARGV[$argument]\n"
	}
	if ( $secondWordFound !~ /^$/ ) {
	print ", Word number $ARGV[1] is equal to: $secondWordFound in file $ARGV[$argument]\n";
	
	}
	else {
	print STDERR "\nPlace for world $ARGV[1] is empty in file $ARGV[$argument]\n"
	}

		$lookingForFirstWord = 0;
		$lookingForSecondWord = 0;
		$firstWordFound ="";
		$secondWordFound="";
	}

	
	print "\n";

}else{
	print "You put wrong range arguments\n";
}


