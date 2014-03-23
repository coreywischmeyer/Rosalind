use strict;
use warnings;

my $input = shift or die("Please provide input string");

print reverse(complement($input)) . "\n";

sub complement{
  my $string = shift;
  $string =~ tr/ATCG/TAGC/;
  return $string;
}
