
use strict;
use base "Exporter";
our @EXPORT = qw/wcImplementation/;

sub wcImplementation
{
  
use Switch;

my $w = "false";
my $l = "false"; 
my $c = "false"; 
my $e = "false"; 
my $i = "false"; 
my $d = "false";
 
my $noOptions = "false";
my $total = $#ARGV + 1;


foreach (@ARGV) {

   switch ($_) {

	case "-w"   { $w = "true" }
	case "-l"   { $l = "true" }
	case "-c"   { $c = "true" }
	case "-e"   { $e = "true" }
	case "-i"   { $i = "true" }
	case "-d"   { $d = "true" }
   }
}
 if (( $w =~ /^false/ ) && ( $l =~ /^false/ ) && ( $c =~ /^false/ ) && ( $e =~ /^false/ ) && ( $i =~ /^false/ ) && ( $d =~ /^false/ )){
$noOptions = "true";
}



my $lines = 0;
my $words = 0;
my $characters = 0;
my $integers = 0; 
my $numbers = 0;

my $totalLines = 0;
my $totalWords = 0;
my $totalsCharacters = 0;
my $totalIntegers = 0;
my $totalNumbers = 0;
my $totalFilesNumber = 0; 

if ("$noOptions" =~ /^true/){

foreach my $a(@ARGV) {

	open my $fh1, '<', $a or die;
	  
	      while (my $eachLineOfEachFile = <$fh1>) {

		$lines = $lines + 1;
		$characters = $characters + length($eachLineOfEachFile);
		$words = $words + scalar(split(/\s+/, $eachLineOfEachFile));
		chomp $eachLineOfEachFile;
				
		}

close $fh1;


$totalLines += $lines;
$totalWords += $words;
$totalsCharacters += $characters;	

print "\nFile name: $a \n";
print (" lines - $lines, words - $words, characters - $characters\n");

$words = 0;
$lines = 0;
$characters = 0;

	      
}

if ($total > 1){
	print ("\n");
	print ("Total: lines - $totalLines, words - $totalWords, characters - $totalsCharacters \n");
    }
}else{

	foreach my $a(@ARGV) {

	if (-f $a) {
	$totalFilesNumber = $totalFilesNumber +1;
		open my $fh1, '<', $a or die;
		   if ($e =~ /^false/) {

			while (my $eachLineOfEachFile = <$fh1>) {

			   $lines = $lines + 1;
			   $characters = $characters + length($eachLineOfEachFile);
			   $words = $words + scalar(split(/\s+/, $eachLineOfEachFile));
			   chomp $eachLineOfEachFile;
			   my @splitting = split / /, $eachLineOfEachFile;
	
			   foreach (@splitting) {

				if ($_ =~ /^[-+]?\d+$/) {

				   $integers = $integers +1;

				    }
				}

			   foreach (@splitting) {

				if ($_ =~ /^(([+-]?\d+\.?)|(\.\d+))+(([EeQqDd\^])+([+-])?\d+)?$/) {

				   $numbers = $numbers +1;

				   }
			       }	
			  }
		    }
		else {
		   while (my $eachLineOfEachFile = <$fh1>) {

			if( $eachLineOfEachFile =~ /^[^#]/ ) {

			   $lines = $lines + 1;
			   $characters = $characters + length($eachLineOfEachFile);
			   $words = $words + scalar(split(/\s+/, $eachLineOfEachFile));
			   chomp $eachLineOfEachFile;

			   my @splitting = split / /, $eachLineOfEachFile;
	
			   foreach (@splitting) {

				if ($_ =~ /^\d+$/) {

				   $integers = $integers +1;

				  }
				}

			  foreach (@splitting) {

				if ($_ =~ /^(([+-]?\d+\.?)|(\.\d+))+(([EeQqDd\^])+([+-])?\d+)?$/) {

				   $numbers = $numbers +1;

				  }
			       }
			  }
		       }
		}
		print "\nFile name: $a \n";
		if ( $w  =~ /^true/ ){

			print("words = $words ");
		}

		if ( $l =~ /^true/ ){

			print("lines = $lines ");	
		}

		if ( $c =~ /^true/ ){

			print("characters = $characters ");
		}

		if ( $i =~ /^true/ ){

			print("integers = $integers ");
		}

		if ( $d =~ /^true/ ){

			print("numbers = $numbers ");
		}

		print ("\n");

	$totalLines += $lines;
	$totalWords += $words;
	$totalsCharacters += $characters;
	$totalIntegers += $integers;
	$totalNumbers += $numbers; 

	$words = 0;
	$lines = 0;
	$characters = 0;
	$integers = 0;
	$numbers = 0;

	close $fh1;
	  }


		}

	if ($totalFilesNumber > 1){

		print ("\nTotal: lines - $totalLines, words - $totalWords, characters - $totalsCharacters, integers - $totalIntegers, numbers - $totalNumbers \n");
	}
}
}


