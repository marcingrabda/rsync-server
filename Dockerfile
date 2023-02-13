FROM alpine:latest

RUN apk add --no-cache rsync

COPY rsyncd.conf /etc/rsyncd.conf
COPY entrypoint.sh /entrypoint.sh

RUN chmod 600 /etc/rsyncd.conf
RUN chmod 700 /entrypoint.sh
RUN mkdir -p /backup

EXPOSE 873

ENTRYPOINT ["/entrypoint.sh"]