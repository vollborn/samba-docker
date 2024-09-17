# Samba Docker

This container starts a simple Samba server.

## Getting started

Use this docker-compose file to get started:

```yaml
services:
    samba:
        image: vollborn/samba:latest
        ports:
            - "139:139"
            - "445:445"
        volumes:
            - "./users.env:/samba/users.env"
            - "./smb.conf:/samba/smb.conf"
            - "./data:/samba/data"
```

You need to mount three volumes:
1. your users.env, containing all samba users and their passwords
2. your smb.conf, containing your samba configuration. Find further instructions [here](https://wiki.ubuntuusers.de/Samba_Server/smb.conf/).
3. your data directory, containing the directories for your samba shares defined in the smb.conf.

### users.env

The users.env contains all samba users and their passwords. Each line defines a new user.
<br>The syntax is as follows:

```
<username>:<password>
```

For example:

```
testadmin:adminpassword
testuser:testpassword
```
