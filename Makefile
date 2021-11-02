.PHONY: docker/build lint build

IMAGE := ledgersheet-generator

docker/build: .build
.build: package.json package-lock.json \
	Dockerfile
	docker build -t $(IMAGE):latest .
	touch .build

lint: docker/build
	docker run -v `pwd`/src:/workdir/src -v `pwd`/dist:/workdir/dist -it --rm \
		$(IMAGE):latest \
		npx htmlhint src/html

build: docker/build
	docker run -v `pwd`/src:/workdir/src -v `pwd`/dist:/workdir/dist -it --rm --entrypoint cp \
		$(IMAGE):latest \
		src/html/sheet.html src/css/sheet.css dist
