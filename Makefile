USERNAME=backup
PASSWORD=backup

default: build
	
build:
	docker build -t rsync-server \
		--build-arg USERNAME=$(USERNAME) \
		--build-arg PASSWORD=$(PASSWORD) \
		.

run:
	docker run -p 873:873 rsync-server
