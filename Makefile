IMAGE_TAG ?= docker-phpunit

# All: linux/amd64,linux/arm64,linux/riscv64,linux/ppc64le,linux/s390x,linux/386,linux/mips64le,linux/mips64,linux/arm/v7,linux/arm/v6
PLATFORM ?= linux/amd64

ACTION ?= load
PROGRESS_MODE ?= plain

.PHONY: update-tags docker-build docker-test test

docker-build:
	# https://github.com/docker/buildx#building
	docker buildx build \
		--build-arg VCS_REF=`git rev-parse HEAD` \
		--build-arg BUILD_DATE=`date -u +"%Y-%m-%dT%H:%M:%SZ"` \
		--tag $(IMAGE_TAG) \
		--progress $(PROGRESS_MODE) \
		--platform $(PLATFORM) \
		--pull \
		--$(ACTION) \
		./docker

test: docker-test

docker-test:
	docker run --rm ${IMAGE_TAG} --version
	docker run --rm ${IMAGE_TAG} --help

update-tags:
	git checkout 7
	git tag -s -f -a -m "7.x.x series" 7
	git checkout -
	git push origin refs/tags/7 -f
	git checkout 8
	git tag -s -f -a -m "8.x.x series" 8
	git checkout -
	git push origin refs/tags/8 -f
	git checkout 9
	git tag -s -f -a -m "9.x.x series" 9
	git checkout -
	git push origin refs/tags/9 -f
	git checkout 10
	git tag -s -f -a -m "10.x.x series" 10
	git checkout -
	git push origin refs/tags/10 -f
	git checkout main
	git tag -s -f -a -m "latest series" latest
	git checkout -
	git push origin refs/tags/latest -f
