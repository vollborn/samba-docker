#/bin/bash

exec smbd --configfile="/samba/smb.conf" --foreground --debug-stdout --debuglevel=1 --no-process-group
