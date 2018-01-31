#!/usr/bin/perl
#Kaja Słomska grupa 2

$lookingForFirstWord=0;
$lookingForSecondWord=0;
$firstWordFound,$secondWordFound;

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



		
		foreach my $argument (3 .. $#ARGV) {
		open (FILE,"$ARGV[$argument]");
		$string = ""; 
		while($eachlineofeachfile1 = <FILE>) {
		    $eachlineofeachfile1 =~ s/^\s*(.*?)\s*$/$1/;
		    chomp($eachlineofeachfile1); 
		    $string = $string . " " . $eachlineofeachfile1;
		    
		}
		#print "$string \n";

		my @splitting = split /(?<=$ARGV[0])/, $string;

		foreach (@splitting) {
					$lookingForFirstWord = $lookingForFirstWord + 1;
			if ( $ARGV[1] == $lookingForFirstWord ) {
					$firstWordFound=$_;
				
				}
		}
		
		foreach (@splitting) {

				$lookingForSecondWord = $lookingForSecondWord + 1;

				if ( $ARGV[2] == $lookingForSecondWord ) {
					$secondWordFound=$_;
				
				}
			}

		if ( $firstWordFound !~ /^$/ ) {
	print "\nWord number $ARGV[1] is equal to: $firstWordFound \n";
	}
	else {
	print STDERR "\nPlace for world $ARGV[1] is empty in file $ARGV[$argument]\n"
	}
	if ( $secondWordFound !~ /^$/ ) {
	print "Word number $ARGV[2] is equal to: $secondWordFound in file $ARGV[$argument]\n";
	
	}
	else {
	print STDERR "\nPlace for world $ARGV[2] is empty in file $ARGV[$argument]\n"
	}

		$lookingForFirstWord = 0;
		$lookingForSecondWord = 0;
		$firstWordFound ="";
		$secondWordFound="";

		print "\n";
		}



	
}else{
	print "You put wrong range arguments\n";
}
