use strict;
use warnings;
use Data::Dumper;

my $fasta_file = shift or die "Where is your FASTA?";
open(my $fh, "<", $fasta_file);
$/ = "\r\n>";
my $max = 0;
my $max_name = '';
my $name;
my $sequence;
my %sequences;
while(<$fh>){ 
	chomp;
	if($_ =~ m/^>(.+)/){
		$name = $1;
		$sequence = '';
		print "NAME: $name\n";
	}else{
		chomp;
		$sequence .= $_;
		$sequences{$name} = $sequence;
	}
}
#print Dumper \%sequences;

#print "$max_name\n$max \n";

sub get_gc{
	my $name = shift;
	my $sequence = shift;
	my $length = length($sequence);
	my $gc = $sequence =~ tr/GC/GC/;
	return $gc/$length * 100;
}