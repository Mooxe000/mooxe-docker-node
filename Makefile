build:
	docker build \
		--build-arg http_proxy=$$http_proxy \
		--build-arg https_proxy=$$https_proxy \
		--build-arg HTTP_PROXY=$$HTTP_PROXY \
		--build-arg HTTPS_PROXY=$$HTTPS_PROXY \
		-t mooxe/node .

rebuild:
	docker build --no-cache \
		--build-arg http_proxy=$$http_proxy \
		--build-arg https_proxy=$$https_proxy \
		--build-arg HTTP_PROXY=$$HTTP_PROXY \
		--build-arg HTTPS_PROXY=$$HTTPS_PROXY \
		-t mooxe/node .

in:
	docker run --rm -ti \
		--name=node \
		-v $$(pwd):/root/node \
			mooxe/node /bin/bash

push:
	docker push mooxe/node
