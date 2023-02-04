FROM alpine:3.17

ENV TZ=America/New_York

RUN apk update &&\
    apk add rclone restic postgresql bash docker-cli curl tzdata

RUN echo '0     3       *       *       *       /bin/bash -c "bash /backup.sh |& tee /var/log/backup.log"' >> /var/spool/cron/crontabs/root

CMD ["crond", "-f"]
