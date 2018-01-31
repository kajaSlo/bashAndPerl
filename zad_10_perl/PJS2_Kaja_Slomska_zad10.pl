#!/usr/bin/perl
#Kaja Słomska grupa 2
use PJS2_Kaja_Slomska_zad10 qw/checkIfGradeIsProper/;

foreach my $a(@ARGV) {
print("============================================================================================");
print("\n\nFILE NAME: $a\n");
my %nameAndGrade= ();	
my $nameAndSurname;
	open my $fh1, '<', $a or die;
		   

		while (my $eachLineOfEachFile = <$fh1>) {
			my @eachWord = split /\s+/, $eachLineOfEachFile;			
			if ($eachWord[0] =~ /(^[A-z]+$)/ && $eachWord[1] =~ /(^[A-z]+$)|(^[A-z]+_{1}\d{1}$)|(^[A-z]+-{1}[A-z]+_{1}\d{1}$)|(^[A-z]+-{1}[A-z]+$)/) {		
			#	$nameAndSurname = ucfirst(lc($eachWord[0])) . ' ' . ucfirst(lc($eachWord[1]));
			$nameAndSurname = ucfirst(lc($eachWord[1])). ' ' .ucfirst(lc($eachWord[0]))  ;
			
			my $checkGrade = checkIfGradeIsProper($eachWord[2]);
			
			if($checkGrade =~ /^out of range/){
				print STDERR "[ERROR] Number $eachWord[2] is not a proper number\n";
			}else{
				#print(" aaaaa $checkGrade\n");
				if ( $nameAndGrade{ $nameAndSurname } ) {
				#print("\n This name already exists\n");
		          push @{$nameAndGrade{ $nameAndSurname }}, $eachWord[2];
		        } else {
		         $nameAndGrade{ $nameAndSurname  } = [ $eachWord[2] ];
		        }
			}
				
				
	
      } else {
        print STDERR "[ERROR] Line $eachLineOfEachFile is not a proper line. Bad string sequence\n";
      }

			
		#	print ("Hello $nameAndSurname $eachWord[2]\n");
		}

my @totalAverage;
my $totalAverage1 = 0;
print(" ___________________________________________________________________________________________\n");
foreach my $b(sort keys%nameAndGrade){
	print "\n |$b:  ";
	 my @grades = @{$nameAndGrade{$b}};
	 my @gradesAfterConversion;
	 
	 foreach my $grade ( @grades ) {
        print (" $grade ");
        my $num = convertNum($grade);
        push @gradesAfterConversion, $num;
      }
      my $amountOfElements = 0;
      my $total = 0;
      foreach my $d(@gradesAfterConversion) {
      	$amountOfElements = $amountOfElements +1;
      	$total = $total + $d;
      	
      }
      $total = $total/$amountOfElements;
      
      #cutting to two elements after dot
		my $TotalLength = length $total;
		my $substring;
		if($TotalLength > 4){
			
			$substring = substr $total, 0, 4;
			
		}else{
			$substring = $total;
		}
    
      print(" average: $substring");
       push @totalAverage, $total;
      
}
my $amountOfTotalAverageElements = 0;
 foreach my $e(@totalAverage) {
 	$amountOfTotalAverageElements = $amountOfTotalAverageElements +1;
      
      	$totalAverage1 = $totalAverage1 + $e;
      	
      }
print("\n ___________________________________________________________________________________________\n");
my $avg = $totalAverage1/ $amountOfTotalAverageElements;

my $length = length $avg;
my $substring1;
if($length > 4){
	
	$substring1 = substr $avg, 0, 4;
	
}else{
	$substring1 = $avg;
}
print("\nAverage of group grades: $substring1\n");


	close $fh1;
	#print("============================================================================================\n");
}

