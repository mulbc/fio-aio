FROM alpine:latest
LABEL maintainer="Chris Blum <cblum@redhat.com>"

# Metadata as defined at http://label-schema.org
ARG BUILD_DATE
ARG VCS_REF

LABEL org.label-schema.build-date=$BUILD_DATE \
    org.label-schema.name="fio-aio" \
    org.label-schema.vcs-ref=$VCS_REF \
    org.label-schema.vcs-url="https://github.com/mulbc/fio-aio" \
    org.label-schema.schema-version="1.0"

RUN mkdir /myvol
RUN apk add --update fio wget python2 gnuplot py2-pip fontconfig ttf-ubuntu-font-family msttcorefonts-installer \
    && update-ms-fonts \
    && fc-cache -f \
    && rm -rf /var/cache/apk/*
# Dependency for fio2gnuplot
RUN pip2 install six

ADD run.sh /bin
ADD example_jobfile.fio /tmp/fio-data/

VOLUME [ "/tmp/fio-data" ]
WORKDIR /tmp/fio-data

EXPOSE 8000
CMD ["/bin/run.sh"]