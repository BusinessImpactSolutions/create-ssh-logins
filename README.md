# Create SSH Logins

Create SSH login files in a given directory 

## Default Directories 

### .ssh Directory 

~/.ssh

### Creates login .sh files in 

~/s/ssh/logins

Will create login files, e.g., ~/s/ssh/logins/user@domain.tld.sh

### Script/App Directory 

~/s/ssh/create-logins

## How to use/run create-logins.sh 

### if SSH port is a custom port other than 22, 

~/s/ssh/create-logins/create-logins.sh user@domain.tld 12345

Will automatically login after creation if no error.

### if default SSH port is 22

~/s/ssh/create-logins/create-logins.sh user@domain.tld

## Run newly created/saved SSH login files: 

~/s/ssh/logins/name@domain.tld

### List all login files 

ls ~/s/ssh/logins


