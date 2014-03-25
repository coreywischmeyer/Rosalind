use strict;
use warnings;
use Data::Dumper;

my $fasta_file = shift or die "Where is your FASTA?";
open(my $fh, "<", $fasta_file);

$/= ">";

my $header = <$fh>;
my $sequence;
my $max_header = "";
my $max_gc = 0;
while(<$fh>){
  chomp;
  if($_ =~ m/(.+)\n/){
   $header = $1;
   s/$header//;
  }
  ($sequence = $_) =~  s/\n//g;
  if((my $curr_gc = get_gc($sequence)) > $max_gc){
    $max_gc = $curr_gc;
    $max_header = $header;
  }
}

print "$max_header\n$max_gc\n";

sub get_gc{
	my $sequence = shift;
	my $length = length($sequence);
	my $gc = $sequence =~ tr/GC/GC/;
	return $gc/$length * 100;
}
