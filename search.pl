#!/usr/bin/env perl

use strict; 
use warnings;

our( $term, @match );

$term = $ARGV[0]; 

my $DIR = '/home/ns21u2204/s/ssh/logins';

@match = &show_match( term => $term );

##print qq{results for $term\n};

foreach (@match) { 
    print qq{$_\n};
}

sub show_match {


    my %in = (
        term => '',
        @_,
    );

    my @res;

    if ( opendir(my $dir, "$DIR") ) {
        my @dir = readdir($dir);
        for my $file (@dir) {
            next if $file =~ /^\.$/;
            next if $file =~ /^\.\.$/;
            if ( $file =~ /$in{term}/ ) {
                push(@res, "$file");
            } else {
                ##$res[0] = "No Match";
                ##exit 0;
            }
        }
    } else {
        $res[0] = "Unable to open dir $DIR\n"
    }
        
    return @res;

}

1;


__DATA__


