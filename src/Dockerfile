FROM debian:12-slim

RUN apt-get update && apt-get install -y samba

ADD entrypoint.sh /samba/entrypoint.sh
RUN chmod +x /samba/entrypoint.sh

EXPOSE 139
EXPOSE 445

ENTRYPOINT '/samba/entrypoint.sh'
