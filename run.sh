#!/bin/sh

set -e
set -x

[ -z "$JOBFILES" ] && echo "Need to set JOBFILES" && exit 1
echo "Found jobs: $JOBFILES"

[ -z "$PLOTNAME" ] && echo "Need to set PLOTNAME" && exit 1
echo "Received plot name $PLOTNAME"

# Purge old data
# rm -rf /tmp/fio-data/*

if [ -n "$REMOTEFILES" ]; then
    IFS=' '
    echo "Gathering remote files..."
    for file in $REMOTEFILES; do
        wget --directory-prefix=/tmp/fio-data/ "$file"
    done
fi

fio --output=fio.output "$JOBFILES"

cat fio.output

fio2gnuplot -t "$PLOTNAME-bw" -b -g -p '*_bw*'
fio2gnuplot -t "$PLOTNAME-iops" -i -g -p '*_iops*'

python -m SimpleHTTPServer 8000
