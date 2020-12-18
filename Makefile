NAME = registry.staiger.it/ekofr/pihole-exporter
VERSION = latest
FILE = Dockerfile.armv7

.PHONY: build build-nocache test tag-latest push push-latest release git-tag-version

build:
	docker build -t $(NAME):$(VERSION) -f $(FILE) --rm .

build-nocache:
	docker build -t $(NAME):$(VERSION) -f $(FILE) --no-cache --rm .

tag:
	docker tag $(NAME):$(VERSION) $(NAME):$(VERSION)

tag-latest:
	docker tag $(NAME):$(VERSION) $(NAME):latest

push:
	docker push $(NAME):$(VERSION)

push-latest:
	docker push $(NAME):latest

release: build tag-latest push push-latest

git-tag-version: release
	git tag -a v$(VERSION) -m "v$(VERSION)"
	git push origin v$(VERSION)
