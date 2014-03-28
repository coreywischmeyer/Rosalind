use strict;
use warnings;

my $file = shift;
open(my $prot_h, "<", "protein_mass.txt");

my %prot_dict;

while(<$prot_h>){
  chomp;
  my @array = split(/\s+/, $_);
  $prot_dict{$array[0]} = $array[1];
}

open(my $fh, "<", $file) or die("No file!");
my $line = <$fh>;
chomp $line;
my @protein_string = split(//, $line);

my $mass = 0;
foreach(@protein_string){
  print "$_ \n";
  $mass += $prot_dict{$_};
}

print "$mass\n";
