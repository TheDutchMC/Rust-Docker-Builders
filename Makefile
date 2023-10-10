all: build-all

build-all: aarch64-xenial aarch64-darwin armhf-xenial amd64-xenial amd64-darwin amd64-centos7
.PHONY: build-all

generic-darwin:
	cd generic/darwin; \
		docker build -t registry.array21.dev/rust-generic-darwin .
.PHONY: generic-darwin

aarch64-xenial:
	cd aarch64/xenial; \
		docker build -t registry.array21.dev/rust-aarch64-xenial .
.PHONY: aarch64-xenial

aarch64-darwin: generic-darwin
	cd aarch64/darwin; \
		docker build -t registry.array21.dev/rust-aarch64-darwin .
.PHONY: aarch64-darwin

armhf-xenial:
	cd armhf; \
		docker build -t registry.array21.dev/rust-armhf-xenial .
.PHONY: armhf-xenial

amd64-darwin: generic-darwin
	cd x86_64/darwin; \
		docker build -t registry.array21.dev/rust-amd64-darwin .
.PHONY: amd64-darwin

amd64-xenial:
	cd x86_64/darwin; \
		docker build -t registry.array21.dev/rust-amd64-xenial .
.PHONY: amd64-xenial

amd64-centos7:
	cd x86_64/centos7; \
		docker build -t registry.array21.dev/rust-amd64-centos7 .
.PHONY: amd64-centos7

push: build-all
	docker push registry.array21.dev/rust-amd64-darwin
	docker push registry.array21.dev/rust-amd64-xenial
	docker push registry.array21.dev/rust-amd64-centos7
	
	docker push registry.array21.dev/rust-aarch64-xenial
	docker push registry.array21.dev/rust-aarch64-darwin

	docker push registry.array21.dev/rust-armhf-xenial
.PHONY: push