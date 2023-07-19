#!/usr/bin/sh

date=`date`;

DOM=$1;
DIR=~/s/ssh/logins;

echo -e '#!/usr/bin/sh' "\n#$date\nssh $DOM" > $DIR/$DOM.sh

#
chmod +x $DIR/$DOM.sh

#
cat $DIR/$DOM.sh;

