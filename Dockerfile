ARG ALPINE_VERSION=latest
ARG USERNAME
ARG PASSWORD

FROM alpine:$ALPINE_VERSION

RUN apk add --no-cache rsync \
    && mkdir -p /backup

RUN printf 'use chroot = no\n\
[backup]\n\
path = /backup\n\
read only = no\n\
list = yes\n\
uid = root\n\
gid = root\n\
reverse lookup = no\n'\
> /etc/rsyncd.conf

USER root

EXPOSE 873

CMD ["rsync", "--daemon", "--no-detach", "--verbose", "--log-file=/dev/stdout", "--port=873"]