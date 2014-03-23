use strict;
use warnings;

my ($months, $age) = ($ARGV[0], $ARGV[1]) or die;
print rabbit_fib($months, $age) . "\n";
sub rabbit_fib{
  my $n = shift;
  my $rabbits = shift;
  return $n if($n == 0 or $n == 1);
  return rabbit_fib($n-1, $rabbits) + (rabbit_fib($n - 2, $rabbits));
}
__END__

1 1 not mature
2 1 mature
3 4 have 3 pairs
4 7 have 3 more
5 

