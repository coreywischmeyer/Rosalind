use strict;
use warnings;
use bigint;
use Math::BigInt;

my($x, $y) = @ARGV or die;
my $permutations = Math::BigInt->new($x);
my $objects = Math::BigInt->new($y);
print $permutations->bnok($objects) % 1_000_000;