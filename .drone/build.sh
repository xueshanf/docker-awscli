#!/bin/bash
set -e  
cd /var/cache/drone/src/github.com/xueshanf/docker-awscli

# [pass tests here]

wrapdocker &
sleep 5

docker build -t 10.42.2.25:5000/xueshanf/awscli:latest .  
docker push 10.42.2.25:5000/xueshanf/awscli:latest .
