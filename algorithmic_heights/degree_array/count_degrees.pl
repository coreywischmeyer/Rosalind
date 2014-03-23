use 5.18.2;
use strict;
use warnings;
use lib '../degree_array';
use GraphTools;

my @array = degrees(shift);
say "@array";
