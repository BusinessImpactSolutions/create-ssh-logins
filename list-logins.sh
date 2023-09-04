#!/usr/bin/sh

DIR=~/s/ssh/logins

TERM="$1";

if [ "$TERM" = '' ]; then

    echo "USAGE: ";
    echo "\t$0 PartialFileName/SearchTerm";
    echo "";
    
else 
    
    RESULT=`./search.pl "$TERM" `;

    for f in $RESULT;
        do
            echo $f;
        done

fi
