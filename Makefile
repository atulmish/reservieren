# Makefile to build reservieren scs
IMAGE_VERSION=latest
IMAGE_NAME=quay.io/containerbootcamp/reservieren:$(IMAGE_VERSION)

all: image

compile:
	docker-compose -f docker-compose.ci.build.yml up

image: compile
	docker build -t $(IMAGE_NAME) -f reservieren/Dockerfile reservieren
    
image-publish: image
	docker push $(IMAGE_NAME)
