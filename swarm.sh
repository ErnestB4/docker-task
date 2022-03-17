#!/bin/bash
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh
sudo systemctl start docker 
sudo systemctl enable docker 
systemctl status docker 

docker swarm join --token SWMTKN-1-39zm8eepum06xalw7ngyshtvkearh0nucmlpehsk8i7ciqul7q-9xmo5dboa5lvk420pab00adej 167.99.239.104:2377



docker service update \
--image=jenkins/jenkins:$1 \
--update-failure-action rollback \
jenkins_jenkins
