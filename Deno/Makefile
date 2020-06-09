build:
	buildah bud --layers \
		--build-arg http_proxy=$$http_proxy \
		--build-arg https_proxy=$$https_proxy \
		--build-arg HTTP_PROXY=$$HTTP_PROXY \
		--build-arg HTTPS_PROXY=$$HTTPS_PROXY \
		-t mooxe/deno .

rebuild:
	buildah bud --no-cache \
		--build-arg http_proxy=$$http_proxy \
		--build-arg https_proxy=$$https_proxy \
		--build-arg HTTP_PROXY=$$HTTP_PROXY \
		--build-arg HTTPS_PROXY=$$HTTPS_PROXY \
		-t mooxe/deno .

in:
	podman run --rm -ti \
		--name=deno \
		-p 8080:8080 \
		-v $$(pwd):/root/deno \
			mooxe/deno /bin/bash

push:
	podman push mooxe/deno
