#!/bin/sh
set -e

USERNAME=${USERNAME:-user}
PASSWORD=${PASSWORD:-pass}

echo "auth users = $USERNAME" >> /etc/rsyncd.conf
echo "$USERNAME:$PASSWORD" > /etc/rsyncd.secrets
chmod 400 /etc/rsyncd.secrets

rsync --daemon --no-detach --verbose