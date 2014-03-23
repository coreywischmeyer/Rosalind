use 5.18.2;
use strict;
use warnings;

my $file = shift or die "Where's the file";
open(my $fh, "<", $file) or die "Can't open it sucka!";
while(<$fh>){
  next if $. == 1; #Don't need it;
  chomp;
  if($. == 2){
    my @array = split(/ /, $_);
    insertion_sort(\@array);
  }
}

sub insertion_sort{
  my $unsorted = shift;
  my $swaps = 0;
  for(my $i = 1; $i < scalar @{$unsorted}; $i++){
    my $k = $i;
    while($k > 0 and $unsorted->[$k] < $unsorted->[$k-1]){
      ($unsorted->[$k], $unsorted->[$k-1]) = 
                                ($unsorted->[$k-1],  $unsorted->[$k]);
      $swaps++;
      $k = $k - 1;
    }
  }
  say "$swaps";
}
