use 5.18.0;
use Test::Simple;
use POSIX;
use strict;
use warnings;
use Data::Dumper;
use Math::Round;

prepare_data(shift);

sub prepare_data{
  my $filename = shift;
  open(my $fh, '<', $filename);
  my @data = <$fh>;
  chomp @data;
  my $dictionary_size = $data[0] - 1;
  my $search_size = $data[1];
  my @dictionary = split(/ /, $data[2]);
  my @search = split(/ /, $data[3]);
  my $start = round($dictionary_size / 2);
  my @answers;
  foreach(@search){
    push @answers, binary_search(\@dictionary, $_, 0, $dictionary_size);
  }
  say "@answers";
}

sub binary_search{
  my $a = shift;
  my $key = shift;
  my $imin = shift;
  my $imax = shift;
  if($imax < $imin){
    return -1;
  }else{
    my $imid = midpoint($imin, $imax);
    if($a->[$imid] > $key){
      return binary_search($a, $key, $imin, $imid-1);
    }elsif($a->[$imid] < $key){
      return binary_search($a, $key, $imid+1, $imax);
    }else{
      return $imid + 1;
    }
  }
}

sub midpoint{
  my $imin = shift;
  my $imax = shift;

  return round($imin + (($imax - $imin) / 2));
}
