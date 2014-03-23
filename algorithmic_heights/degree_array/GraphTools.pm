package GraphTools;
use 5.18.2;
use strict;
use warnings;
use Exporter;

our $VERSION = '1.00';
$VERSION = eval $VERSION;
our @ISA = qw(Exporter);
our @EXPORT = our @EXPORT_OK = qw(degrees);
use Data::Dumper;
=pod

=head1 NAME

GraphTools - A quick modules to work on graphs.

=cut

sub degrees{
  my $file = shift;
  my %graph_hash = process_dataset($file);
  my @array;
  foreach my $vertex (sort{$a <=> $b} (keys %graph_hash)){
    push(@array, scalar @{$graph_hash{$vertex}});
  }
  return @array;
}

sub process_dataset{
  my $file = shift;
  my %graph_hash;
  open(my $fh, "<", $file) or die "File $file could not be opened";
  while(<$fh>){
    chomp;
    next if($. == 1);
    my @pair = split(/ /, $_);
    push(@{$graph_hash{$pair[0]}}, $pair[1]);
    push(@{$graph_hash{$pair[1]}}, $pair[0]);
  }
  return %graph_hash; 
}

1;
