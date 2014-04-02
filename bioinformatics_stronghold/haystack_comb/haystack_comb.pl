use strict;
use warnings;

my $file = shift;

open(my $fh, "<", $file) or die("Expecting $file to exist!\n");
my $dna_string = <$fh>;
my $dna_substr = <$fh>;

if($dna_string =~ /$dna_substr/){
  print "Found!\n";
  print @-;
}
