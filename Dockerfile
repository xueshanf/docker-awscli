# To build: docker build -t <namespace>/awscli .
# To run: docker run -it <namespace>/awscli
# cd /apps; aws s3 command

FROM dockerfile/python
MAINTAINER Xueshan Feng <sfeng@stanford.edu>

RUN pip install --upgrade awscli s3cmd

VOLUME /apps
