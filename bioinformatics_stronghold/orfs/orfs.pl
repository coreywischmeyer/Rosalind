use strict;
use warnings;
use Data::Dumper;
my $string = shift or die;

find_protein_strings($string);
find_protein_strings(reverse_complement($string));

sub reverse_complement{
  my $string = shift;
  $string = reverse($string);
  $string =~ tr/ATCG/TAGC/;
  return $string;
}

sub find_protein_strings{
  my $string = shift;
  my @reading_frames = qw( 0 1 2 );
  my $dna_to_aa = load_dna_codon_table();
  for my $reading_frame (@reading_frames){
    my $aa_string = "";
    my $dna_string = $string;
    my $ORF = 0;
    $dna_string = substr($dna_string, $reading_frame, -1);
    while($dna_string){
      last if(length($dna_string) < 3);
      my $codon = substr($dna_string, 0, 3);
      $dna_string = substr($dna_string, 3);
      if($codon eq "ATG" or $ORF == 1){
        $ORF = 1;
        my $aa = $dna_to_aa->{$codon};
        if($aa eq "Stop"){
          print "$aa_string\n";
          $aa_string = "";
          $ORF = 0;
        }else{
          $aa_string .= $aa; 
        }
      }
    }
  }
}

sub load_dna_codon_table{
  my $data_file = "./dna_codon_table.txt";
  open(my $table, "<", $data_file)
    or die("I was looking for $data_file, it's not here!");

  my %hash;
  while(<$table>){
    chomp;
    my($dna, $aa) = split(/ /, $_);
    $hash{$dna} = $aa;
  }
  return \%hash;
}
