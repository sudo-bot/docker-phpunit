.PHONY: update-tags docker-build

docker-build:
	docker build ./docker \
		--build-arg VCS_REF=`git rev-parse HEAD` \
		--build-arg BUILD_DATE=`date -u +"%Y-%m-%dT%H:%M:%SZ"`

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
	git checkout main
	git tag -s -f -a -m "latest series" latest
	git checkout -
	git push origin refs/tags/latest -f
