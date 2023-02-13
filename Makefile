default: build
	
build:
	docker build -t rsync-server .

run:
	docker run \
	-p 873:873 \
	-e USERNAME=backup \
	-e PASSWORD=backup \
	rsync-server

push:
	docker image tag rsync-server marcingrabda/rsync-server:latest
	docker push marcingrabda/rsync-server:latest