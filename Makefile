default: build
	
build:
	docker build -t rsync-server .

run:
	docker run -p 873:873 rsync-server
