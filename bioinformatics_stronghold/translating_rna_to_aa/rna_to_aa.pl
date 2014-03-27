use strict;
use warnings;
use Data::Dumper;

my $file = shift;
open(my $rna, "<", $file) 
  or die("$file did not exist!");

my $rna_string = <$rna>;
my $rna_to_aa = load_rna_to_aa_table();

my $aa_string;
while($rna_string){
  my $codon = substr($rna_string, 0, 3);
  $rna_string = substr($rna_string, 3);
  my $aa = $rna_to_aa->{$codon};
  if($aa eq "Stop"){
    last;
  }else{
    $aa_string .= $aa;
  }
}

print "$aa_string\n";

sub load_rna_to_aa_table{
  my $data_file = "./rna_to_aa.txt";
  open(my $table, "<", $data_file)
    or die("I was looking for $data_file, it's not here!");
  
  my %hash;
  while(<$table>){
    chomp;
    my($rna, $aa) = split(/ /, $_);
    $hash{$rna} = $aa;
  }
  return \%hash;
}
