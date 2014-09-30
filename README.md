Docker awscli
=============

Run a container with awcli and s3cmd installed. For example, you can
run this on CoreOS where awcli and s3cmd are not available. One
use case is to fire up the container to get data from s3 bucket to 
/apps directory and the data can be shared out on the docker host for
other containers to use.

    /usr/bin/docker run --rm -v /var/apps:/apps xueshanf/awscli:latest aws s3 cp --recursive s3://<bucket>/apps/nginx/ /apps/nginx
