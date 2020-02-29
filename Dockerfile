FROM alpine:3.11
RUN mkdir /data
RUN apk add curl
ADD get_sample.sh /tmp
VOLUME [ "/data" ]
ENTRYPOINT [ "/tmp/get_sample.sh" ]
