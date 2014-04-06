use strict;
use warnings;
use Data::Dumper;
my $string = shift or die;

my @reading_frames = qw( 0 1 2 3 4 5 6 );
my $dna_to_aa = load_dna_codon_table();
for my $reading_frame (@reading_frames){
  my $aa_string = "";
  my $dna_string = $string;
  my $ORF = 0;
  $dna_string = substr($dna_string, $reading_frame, -1);
  print "START: $dna_string \n";
  while($dna_string){
    last if(length($dna_string) < 3);
    my $codon = substr($dna_string, 0, 3);
    $dna_string = substr($dna_string, 3);
    print "RF: $reading_frame Codon: $codon \n";
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
