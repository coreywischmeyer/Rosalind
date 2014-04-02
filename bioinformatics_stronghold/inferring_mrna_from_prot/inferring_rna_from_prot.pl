use strict;
use warnings;
use bigint;
use YAML qw( LoadFile );
use Data::Dumper;
my $table = LoadFile("rna_to_aa.yaml");

my $new_table = wobble_wobble($table);

#Things are going to get multiplicative!
my  $file = shift or die "Please provide a file!";
open(my $fh, "<", $file) or die "Could not open $file";

my $line = <$fh>;

my $sum = 1;
chomp($line);
while($line){
  my $aa = substr($line, 0, 1,);
  $line = substr($line, 1);
  $sum = $sum * $new_table->{$aa};
}
$sum = $sum * $new_table->{"Stop"} % 1_000_000;
print "$sum \n";

sub wobble_wobble{
  my $hash_ref = shift;
  my $new_ref = {};

  foreach my $key(keys %{$hash_ref}){
    $new_ref->{$hash_ref->{$key}} += 1;
  }

  return $new_ref;
}
