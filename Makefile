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
	docker push marcingrabda/rsync-server:latest