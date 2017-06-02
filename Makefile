build:
	docker build -t mooxe/node .

rebuild:
	docker build --no-cache -t mooxe/node .

in:
	docker run --rm -ti \
		--name=node \
		-v $$(pwd):/root/node \
			mooxe/node /bin/bash

push:
	docker push mooxe/node
