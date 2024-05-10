# your solution here...
#!/bin/bash

#make new env var
export COURSE_ID=DevOpsFursa


echo Hello $USER

if [ -e ~/.token ]; then
    # Get the octal representation of the file permissions
    permissions=$(stat -c "%a" ~/.token)

    # Check if permissions are different from 600
    if [ "$permissions" != "600" ]; then
        echo "Warning: .token file has too open permissions"
    fi
fi

# Change the Umask to 117 for premssion rw only for user and group
umask 117

# add /home/user/command to the PATH var
PATH=$PATH:/home/$USER/usercommands

# PRINT THE data with the current date
CURRENT_DATE=$(date -u +"%Y-%m-%dT%H:%M:%S%:z")
echo the current data is: $CURRENT_DATE

alias ltxt='ls *txt'

tmp_dir="$HOME/tmp"

# Check if ~/tmp directory exists
if [ ! -d "$tmp_dir" ]; then
    # If it doesn't exist, create it
    mkdir -p "$tmp_dir"
else
    # If it exists, remove all contents
    rm -rf "${tmp_dir:?}/"*
fi

fuser -k 8088/tcp
