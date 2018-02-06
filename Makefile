VERSION=`cat VERSION`

# Docker container images

.PHONY: docker
docker: docker-build docker-publish

.PHONY: docker-build
docker-build:	## Builds container and tag resulting image
	docker build --force-rm --tag vtalks/linkedin-worker .
	docker tag vtalks/linkedin-worker vtalks/linkedin-worker:$(VERSION)

.PHONY: docker-publish
docker-publish:	## Publishes container images
	docker push vtalks/linkedin-worker:$(VERSION)
	docker push vtalks/linkedin-worker:latest

.PHONY: help
help:	## Show this help
	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/##//'