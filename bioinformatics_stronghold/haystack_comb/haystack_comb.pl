use strict;
use warnings;

my $file = shift or die("No file passed in!");

open(my $fh, "<", $file) or die("Expecting $file to exist!\n");
my $dna_string = <$fh>;
my $dna_substr = <$fh>;

chomp $dna_string;
chomp $dna_substr;

print "Substring: $dna_substr\n";

my @matches;
while($dna_string =~ m/(?=($dna_substr))/g){
		push(@matches, ($-[0] + 1) );
}

print "@matches\n";