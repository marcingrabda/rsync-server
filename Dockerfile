FROM alpine:latest

ARG USERNAME=backup
ARG PASSWORD=backup

RUN apk add --no-cache rsync
RUN mkdir -p /backup

COPY rsyncd.conf /etc/rsyncd.conf
RUN echo "auth users = $USERNAME" >> /etc/rsyncd.conf
RUN echo "$USERNAME:$PASSWORD" > /etc/rsyncd.secrets
RUN chmod 0400 /etc/rsyncd.secrets

EXPOSE 873

CMD ["rsync", "--daemon", "--no-detach", "--verbose"]