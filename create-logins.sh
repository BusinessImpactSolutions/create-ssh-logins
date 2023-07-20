#!/usr/bin/sh

date=`date`;

DIR=~/s/ssh/logins;
SSHDIR=~/.ssh;

# Domain to login 
DOM=$1;
# port for domain 
PORT='';

# custome port or 22
if [ "$2" = '' ]; then 
	PORT='22';
else 
	PORT="$2";
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
	echo "Logging in to $DOM";
	$DIR/$DOM.sh;

else
	# create 

	# if port is empty, then it is 22 by default
	if [ "$2" = '' ]; then 
		# create .sh file without port which will take 22 as default
		echo -e '#!/usr/bin/sh' "\n#$date\nssh $DOM" > $DIR/$DOM.sh
	else 
		# else, create .sh file with custom port
		echo -e '#!/usr/bin/sh' "\n#$date\nssh -p $PORT $DOM" > $DIR/$DOM.sh
	fi

	# set execute bit
	chmod +x $DIR/$DOM.sh
	# show file after creation
	cat $DIR/$DOM.sh;
	# login after creating .sh file for domain 
	ssh -p $PORT $DOM;

fi

