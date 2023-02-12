default: build
	
build:
	docker build -t rsync-server --build-arg USERNAME=user,PASSWORD=pass .

run:
	docker run -p 873:873 rsync-server
