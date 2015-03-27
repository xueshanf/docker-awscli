Docker awscli
=============

A container to run awcli and s3cmd. One use case is to run the container to get data from s3 bucket to 
/apps directory and contains can mount /apps as data volume. 

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
