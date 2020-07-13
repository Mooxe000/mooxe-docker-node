build:
	buildah bud --layers \
		--build-arg http_proxy=$$http_proxy \
		--build-arg https_proxy=$$https_proxy \
		--build-arg HTTP_PROXY=$$HTTP_PROXY \
		--build-arg HTTPS_PROXY=$$HTTPS_PROXY \
		-t mooxe/node .

rebuild:
	buildah bud --no-cache \
		--build-arg http_proxy=$$http_proxy \
		--build-arg https_proxy=$$https_proxy \
		--build-arg HTTP_PROXY=$$HTTP_PROXY \
		--build-arg HTTPS_PROXY=$$HTTPS_PROXY \
		-t mooxe/node .

in:
	podman run --rm -ti \
		--name=node \
		-p 3000:3000 \
		-p 8080:8080 \
		-v $$(pwd):/root/node \
			mooxe/node /bin/bash

push:
	podman push mooxe/node
