use strict;
use warnings;
use Data::Dumper;

my $fasta_file = shift or die "Where is your FASTA?";
open(my $fh, "<", $fasta_file);
$/= ">";
my $sequence = "";
my $header = <$fh>;
while(<$fh>){ 
	my $sequence = $_ =~ s/\n//g;
}
#prin	t Dumper \%sequences;

#print "$max_name\n$max \n";

sub get_gc{
	my $name = shift;
	my $sequence = shift;
	my $length = length($sequence);
	my $gc = $sequence =~ tr/GC/GC/;
	return $gc/$length * 100;
}