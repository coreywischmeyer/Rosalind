use strict;
use warnings;

my $num_elements = shift or die("You did not supply a number");
print get_permutations($num_elements);
sub get_permutations{
	my $num_elements = shift;
	my @elements = (1 .. $num_elements);
	my $k = 0;
	my $l;
	my $count = 0;
	my $element_string;
	while($k != -1){
		$element_string .= "@elements\n";
		for($k = scalar @elements - 2; $k >= 0; $k--){
			if($elements[$k] < $elements[$k + 1]){
				last;
			}
		}
		for($l = scalar @elements - 1; $l > $k; $l--){
			if($elements[$k] < $elements[$l]){
				last;
			}
		}
		($elements[$k],$elements[$l]) = ($elements[$l], $elements[$k]);
		@elements[($k + 1) .. (scalar @elements - 1)] = reverse(@elements[($k + 1) .. (scalar @elements - 1)]);
		$count++;
	}
	return "$count\n$element_string";
}