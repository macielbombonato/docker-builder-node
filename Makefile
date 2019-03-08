REPOSITORY_NAME := macielbombonato
SERVICE_NAME := docker-builder-node
VERSION := latest

DOCKER_FILE := .

IMAGE := $(REPOSITORY_NAME)/$(SERVICE_NAME)

all:
    @if [ "$(TRAVIS_BRANCH)" != "master" ]; then\
        VERSION := $(TRAVIS_BRANCH)
    fi

test:
	docker run $(IMAGE)

image:
	docker build -t $(IMAGE):$(VERSION) $(DOCKER_FILE)

push-image:
	docker push $(IMAGE)


.PHONY: image test push-image 
