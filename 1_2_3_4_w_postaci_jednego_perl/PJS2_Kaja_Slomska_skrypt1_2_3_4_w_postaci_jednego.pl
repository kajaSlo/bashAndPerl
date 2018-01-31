#!/usr/bin/perl


if (( ($ARGV[0] =~ /^-[N]/) && ($ARGV[1] =~ /^-[p]/) && ($ARGV[2] =~ /^-[c]/)) || ( ($ARGV[0] =~ /^-[N]/) && ($ARGV[1] =~ /^-[c]/) && ($ARGV[2] =~ /^-[p]/)) || (($ARGV[0] =~ /^-[p]/) && ($ARGV[1] =~ /^-[N]/) && ($ARGV[2] =~ /^-[c]/)) || (($ARGV[0] =~ /^-[c]/) && ($ARGV[1] =~ /^-[N]/) && ($ARGV[2] =~ /^-[p]/)) || (($ARGV[0] =~ /^-[c]/) && ($ARGV[1] =~ /^-[p]/) && ($ARGV[2] =~ /^-[N]/)) || (($ARGV[0] =~ /^-[p]/) && ($ARGV[1] =~ /^-[c]/) && ($ARGV[2] =~ /^-[N]/))  )  {
print "you entered -p -N -c, or -N -p -c, or -c -N -p, or -c -p -N, or -p -c -N, or -N -c -p\n";
my @array = ();
	foreach my $argument (3 .. $#ARGV) { 

	open my $infile, '<', "$ARGV[$argument]" or die $!;
	
	while( my $line = <$infile> ) {

	    $line =~ /^#/ and next;
	    print "$.: $line";

	}

	
	close $infile;

	}

}elsif (( ($ARGV[0] =~ /^-[N]/) && ($ARGV[1] =~ /^-[p]/) && ($ARGV[2] =~ /^-[n]/)) || ( ($ARGV[0] =~ /^-[N]/) && ($ARGV[1] =~ /^-[n]/) && ($ARGV[2] =~ /^-[p]/)) || (($ARGV[0] =~ /^-[p]/) && ($ARGV[1] =~ /^-[N]/) && ($ARGV[2] =~ /^-[n]/)) || (($ARGV[0] =~ /^-[n]/) && ($ARGV[1] =~ /^-[N]/) && ($ARGV[2] =~ /^-[p]/)) || (($ARGV[0] =~ /^-[n]/) && ($ARGV[1] =~ /^-[p]/) && ($ARGV[2] =~ /^-[N]/)) || (($ARGV[0] =~ /^-[p]/) && ($ARGV[1] =~ /^-[n]/) && ($ARGV[2] =~ /^-[N]/))  )  {
print "you entered -p -N -n, or -N -p -n, or -n -N -p, or -n -p -N, or -p -n -N, or -N -n -p\n";


my @array = ();
	foreach my $argument (3 .. $#ARGV) { 

	open my $infile, '<', "$ARGV[$argument]" or die $!;
	
	while( my $line = <$infile> ) {

	    $line =~ /^#/ and next;
	    push @array, "$line";

	}

	my $var = 1;
	foreach my $n (@array) {
 	 print " $var: $n";
	++$var;
	}
	
	close $infile;

	undef(@array)
	}

}elsif (( ($ARGV[0] =~ /^-[N]/) && ($ARGV[1] =~ /^-[c]/) && ($ARGV[2] =~ /^.*\.txt/) ) || ( ($ARGV[0] =~ /^-[c]/) && ($ARGV[1] =~ /^-[N]/) && ($ARGV[2] =~ /^.*\.txt/))){
   	print " you entered -N -c or -c -N \n";

my ($firstargument, $secondargument, $file1, $file2, $file3, $file4, $file5, $file6, $file7, $file8, $file9, $file10) = @ARGV;

open my $fh1, '<', $file1;
open my $fh2, '<', $file2;
open my $fh3, '<', $file3;
open my $fh4, '<', $file4;
open my $fh5, '<', $file5;
open my $fh6, '<', $file6;
open my $fh7, '<', $file7;
open my $fh8, '<', $file8;
open my $fh9, '<', $file9;
open my $fh10, '<', $file10;

my $counter = 1;
while (my $line = <$fh1>) {
if($line =~ /^#/ ) {$counter++ and next;} 
print $counter++ . ': ';
    print $line;
}
while (my $line = <$fh2>) {

if($line =~ /^#/ ) {$counter++ and next;} 
print $counter++ . ': ';
    print $line;
}
while (my $line = <$fh3>) {
if($line =~ /^#/ ) {$counter++ and next;} 
print $counter++ . ': ';
    print $line;
}

while (my $line = <$fh4>) {
if($line =~ /^#/ ) {$counter++ and next;} 
print $counter++ . ': ';
    print $line;
}

while (my $line = <$fh5>) {
if($line =~ /^#/ ) {$counter++ and next;} 
print $counter++ . ': ';
    print $line;
}

while (my $line = <$fh6>) {
if($line =~ /^#/ ) {$counter++ and next;} 
print $counter++ . ': ';
    print $line;
}

while (my $line = <$fh7>) {
if($line =~ /^#/ ) {$counter++ and next;} 
print $counter++ . ': ';
    print $line;
}

while (my $line = <$fh8>) {
if($line =~ /^#/ ) {$counter++ and next;} 
print $counter++ . ': ';
    print $line;
}

while (my $line = <$fh9>) {
if($line =~ /^#/ ) {$counter++ and next;} 
print $counter++ . ': ';
    print $line;
}

while (my $line = <$fh10>) {
if($line =~ /^#/ ) {$counter++ and next;} 
print $counter++ . ': ';
    print $line;
}


close $fh1;
close $fh2;
close $fh3;
close $fh4;
close $fh5;
close $fh6;
close $fh7;
close $fh8;
close $fh9;
close $fh10;


   	
}elsif (( ($ARGV[0] =~ /^-[N]/) && ($ARGV[1] =~ /^-[n]/) && ($ARGV[2] =~ /^.*\.txt/)) || ( ($ARGV[0] =~ /^-[n]/) && ($ARGV[1] =~ /^-[N]/) && ($ARGV[2] =~ /^.*\.txt/)))  {
print "you entered -n -N or -N -n\n";
my @array = ();
	foreach my $argument (2 .. $#ARGV) { 

	open my $infile, '<', "$ARGV[$argument]" or die $!;
	
	while( my $line = <$infile> ) {
	   # $line =~ /^$/ and next;
	    $line =~ /^#/ and next;
	    push @array, "$line";

	}


	close $infile;
	
	}

my $var = 1;
	foreach my $n (@array) {
 	 print " $var: $n";
	++$var;
	}

}elsif (( ($ARGV[0] =~ /^-[N]/) && ($ARGV[1] =~ /^-[p]/) && ($ARGV[2] =~ /^.*\.txt/)) || ( ($ARGV[0] =~ /^-[p]/) && ($ARGV[1] =~ /^-[N]/) && ($ARGV[2] =~ /^.*\.txt/)))  {
print "you entered -p -N or -N -p\n";
my @array = ();
	foreach my $argument (2 .. $#ARGV) { 

	open my $infile, '<', "$ARGV[$argument]" or die $!;
	
	while( my $line = <$infile> ) {
	    $line =~ /^#/ and next;
	    push @array, "$line";

	}

	my $var = 1;
	foreach my $n (@array) {
 	 print " $var: $n";
	++$var;
	}
	
	close $infile;

	undef(@array)
	}

}elsif (( ($ARGV[0] =~ /^-[c]/) && ($ARGV[1] =~ /^-[p]/) && ($ARGV[2] =~ /^.*\.txt/)) || ( ($ARGV[0] =~ /^-[p]/) && ($ARGV[1] =~ /^-[c]/) && ($ARGV[2] =~ /^.*\.txt/)))  {
print "you entered -p -c or -c -p\n";
foreach my $argument (2 .. $#ARGV) { 

		open my $infile, '<', "$ARGV[$argument]" or die $!;
	
		while( my $line = <$infile> ) {
		    print "$.:$line";
		   
		}


		close $infile;
	
		}

}elsif (( ($ARGV[0] =~ /^-[n]/) && ($ARGV[1] =~ /^-[p]/) && ($ARGV[2] =~ /^.*\.txt/)) || ( ($ARGV[0] =~ /^-[p]/) && ($ARGV[1] =~ /^-[n]/) && ($ARGV[2] =~ /^.*\.txt/)))  {
print "you entered -p -n or -n -p\n";
	my @array = ();
	foreach my $argument (2 .. $#ARGV) { 

	open my $infile, '<', "$ARGV[$argument]" or die $!;
	
	while( my $line = <$infile> ) {
	    print "$.: $line";

	}

	
	close $infile;

	}

}elsif (($ARGV[0] =~ /^-[n]/) && ($ARGV[1] =~ /^.*\.txt/)) {
print "you entered -n \n";
	my @array = ();
		foreach my $argument (1 .. $#ARGV) { 

		open my $infile, '<', "$ARGV[$argument]" or die $!;
	
		while( my $line = <$infile> ) {
		    push @array, "$line";

		}


		close $infile;
	
		}

	my $var = 1;
		foreach my $n (@array) {
	 	 print " $var: $n";
		++$var;
		}

}elsif (($ARGV[0] =~ /^-[c]/) && ($ARGV[1] =~ /^.*\.txt/)) {
print "you entered -c \n";
	
	my @array = ();
		foreach my $argument (1 .. $#ARGV) { 

		open my $infile, '<', "$ARGV[$argument]" or die $!;
	
		while( my $line = <$infile> ) {

		    push @array, "$line";

		}


		close $infile;
	
		}

	my $var = 1;
		foreach my $n (@array) {
	 	 print " $var: $n";
		++$var;
		}

}elsif (($ARGV[0] =~ /^-[N]/) && ($ARGV[1] =~ /^.*\.txt/))  {
print "you entered -N \n";
	
	my @array = ();
		foreach my $argument (1 .. $#ARGV) { 

		open my $infile, '<', "$ARGV[$argument]" or die $!;
	
		while( my $line = <$infile> ) {

		    $line =~ /^#/ and next;
		    print "$line";
		   
		}


		close $infile;
	
		}


}elsif (($ARGV[0] =~ /^-[p]/) && ($ARGV[1] =~ /^.*\.txt/))  {
print "you entered -p \n";
	

		foreach my $argument (1 .. $#ARGV) { 

		open my $infile, '<', "$ARGV[$argument]" or die $!;
	
		while( my $line = <$infile> ) {

		    print "$.:$line";
		   
		}


		close $infile;
	
		}


}elsif( ($ARGV[0] !~ /^-[N,n,c,p]/) && ($ARGV[0] =~ /^.*\.txt/)) {
   	print <>;
   	
}else{
	print "You executed a program without passing text files as arguments or you put wrong arguments or you doubled some argument ( it's not a proper behaviour ) \nor you put arguments without text files to work with\n";
}
