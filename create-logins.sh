#!/usr/bin/sh

date=`date`;

DOM=$1;
DIR=~/s/ssh/logins;

#
PORT=$2;

if [ $PORT = '' ]; then 
	PORT='22';
fi


#
#ssh-copy-id -P $PORT $DOM

#
if [ -e $DIR/$DOM.sh ]; then

	echo "$DOM already exists";
	echo "Logging in";
	ssh -p $PORT $DOM;

else
	echo -e '#!/usr/bin/sh' "\n#$date\nssh -p $PORT $DOM" > $DIR/$DOM.sh
fi

#
chmod +x $DIR/$DOM.sh

#
cat $DIR/$DOM.sh;

#
#ssh -p $PORT $DOM;


