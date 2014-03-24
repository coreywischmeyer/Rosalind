use strict;
use warnings;
use Memoize;
memoize('rabbit_fib');
my ($months, $age) = ($ARGV[0], $ARGV[1]) or die;
print rabbit_fib($months, $age) . "\n";

sub rabbit_fib{
  my $n = shift;
  my $age = shift;
  return $n if($n == 0 or $n == 1 or $n == -1);
  return rabbit_fib($n - 1, $age) 
  		  	+ rabbit_fib($n - 2, $age)
  		  	- rabbit_fib($n - $age - 1, $age);
}