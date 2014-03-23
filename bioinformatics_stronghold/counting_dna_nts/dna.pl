use strict;
use warnings;

my $dna_string = shift;

print count_nt($dna_string);

sub count_nt{
	my $dna_string = shift;
	$dna_string = lc($dna_string);
	my @dna_array = split(//, $dna_string);
	my $a_count = 0;
	my $c_count = 0;
	my $t_count = 0;
	my $g_count = 0;
	my $unknown_nucleotide = 0;
	foreach(@dna_array){
		if($_ eq "a"){
			$a_count++;
		}elsif($_ eq "g"){
			$g_count++;
		}elsif($_ eq "c"){
			$c_count++;
		}elsif($_ eq "t"){
			$t_count++;
		}else{
			$unknown_nucleotide++;
		}
	}
	return sprintf("A: %s T: %s G: %s C: %s", $a_count, $t_count, $g_count, $c_count);
}