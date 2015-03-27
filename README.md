Docker awscli
=============

A container to run awcli and s3cmd. 

Examples
========

Rebuld images. This will upgrade the packages:

```
core@n1 docker build -t xueshanf/awscli:latest .
```

Check software versions:

```
core@n1 docker run --rm -i -t xueshanf/awscli aws --version
aws-cli/1.7.18 Python/2.7.6 Linux/3.19.0
```

```
core@n1 docker run --rm -i -t xueshanf/awscli 3cmd --version
s3cmd version 1.5.2
```

Copy data from s3 bucket to local file system:

```
/usr/bin/docker run --rm -v /var/apps:/apps xueshanf/awscli:latest aws s3 cp --recursive s3://<bucket>/apps/nginx/ /apps/nginx
```

Registry an AWS instance to load balancer:
```
#!/bin/bash
AWS_CONFIG_ENV=/root/.aws/envvars
INSTANCE=$(/usr/bin/curl -s http://169.254.169.254/latest/meta-data/instance-id)
IMAGE=xueshanf/awscli:latest

CMD="aws elb register-instances-with-load-balancer \
    --load-balancer-name <elb name>  --instances $INSTANCE "

# pull the IMAGE if not loaded
docker history $IMAGE > /dev/null 2>&1 || docker pull $IMAGE
docker run --rm --env-file=$AWS_CONFIG_ENV $IMAGE /bin/bash -c "$CMD"
```
