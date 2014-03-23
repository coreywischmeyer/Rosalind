use v5.10;
use strict;
use warnings;
use File::Basename;
use Carp;
my $file = shift or usage(); 

open(my $fh, "<", $file) or 
     croak("$file could not be opened check to see if it exists");

while(<$fh>){
  chomp;
  my $translated_string = translate($_);
  say "$translated_string";
}

sub translate{
  my $string = shift;
  $string =~ tr/TU/UT/;
  return $string;
}

sub usage{
  my $program = basename($0);
  print <<"EOF";
USAGE:
  $program dna_string_file

DESCRIPTION:
  Translates a DNA string file, not a FASTA,  into a RNA string. 
EOF
exit();
}
__END__



