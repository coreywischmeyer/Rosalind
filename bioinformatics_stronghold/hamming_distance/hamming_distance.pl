use strict;
use warnings;
my ($seq1, $seq2) = @ARGV;

print hamming_distance($seq1, $seq2) . "\n";

sub hamming_distance{
  my $seq_string_1 = shift;
  my $seq_string_2 = shift;
  my $distance = 0;
   
  if(length($seq1) != length($seq2)){
    return -1;
  }
  my @seq1 = split(//, $seq_string_1);
  my @seq2 = split(//, $seq_string_2);
  for my $i (0 .. $#seq1){
    if($seq1[$i] ne $seq2[$i]){
      $distance++;
    }
  }
  return $distance;
}
