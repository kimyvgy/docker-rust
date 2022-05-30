IMAGE := kimyvgy/rust
TAG ?= 1.58 1.59 1.61

.PHONY: build

alpine:
	for tag in $(TAG); do \
		docker build . \
			-f alpine.Dockerfile \
			--tag $(IMAGE):"$$tag-alpine" \
			--build-arg TAG="$$tag-alpine" \
	; done

buster:
	for tag in $(TAG); do \
		docker build . \
			-f buster.Dockerfile \
			--tag $(IMAGE):"$$tag-buster" \
			--build-arg TAG="$$tag-buster" \
	; done

push:
	for tag in $(TAG); do \
		docker push $(IMAGE):$$tag-alpine && \
		docker push $(IMAGE):$$tag-buster \
	; done

clean:
	docker images $(IMAGE) | tail -n +2 | awk '{ print $$1":"$$2 }' | xargs docker image rm
