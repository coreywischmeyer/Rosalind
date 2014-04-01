use feature qw( say );
use strict;
use warnings;

my $number = shift;

my @numbers = (1 .. $number);

get_permutation(@numbers);

#Generate permutations in order
sub get_permutation{
  my @list = @_; 
  say @list;
}
