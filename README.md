Docker awscli
=============

An AWS CLI toolbox in container. See Dockerfile.

To check AWS cli version

```
docker run --rm  xueshanf/awscli aws --version
docker run --rm  xueshanf/awscli 3cmd --version 
```

Examples
========

Rebuld image. This will upgrade the package too:

```
core@n1 docker build -t xueshanf/awscli:latest .
```
This repo triggers auto-build and push images to dockerhub.com/u/xueshanf/awscli.

Readymade tools:

```
docker run --rm  xueshanf/awscli get-metadata help
```
```
docker run --rm  xueshanf/awscli get-metadata instanceid

```

Copy data from s3 bucket to local file system:

```
/usr/bin/docker run --rm -v /var/apps:/apps xueshanf/awscli:latest aws s3 cp --recursive s3://<bucket>/apps/nginx/ /apps/nginx
```

Registry an AWS instance to load balancer:

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
