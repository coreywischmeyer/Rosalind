use strict;
use warnings;

my $input_file = shift or die("Couldn't find the file");

open(my $fh, "<", $input_file) or die("Could not open the file");

my $line = <$fh>;
chomp($line);
my @dataset = split(/ /, $line);

print calculate_outcome(\@dataset);

sub calculate_outcome{
  my $dataset = shift;
  my($homozygous, $heterozygous, $homo_recessive) = @{$dataset};
  my $total = $homozygous + $heterozygous + $homo_recessive;
  return (p($homozygous, $homozygous, $total) 
          + p($homozygous, $heterozygous, $total)); 
          
}

