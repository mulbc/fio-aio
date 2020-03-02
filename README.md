# FIO-AIO

This repo contains the Dockerfile for quay.io/mulbc/fio-aio

## Usage

The Dockerfile itself contains fio and gnuplot, so that fio runs can be done and gnuplot graphs will be auto-generated from it.
After the run, all files can be browsed on Port 8000

### Demo

To get startd, you can try to run with the supplied test file:

`docker run --rm --name=fio -p 8000:8000 -e JOBFILES=example_jobfile.fio -e PLOTNAME=test quay.io/mulbc/fio-aio:dev`

Once you see:

```shell
+ python -m SimpleHTTPServer 8000
Serving HTTP on 0.0.0.0 port 8000 ...
```

Open your browser and point it to http://localhost:8000

### Running your own jobs

To use your own fio job files - either mount them on `/tmp/fio-data/` and supply their name via the `JOBFILES` variable OR set the `REMOTEFILES`, which will download the file to `/tmp/fio-data/`.
In any case, do not forget to set `JOBFILES`, even if you use `REMOTEFILES`!

The results will also be stored in `/tmp/fio-data` and the content will be browsable on port 8000.

This repo has been inspired by https://github.com/wallnerryan/fio-tools

## Build

`make build`

## Debug

`make debug`

## Release

This updates `latest` on Quay.io:

`make release`