REPOSITORY_NAME := macielbombonato
SERVICE_NAME := docker-builder-node
VERSION := latest

DOCKER_FILE := .

IMAGE := $(REPOSITORY_NAME)/$(SERVICE_NAME)

%:
    @:

all:
	arg := `arg="$(filter-out $@,$(MAKECMDGOALS))" && echo $${arg:-${1}}`
	echo $(arg)
	VERSION := $(arg)

test:
	docker run $(IMAGE)

image:
	docker build -t $(IMAGE):$(VERSION) $(DOCKER_FILE)

push-image:
	docker push $(IMAGE)


.PHONY: image test push-image 
