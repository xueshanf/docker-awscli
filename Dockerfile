FROM alpine:edge
MAINTAINER Xueshan Feng <sfeng@stanford.edu>

RUN apk update && apk add \ 
      bash \
      curl \
      less \
      groff \
      jq \
      python \
      py-pip \
      py2-pip && \
      pip install --upgrade pip awscli s3cmd && \
      mkdir /root/.aws

COPY get-metadata /usr/local/bin/get-metadata

# Expose data volume
VOLUME /apps
