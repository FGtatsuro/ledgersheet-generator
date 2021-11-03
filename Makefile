.PHONY: docker/build lint build

IMAGE := ledgersheet-generator

docker/build: .docker_build
.docker_build: package.json package-lock.json \
	.stylelintrc.json \
	Dockerfile
	docker build -t $(IMAGE):latest .
	touch .docker_build

lint: docker/build .lint
.lint: src/html/sheet.html src/css/sheet.css
	docker run -v `pwd`/src:/workdir/src -v `pwd`/dist:/workdir/dist -it --rm \
		$(IMAGE):latest \
		npx htmlhint src/html
	docker run -v `pwd`/src:/workdir/src -v `pwd`/dist:/workdir/dist -it --rm \
		$(IMAGE):latest \
		npx stylelint src/css
	touch .lint

build: docker/build .build
.build: src/html/sheet.html src/css/sheet.css
	docker run -v `pwd`/src:/workdir/src -v `pwd`/dist:/workdir/dist -it --rm --entrypoint cp \
		$(IMAGE):latest \
		src/html/sheet.html src/css/sheet.css dist
	touch .build
