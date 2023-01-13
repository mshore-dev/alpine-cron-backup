FROM alpine:3.17

RUN apk update &&\
    apk add restic postgresql bash docker-cli curl

RUN echo '0     3       *       *       *       /bin/bash -c "bash /backup.sh |& tee /var/log/backup.log"' >> /var/spool/cron/crontabs/root

CMD ["crond", "-f"]
