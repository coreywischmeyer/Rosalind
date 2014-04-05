use strict;
use warnings;
use Data::Dumper;
my $string = shift or die;

my @reading_frames = qw(0 1 2);
my $dna_to_aa = load_dna_codon_table();
for my $reading_frame (@reading_frames){
  my $aa_string = "";
  my $dna_string = $string;
  my $ORF = 0;
  while($dna_string){
    print "DNA: $dna_string " . length($dna_string) . "\n";
    my $codon = substr($dna_string, $reading_frame, ($reading_frame + 3));
    $dna_string = substr($dna_string, ($reading_frame + 3));
    if($codon eq "AUG" or $ORF){
      $ORF = 1;
      my $aa = $dna_to_aa->{$codon};
      if($aa eq "Stop" or length($dna_string) < 3 ){
        print "$aa_string \n";
        last;
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
