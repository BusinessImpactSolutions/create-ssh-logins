#!/usr/bin/sh

date=`date`;

DIR=~/s/ssh/logins;
SSHDIR=~/.ssh;

# Domain to login 
DOM=$1;
# port for domain 
PORT=$2;

# custome port or 22
if [ "$PORT" = '' ]; then 
	PORT='22';
fi

# run ssh-keygen if not already
if [ -f $SSHDIR/id_ed25519.pub ]; then 
	ssh-copy-id -p $PORT $DOM
else 
	#
	ssh-keygen -t ed25519;
fi

# create login script if does not exist 
if [ -e $DIR/$DOM.sh ]; then

	echo "$DOM already exists";
	echo "Logging in";
	ssh -p $PORT $DOM;

else
	# create 
	echo -e '#!/usr/bin/sh' "\n#$date\nssh -p $PORT $DOM" > $DIR/$DOM.sh
	# set execute bit
	chmod +x $DIR/$DOM.sh
	# show file after creation
	cat $DIR/$DOM.sh;
	# login after creating .sh file for domain 
	ssh -p $PORT $DOM;

fi

