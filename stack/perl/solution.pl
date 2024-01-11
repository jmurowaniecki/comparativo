#!/usr/bin/env perl

use strict;
use warnings;
use Digest::MD5 qw(md5_hex);

my @fail = ();

open(FH, '<', $ARGV[0]) or die $!;

while (<FH>) {
    my @line = split(' ', $_);
    my $check = md5_hex($line[0]);

    if ($check ne $line[1]) {
        push(@fail, $line[0] . ' ' . $check);
    }
}

close(FH);

print (join("\n", @fail));
