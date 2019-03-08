REPOSITORY_NAME := macielbombonato
SERVICE_NAME := docker-builder-node
VERSION := latest

DOCKER_FILE := .

BRANCH := $(shell git rev-parse --abbrev-ref HEAD)
HASH := $(shell git rev-parse HEAD)

IMAGE := $(REPOSITORY_NAME)/$(SERVICE_NAME)

all:
	ifneq ($(BRANCH), "master")
		VERSION := $(BRANCH)
	endif

test:
	docker run $(IMAGE)

image:
	docker build -t $(IMAGE):$(VERSION) $(DOCKER_FILE)

push-image:
	docker push $(IMAGE)


.PHONY: image test push-image 
