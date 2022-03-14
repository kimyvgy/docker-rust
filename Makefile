IMAGE := kimyvgy/rust
TAG ?= 1.58-alpine 1.59-alpine

.PHONY: build

build:
	for tag in $(TAG); do \
		docker build . \
			--tag $(IMAGE):$$tag \
			--build-arg TAG="$$tag" \
	; done

push:
	for tag in $(TAG); do \
		docker push $(IMAGE):$$tag \
	; done

clean:
	docker images $(IMAGE) | tail -n +2 | awk '{ print $$1":"$$2 }' | xargs docker image rm
