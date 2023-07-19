#!/usr/bin/sh

date=`date`;

DOM=$1;
DIR=~/s/ssh/logins;

echo -e '#!/usr/bin/sh' "\n#$date\nssh envy@ns40.biz-land.com" $DIR/$DOM.sh
