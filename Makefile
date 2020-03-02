build:
	BUILD_DATE=$(date -u +"%Y-%m-%dT%H:%M:%SZ")
	docker build --tag quay.io/mulbc/fio-aio:dev .
debug:
	docker run --rm --name=fio -p 8000:8000 -e JOBFILES=example_jobfile.fio -e PLOTNAME=test quay.io/mulbc/fio-aio:dev
release:
	docker tag quay.io/mulbc/fio-aio:dev quay.io/mulbc/fio-aio:latest
	docker push quay.io/mulbc/fio-aio:latest