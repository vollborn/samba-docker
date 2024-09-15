#/bin/bash

if [ ! -f /samba/users.env ]; then
    echo "/samba/users.env file not mounted."
    echo "Exiting..."

    exit
fi

if [ ! -f /samba/smb.conf ]; then
    echo "/samba/smb.conf file not mounted."
    echo "Exiting..."

    exit
fi

while read line; do
    username=$(echo $line | cut -d":" -f1)
    password=$(echo $line | cut -d":" -f2)

    existingUser=$(cat /etc/passwd | cut -d":" -f1 | grep $username)

    if [ -z $existingUser ]; then
        adduser $username
        echo "$password\n$password\n" | passwd $username
        echo "$password\n$password\n" | smbpasswd -a $username
    fi
done < /samba/users.env

exec smbd --configfile="/samba/smb.conf" --foreground --debug-stdout --debuglevel=1 --no-process-group
