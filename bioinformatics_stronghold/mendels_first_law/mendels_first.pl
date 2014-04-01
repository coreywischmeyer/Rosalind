use strict;
use warnings;
use List::Util qw( sum );

my $input_file = shift or die("Couldn't find the file");

open(my $fh, "<", $input_file) or die("Could not open the file");

my $line = <$fh>;
chomp($line);
my @dataset = split(/ /, $line);

#This problem is deceptive, it looks like you can take a few strategies.
#One is to calculate all the permutations given and get the stats of 
#Those that came out Dominant for a trait. The other is to branch on
#all three probabilties.

#Find the prob of first choice for each.
#Find the prob of second choice for each.

#So stuck!


print calculate_outcome(\@dataset);

sub calculate_outcome{
  my $dataset = shift;
  my($homozygous, $heterozygous, $homo_recessive) = @{$dataset};
  my $total = $homozygous + $heterozygous + $homo_recessive;
}

sub probability{
}
