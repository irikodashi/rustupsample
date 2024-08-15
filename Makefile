build:
	docker build -t rustup .

run:
	docker run -it -v $(shell pwd):/root/develop rustup /bin/bash
