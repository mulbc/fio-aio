BUILD_DATE = $(shell date -u +"%Y-%m-%dT%H:%M:%SZ")
VCS_REF = $(shell git rev-parse HEAD)

build:
	docker build --tag quay.io/mulbc/fio-aio:dev --build-arg "BUILD_DATE=$(BUILD_DATE)" --build-arg "VCS_REF=$(VCS_REF)" .
debug:
	docker run --rm --name=fio -p 8000:8000 -e JOBFILES=example_jobfile.fio -e PLOTNAME=test quay.io/mulbc/fio-aio:dev
release:
	docker tag quay.io/mulbc/fio-aio:dev quay.io/mulbc/fio-aio:latest
	docker push quay.io/mulbc/fio-aio:latest