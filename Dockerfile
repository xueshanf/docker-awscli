# To build: docker build -t <namespace>/awscli .
# To run: docker run -it <namespace>/awscli
# cd /apps; aws s3 command

FROM gliderlabs/alpine:3.1
MAINTAINER Xueshan Feng <sfeng@stanford.edu>

RUN apk --update add \
      groff \
      python \
      python-magic \
      py-pip \
      jq \
      curl \
      bash && \
      pip install --upgrade awscli s3cmd && \
      mkdir /root/.aws

COPY get-metadata /usr/local/bin/get-metadata

# Expose data volume
VOLUME /apps
