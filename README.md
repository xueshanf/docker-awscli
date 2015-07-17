Docker awscli
=============

An AWS CLI toolbox in container. See Dockerfile.
This repo triggers auto-build and push images to dockerhub.com/u/xueshanf/awscli.

To check AWS cli version

```
docker run --rm  xueshanf/awscli aws --version
docker run --rm  xueshanf/awscli s3cmd --version 
```

Examples
========

Rebuild image. This will upgrade the package too:

```
core@n1 git clone https://github.com/xueshanf/docker-awscli.git
core@n1 docker build -t xueshanf/awscli:latest .
```

Ready-made tools:

```
core@n1 docker run --rm  xueshanf/awscli get-metadata help
Usage: get-metadata <argument>
ACCOUNT
HOSTNAME
INSTANCEID
PRIVATEIP
PUBLICIP
ROLE
STSCRED
STSTOKEN
STSKEY
SECRET
ZONE

core@n1 docker run --rm  xueshanf/awscli get-metadata instanceid
i-453266b2
```
Command line argument is not case sensitve. 

Copy data from s3 bucket to local file system:

```
core@n1 /usr/bin/docker run --rm -v /var/apps:/apps xueshanf/awscli:latest aws s3 cp s3://<bucket>/apps/nginx/ /apps/nginx
```

Register an AWS instance with a load balancer.
Pass in AWS credential (not needed if the instances has IAM role based permission):

```
sudo more /root/.aws/envvars
AWS_ACCESS_KEY_ID=<key id>
AWS_SECRET_ACCESS_KEY=<access key>
AWS_DEFAULT_REGION=us-west-2
```

```
#!/bin/bash
AWS_CONFIG_ENV=/root/.aws/envvars
INSTANCE=$(/usr/bin/curl -s http://169.254.169.254/latest/meta-data/instance-id)
IMAGE=xueshanf/awscli:latest

CMD="aws elb register-instances-with-load-balancer \
    --load-balancer-name <elb name> --instances $INSTANCE "

docker pull $IMAGE
docker run --rm --env-file=$AWS_CONFIG_ENV $IMAGE /bin/bash -c "$CMD"
```
