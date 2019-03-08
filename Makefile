REPOSITORY_NAME := macielbombonato
SERVICE_NAME := docker-builder-node

DOCKER_FILE := .

IMAGE := $(REPOSITORY_NAME)/$(SERVICE_NAME)

%:
    @:

image:
	docker build -t $(IMAGE):$(filter-out $@,$(MAKECMDGOALS)) $(DOCKER_FILE)

push-image:
	docker push $(IMAGE):$(filter-out $@,$(MAKECMDGOALS))

.PHONY: image push-image 
