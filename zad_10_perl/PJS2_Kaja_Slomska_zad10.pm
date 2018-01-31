#Kaja Słomska grupa 2
use strict;
use base "Exporter";
our @EXPORT = qw/checkIfGradeIsProper,convertNum/;


sub checkIfGradeIsProper{
	 my $number = shift;
			
			if($number =~/^[2-5]{1}$/ || $number =~/^[-+][2-5]{1}$/  || $number =~/^[2-5]{1}[-+]$/ || $number =~/^[2-4]{1}[.][0-9]+$/ || $number =~/^[5]{1}[.][0-1]{1}[0-9]*$/ || $number =~/^[5]{1}[.][2]{1}[0-4]*$/ || $number =~/^[5]{1}[.][2]{1}[0-4]{1}[0-9]+$/ || $number =~/^[5]{1}[.][2]{1}[5]{1}$/||$number =~/^[1]{1}[.][7]{1}[5-9]{1}$/ || $number =~/^[1]{1}[.][8-9]{1}[0-9]{1}$/ || $number =~/^[1]{1}[.][7]{1}[5-9]+$/ || $number =~/^[1]{1}[.][7]{1}[5]{1}[0-9]+$/ || $number =~/^^[1]{1}[.][8-9]{1}[0-9]+$/){
				return ("$number");
			}else{
				return ("out of range");
			}
			
		
} 

sub convertNum{
	my $checkGrade = shift;
	

	if($checkGrade =~/^[+][2-5]{1}$/){
		my @splitcharacters = split /\+/, $checkGrade;
		
		$checkGrade = $splitcharacters[1];
		$checkGrade = $checkGrade + 0.25;
		return $checkGrade;
		#print("Grade after trim: $checkGrade\n");
		
	}elsif($checkGrade =~/^[-][2-5]{1}$/){
		my @splitcharacters = split /\-/, $checkGrade;
		
		$checkGrade = $splitcharacters[1];
		$checkGrade = $checkGrade - 0.25;
		return $checkGrade;	
		
	}elsif($checkGrade =~/^[2-5]{1}[-]$/){
		my @splitcharacters = split /\-/, $checkGrade;
		
		$checkGrade = $splitcharacters[0];
		$checkGrade = $checkGrade - 0.25;
		return $checkGrade;
		
	}elsif($checkGrade =~/^[2-5]{1}[+]$/){
		my @splitcharacters = split /\+/, $checkGrade;
		
		$checkGrade = $splitcharacters[0];
		$checkGrade = $checkGrade + 0.25;
		return $checkGrade;
				
	}else{
		return $checkGrade;
	}
	
	
}
