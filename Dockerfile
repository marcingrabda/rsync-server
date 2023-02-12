ARG USERNAME
ARG PASSWORD

FROM alpine:latest

RUN apk add --no-cache rsync
RUN mkdir -p /backup

COPY rsyncd.conf /etc/rsyncd.conf

EXPOSE 873

CMD ["rsync", "--daemon", "--no-detach", "--verbose", "--log-file=/dev/stdout", "--port=873"]