# rsync-server
Docker image running rsync server compatible with Synology Hyper Backup.

## Run
To start the server run:
```
docker run -d -p 873:873 \
    --restart always \
    -v /media/backup:/backup \
    -e USERNAME=backup \
    -e PASSWORD=backup \
    marcingrabda/rsync-server
```