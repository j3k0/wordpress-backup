FROM ubuntu

MAINTAINER Angelo Veltens <angelo.veltens@online.de>

RUN apt-get update && \
    apt-get install mysql-client -y && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    mkdir /backups

ENV BACKUP_TIME 0 3 * * *

COPY docker-entrypoint.sh /entrypoint.sh
COPY backup restore /bin/

VOLUME /backups

ENTRYPOINT ["/entrypoint.sh"]

CMD ["cron", "-f"]
